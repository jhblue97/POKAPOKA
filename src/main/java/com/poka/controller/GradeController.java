package com.poka.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String add() {
		return null;
	}
	
	//등급 등록
	@PostMapping("/add")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String add(String admin, GradeVO vo, RedirectAttributes rttr) {
		return null;
	}
	
	//gradeUpdate.jsp
	//등급 수정 화면
	@GetMapping("/update")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String update(String admin, @RequestParam("gradeNo") String gradeNo) {
		return null;
	}
	
	//등급 수정
	@PostMapping("/update")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String update(String admin, GradeVO vo, RedirectAttributes rttr) {
		
		return null;
	}
	
	//등급 삭제
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String delete(String admin, @RequestParam("gradeNo") String gradeNo, RedirectAttributes rttr) {

		return null;
	}
	
	//gradeList.jsp
	//등급 기준 조회 화면
	@GetMapping("/list")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String list(String admin, Model model) {
		return null;
	}
}