package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/news/*")
@AllArgsConstructor
public class NewsController {

	// 뉴스 목록 조회
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("뉴스 목록 조회"); // 동작 확인용

		return null;
	}

	// 뉴스 상세 조회
	@GetMapping("/get/{news_no}")
	public String get(@PathVariable("news_no") String news_no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("뉴스 상세 조회"); // 동작 확인용

		return null;
	}
}
