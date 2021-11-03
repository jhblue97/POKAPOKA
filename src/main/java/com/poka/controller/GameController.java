package com.poka.controller;

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
@RequestMapping("/game/*")
@AllArgsConstructor
public class GameController {
	// 게임 서비스 클래스 가져오기
	private GameService gService;

	@GetMapping("/list")
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

}
