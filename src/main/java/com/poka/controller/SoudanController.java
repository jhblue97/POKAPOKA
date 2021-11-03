package com.poka.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;
import com.poka.service.SoudanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/soudan/*")
@AllArgsConstructor
public class SoudanController {
	private SoudanService qService;

	@GetMapping("/list")
	// 상담 목록
	public String list(Criteria cri, Model model) {
		log.info("상담 목록 조회"); // 동작 확인용

		model.addAttribute("list", qService.getList(cri));

		return "/soudan/soudanList";
	}

	@GetMapping("/get/{qno}")
	// 상담 상세
	public String get(@PathVariable("qno") String qno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("상담 단일 조회");

		model.addAttribute("qna", qService.get(qno));

		return "/soudan/soudanView";
	}

	@GetMapping("/answer")
	//@PreAuthorize("isAuthenticated()")
	// 상담 질문 등록 화면
	public void answer() {
	}

	// 상담 질문 등록 처리
	@PostMapping("/answer")
	//@PreAuthorize("isAuthenticated()")
	public String answer(SoudanVO qna, RedirectAttributes rttr) {
		log.info("Regist answer");

		if (qService.register(qna) == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/soudan/list";
	}

	@PostMapping("/question")
	//@PreAuthorize("ROLE_ADMIN")
	// 상담 답변 등록 - 응용된 업데이트
	// public String question(@PathVariable("qno") String qno, SoudanVO qna,
	// @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr)
	public String question(SoudanVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("Regist Question");

		if (qService.modify(qna) == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/soudan/get";
	}
}
