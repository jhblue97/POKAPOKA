package com.poka.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.AttachVO;
import com.poka.domain.GradeVO;
import com.poka.service.GradeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/grade/*") //브라우저에서 /grade/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class GradeController {
	
	private GradeService gradeService;
	
	//gradeAdd.jsp
	//등급 등록 화면
	@GetMapping("/add")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String add() {
		log.info(".....add().....");
				
		return "/grade/gradeAdd";
	}
	//등급 등록
	@PostMapping("/add")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String add(String admin, GradeVO grade, RedirectAttributes rttr) {
		log.info(".....add().....");
		
		gradeService.add(grade);
		return "redirect:/grade/list";
	}
		
	//등급 삭제
	@GetMapping("/delete")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String delete(String admin, @RequestParam("grade_code") String grade_code, Model model) {
		log.info(".....delete().....");
		gradeService.delete(grade_code);
		return "redirect:/grade/list";
	}
	
	//첨부파일 삭제
	public void deleteFile(String filename) {
		try {
			Path file = Paths.get("c:\\upload\\" + filename);
			Files.deleteIfExists(file);	//파일이 존재하면 삭제
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//gradeUpdate.jsp
	//등급 수정 화면
	@GetMapping("/update")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String update(String admin, @RequestParam("grade_code") String grade_code, Model model) {
		model.addAttribute("grade", gradeService.get(grade_code));
		return "/grade/gradeUpdate";
	}
	
	//등급 수정
	@PostMapping("/update")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String update(String admin, GradeVO grade, RedirectAttributes rttr) {
		gradeService.modify(grade);
		return "redirect:/grade/list";
	}
	
	//gradeList.jsp
	//등급 기준 조회 화면
	@GetMapping("/list")
	@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인
	public String list(String admin, Model model) {
		model.addAttribute("list", gradeService.getList());
		return "/grade/gradeList";
	}
}