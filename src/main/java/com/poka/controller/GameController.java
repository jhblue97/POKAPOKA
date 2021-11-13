package com.poka.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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

	// 스팀 앱목록
	@GetMapping("/getAppList")
	public void getAppList() {
		URL url;
		try {
			url = new URL("https://api.steampowered.com/ISteamApps/GetAppList/v2/");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestMethod("GET");

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String jsonText = readAll(in);
			JSONObject json = new JSONObject(jsonText);

			JSONObject json2 =  (JSONObject) json.get("applist");
			
			JSONArray jsonArr2 = (JSONArray) json2.get("apps");

			System.out.println("jsonArr2.size :: "+jsonArr2.length());
			

			  for (int i = 0; i < 50; i++) { 
				  
				  JSONObject tmp = (JSONObject)jsonArr2.get(i);
				  
				  int appid = (int) tmp.get("appid");
				  
				  	System.out.println(appid);
				  	URL url2;
				  	url2 = new URL("https://store.steampowered.com/api/appdetails?appids="+appid);
					HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

					conn2.setRequestProperty("Content-Type", "application/json");
					conn2.setRequestMethod("GET");

					BufferedReader in2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
					
					String jsonText2 = readAll(in2);
					JSONObject json_ = new JSONObject(jsonText2);

					JSONObject json_2 =  (JSONObject) json_.get(appid+"");
			
					System.out.println(json_2);
					
					//JSONObject json_3 =  (JSONObject) json_2.get("data");
					
					//System.out.println("name :::: "+json_3.get("name"));
				  	
			  }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    return sb.toString();
	  }


}
