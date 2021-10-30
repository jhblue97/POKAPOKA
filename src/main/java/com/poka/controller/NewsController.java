package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/news/*")
@AllArgsConstructor
public class NewsController {

	@GetMapping("/list")
	// 뉴스 목록 조회
	public String list(Criteria cri, Model model) {
 
		return null;
	}

	@GetMapping("/get")
	// 뉴스 상세 조회
	public String get() {

		return null;
	}
}
