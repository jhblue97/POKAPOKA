package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/soudan/*")
@AllArgsConstructor
public class SoudanController {

	@GetMapping("/list")
	// 상담 목록
	public void list(Criteria cri, Model model) {

	}

	@GetMapping({ "/get", "/question" })
	// 상담 상세
	public void get() {

	}

	@GetMapping("/answer")
	// 상담 질문 등록 화면
	public void answer() {

	}

	// 상담 질문 등록 처리
	@PostMapping("/answer")
	public String answer(SoudanVO qna, RedirectAttributes rttr) {

		return "redirect:/soudan/list";
	}

	@PostMapping("/question")
	// 상담 답변 등록 - 업데이트
	public String question(SoudanVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		return "redirec:/soudan/get";
	}
}
