package com.poka.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.Criteria;
import com.poka.domain.GameVO;
import com.poka.service.GameService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({ "/", "/game/*" })
@AllArgsConstructor
public class GameController {
	// 게임 서비스 클래스 가져오기
	private GameService gService;

	@GetMapping({ "", "/list" })
	// 게임 목록 - 메인화면
	public String list(Criteria cri, Model model) {
		log.info("메인 - 게임 목록 출력"); // 실행 확인용 로그
		model.addAttribute("list", gService.getList(cri));
		// 무한 스크롤 페이징?
		System.out.println(gService.getList(cri));
		return "/game/main";
	}

	@GetMapping("/get/{gno}")
	// 게임 상세 화면
	// gno 받아와서 MODEL에 담아줄 것.
	public String get(@PathVariable("gno") String gno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("게임 상세 페이지 출력"); // 실행 확인용 로그
		model.addAttribute("game", gService.get(gno));

		return "/game/gameView";
	}

	// 리더
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	// 스팀 앱목록 DB업데이트
	@GetMapping("/getAppList")
	public String getAppList(Criteria cri, Model model) {
		GameVO vo;
		List<GameVO> list = new ArrayList<GameVO>();

		URL url; // 앱 리스트 URL
		// URL url2; // 앱 디테일 URL

		try {
			// 스팀 API에서 가져올 경우
			url = new URL("https://api.steampowered.com/ISteamApps/GetAppList/v2/");
			// 스팀 스파이 통해서 랭킹만 가져올 경우
			URL url_ = new URL("https://steamspy.com/api.php?request=top100in2weeks");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			HttpURLConnection conn_ = (HttpURLConnection) url_.openConnection();

			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestMethod("GET");

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			BufferedReader in_ = new BufferedReader(new InputStreamReader(conn_.getInputStream()));

			// URL 내용 읽어오기
			String jsonText = readAll(in);
			// String to JSON
			JSONObject json = new JSONObject(jsonText);
			//System.out.println(json);

			// 스팀 API 에서 가져올 경우
			// appList 안의 apps를 가져옴
			JSONObject json2 = (JSONObject) json.get("applist");
			// apps 안의 데이터들을 배열로 끊어줌
			JSONArray jsonArr = (JSONArray) json2.get("apps");

			// 스팀 스파이 통해서 가져올 경우
//			JSONParser parser = new JSONParser(in_);
//			JSONObject jsonObj = (JSONObject) parser.parse(in_);
//			System.out.println(jsonObj);

			System.out.println("jsonArr.size :: " + jsonArr.length());

			for (int i = 0; i < jsonArr.length(); i++) {
				// JSON 배열에서 i 번째에 있는 객체를 반환해옴
				JSONObject tmp = (JSONObject) jsonArr.get(i);
				// tmp 안에서 appid 만 읽어옴
				int appid = (int) tmp.get("appid");

				// 읽어온 appid를 바탕으로 appdetails에 접근함.
				URL url2;
				url2 = new URL("https://store.steampowered.com/api/appdetails?appids=" + appid);
				HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

				conn2.setRequestProperty("Content-Type", "application/json");
				conn2.setRequestMethod("GET");

				BufferedReader in2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));

				// URL 내용을 버퍼드 리더를 통하여 스트링으로 받았음.
				String jsonText2 = readAll(in2);

				JSONObject json_ = new JSONObject(jsonText2);
				// System.out.println("json_[" + i + "] : " + json_);

				JSONObject json_2 = (JSONObject) json_.get(appid + "");
				// System.out.println("json_2 : " + json_2);
				if (json_2.has("data")) {
					JSONObject data = (JSONObject) json_2.get("data");
					// System.out.println("data : " + data);
					String type = "";
					type = data.getString("type");

					if (type.equals("game")) {
						/* 이용될 변수들 --------------------------------------------------------------- */
						vo = new GameVO();
						String game_img = data.getString("header_image"); // String
						String gameNm = data.getString("name"); // String
						String game_des = data.getString("detailed_description"); // String
						String game_company = ""; // 개발사
						String game_age = ""; // 이용연령
						String regDate = ""; // 등록일
						String game_price = ""; // 가격
						/* ------------------------------------------------------------------------- */

						// 개발사 유무 체크
						if (data.has("developers")) {
							game_company = (String) ((JSONArray) data.get("developers")).get(0);
						}

						// 연령 유무 체크
						if (data.has("required_age")) {
							Object ageData = data.get("required_age");
							if (ageData instanceof Integer) {
								// Integer 타입으로 들어오면 스트링으로
								game_age = Integer.toString((int) data.get("required_age"));
							} else if (ageData instanceof String) {
								// String 이면 그냥 반환
								game_age = (String) data.get("required_age");
							}
						}

						// 릴리즈 데이트 유무 체크
						if (data.has("release_date")) {
							// (d Mth, yyyy) 형태의 String인데 그냥 문자열로 받아서 뿌려줄것. 예외가 너무 많아서 잘 안됨.
							regDate = (String) (((JSONObject) data.get("release_date")).get("date"));
							// 출시 예정 체크
							if ((boolean) ((JSONObject) data.get("release_date")).get("coming_soon")) {
								regDate = "출시 예정일 : " + regDate;
								game_price = "미정";
							}
						}

						// 유무료 체크
						if ((boolean) data.get("is_free")) {
							game_price = "무료";
						} else { // 유료인 경우
							if (data.has("price_overview")) {
								System.out.println("가격 있음.");
//								game_price = Integer.toString(
//										((int) ((JSONObject) data.get("price_overview")).get("initial")) / 100) + "원";
								// 특문 포함
								game_price = (String) ((JSONObject) data.get("price_overview")).get("final_formatted");
							}
						}

						/*
						 * // 받아온 String을 파싱해서 Date 타입으로 바꿔줄거임. SimpleDateFormat sdf = new
						 * SimpleDateFormat("d MMM, yyyy", Locale.US); java.util.Date regDate =
						 * sdf.parse(release_date); // Date 타입으로 바꿔준 것을 다시 포맷 변화시킴. SimpleDateFormat
						 * sdf2 = new SimpleDateFormat("yyyy-MM-dd"); String regDate_string =
						 * sdf2.format(regDate); // 포맷 변환시킨 것을 다시 Date타입으로 파싱 regDate =
						 * sdf2.parse(regDate_string);
						 */
						//
//						SimpleDateFormat dtFormat = new SimpleDateFormat("dd MM, yyyy");
						//
//						String[] aaa = release_date.split(" ");
//						String dd = "";
//						String mm = "";
//						String yyyy = "";
						//
//						for (int k = 0; k < aaa.length; k++) {
//							if (k == 0) {
//								dd = aaa[k];
//							}
//							if (k == 1) {
//								mm = aaa[k];
//							}
//							if (k == 2) {
//								yyyy = aaa[k];
//							}
						//
//						}
						//
//						SimpleDateFormat format = new SimpleDateFormat("yyyy-MMM-d", Locale.US);
//						java.util.Date date_ = format.parse(yyyy + "-" + mm.substring(0, mm.length() - 1) + "-" + dd);
//						System.out.println("date :::: " + date_);
						//
//						java.util.Date formatDate = dtFormat.parse(release_date);
//						System.out.println("formatDate::" + formatDate);

						// vo 값 세팅
						vo.setGameId(Integer.toString(appid));
						vo.setGame_img(game_img);
						vo.setGameNm(gameNm);
						vo.setGame_price(game_price);
						vo.setGame_des(game_des);
						vo.setGame_company(game_company);
						vo.setGame_url("https://store.steampowered.com/app/" + appid);
						vo.setGame_age(game_age);
						vo.setRegDate(regDate);

						// VO 출력
						System.out.println(vo);

						// DB에 추가
						gService.registerList(vo);
					} else {
						System.out.println("---");
						try {
							Thread.sleep(300); // 1초 대기
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				} else {
					System.out.println("NoData");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// list 전달.
		// model.addAttribute("list", list);
		// System.out.println(list);

		System.out.println("Load Ended");
		return "redirect:/game/main";
		// return "/game/main2";

	}

}
