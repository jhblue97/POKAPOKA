package com.poka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poka.domain.Criteria;
import com.poka.domain.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@RequestMapping("/report/*")
@AllArgsConstructor
public class ReportController {

		//신고 목록 조회
		@GetMapping("/list")
		public void list(Criteria cri, Model model) {
		
			
		}
			
		//신고 처리
		@GetMapping({ "/process" })
		public boolean get(@RequestParam("bno") Long bno, @RequestParam("bno") Long rno, 
						@ModelAttribute("cri") Criteria cri,
						Model model) {
			log.info("process....()");
		
			return false;
		}
		
	
		
	
}
