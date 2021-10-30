package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/game/*")
@AllArgsConstructor
public class GameController {

	
	@GetMapping("/list")
	// 게임 목록 - 메인화면
	public String list(Criteria cri, Model model) {
		
		return null;
	}
	
	@GetMapping("/")
	// 게임 상세 화면
	public String get() {
		//gno 
		
		return null;
		
	}
	
}
