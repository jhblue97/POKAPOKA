package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.GradeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/grade/*") //브라우저에서 /grade/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class GradeController {
	
	//gradeAdd.jsp
	//등급 등록 화면
	@GetMapping("/add")
	public String add() {
		return null;
	}
	
	//등급 등록
	@PostMapping("/add")
	public String add(GradeVO vo) {
		return null;
	}
	
	//gradeUpdate.jsp
	//등급 수정 화면
	@GetMapping("/update")
	public String update() {
		return null;
	}
	
	//등급 수정
	@PostMapping("/update")
	public void update(GradeVO vo,RedirectAttributes rttr) {
		
	}
	
	//등급 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("gradeNo") String gradeNo,RedirectAttributes rttr) {

		return null;
	}
	
	//gradeList.jsp
	//등급 기준 조회 화면
	@GetMapping("/list")
	public String list() {
		return null;
	}
}