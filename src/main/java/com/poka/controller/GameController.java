package com.poka.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.Criteria;
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

	// 스팀 앱목록
	@GetMapping("/getAppList")
	public void getAppList() {
		URL url; // 앱 리스트 URL
		// URL url2; // 앱 디테일 URL

		try {
			url = new URL("https://api.steampowered.com/ISteamApps/GetAppList/v2/");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestMethod("GET");

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			// URL 내용 읽어오기
			String jsonText = readAll(in);
			// String to JSON
			JSONObject json = new JSONObject(jsonText);
			// appList 안의 apps를 가져옴
			JSONObject json2 = (JSONObject) json.get("applist");
			// apps 안의 데이터들을 배열로 끊어줌
			JSONArray jsonArr = (JSONArray) json2.get("apps");

			System.out.println("jsonArr.size :: " + jsonArr.length());

			for (int i = 0; i < 10; i++) {

				// JSON 배열에서 i 번째에 있는 객체를 반환해옴
				JSONObject tmp = (JSONObject) jsonArr.get(i);
				// tmp 안에서 appid 만 읽어옴
				int appid = (int) tmp.get("appid");

				System.out.println(appid);

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
				System.out.println("json_[" + i + "] : " + json_);

				JSONObject json_2 = (JSONObject) json_.get(appid + "");
				System.out.println("json_2 : " + json_2);
				if (json_2.has("data")) {
					JSONObject data = (JSONObject) json_2.get("data");
					System.out.println("data : " + data);

					String header_image = data.getString("header_image"); // String
					String gameNm = data.getString("name"); // String
					String detailed_description = data.getString("detailed_description"); // String
					String developers = (String) ((JSONArray) data.get("developers")).get(0); // JSONArray
					// Integer 타입으로 들어옴 따라서 String화
					String required_age = Integer.toString((int) data.get("required_age"));
					// (d Mth, yyyy) 형태의 String YYYYMMDD
					String release_date = (String) ((JSONObject) data.get("release_date")).get("date");
					// 받아온 String을 Date 타입으로 바꿔줄거임.

					SimpleDateFormat sdf = new SimpleDateFormat("d MMM, yyyy", Locale.US);
					Date regDate = (Date) sdf.parse(release_date);
					java.util.Date date = new java.util.Date();

					// String aaa = sdf.format(date);

					// Date regDate = (Date) sdf.parse(release_date);

					SimpleDateFormat dtFormat = new SimpleDateFormat("dd MM, yyyy");

					String[] aaa = release_date.split(" ");
					String dd = "";
					String mm = "";
					String yyyy = "";

					for (int k = 0; k < aaa.length; k++) {
						if (k == 0) {
							dd = aaa[k];
						}
						if (k == 1) {
							mm = aaa[k];
						}
						if (k == 2) {
							yyyy = aaa[k];
						}

					}

					SimpleDateFormat format = new SimpleDateFormat("yyyy-MMM-d", Locale.US);
					java.util.Date date_ = format.parse(yyyy + "-" + mm.substring(0, mm.length() - 1) + "-" + dd);
					System.out.println("date :::: " + date_);

					java.util.Date formatDate = dtFormat.parse(release_date);
					System.out.println("formatDate::" + formatDate);

					System.out.println("game_img : " + header_image);
					System.out.println("gameNm : " + gameNm);
					System.out.println("game_des : " + detailed_description);
					System.out.println("game_company : " + developers);
					System.out.println("game_age : " + required_age);
					System.out.println("regDate : " + regDate);

				} else {
					System.out.println("NoData");
				}
				// JSONObject json_3 = (JSONObject) json_2.get("data");

				// System.out.println("name :::: "+json_3.get("name"));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
