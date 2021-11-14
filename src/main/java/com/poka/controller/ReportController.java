package com.poka.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poka.domain.Criteria;
import com.poka.domain.PageDTO;
import com.poka.domain.ReportVO;
import com.poka.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@RequestMapping("/report/*")
@AllArgsConstructor
public class ReportController {

	private ReportService reportService;
	
		//신고 목록 조회
		@GetMapping("/list")
		@PreAuthorize("hasRole('ROLE_ADMIN')")		//관리자 확인	
		public String list(Criteria cri, Model model) {
			
			model.addAttribute("list",reportService.getList(cri));
			return "/report/reportList";
		}
			 
		//신고 처리
		@GetMapping( value="/process/{bno}")
		public String process(@PathVariable("bno") String bno) {
			log.info("process....()");
			
			 reportService.process(bno);
			return "redirect:/report/list";
		}
		

		//신고 처리
		@GetMapping( value="/list/{bno}")
		public ResponseEntity<List<ReportVO>> list2(@PathVariable("bno") String bno) {	
			
			log.info("process....()");			
			return new ResponseEntity<List<ReportVO>>(reportService.getList2(bno), HttpStatus.OK);
		}
		
		
	
		//신고 처리
		@GetMapping( value="/add/{bno}/{reporter}/{status}/{writer}/{category}")
		public ResponseEntity<String> add(@PathVariable("bno") String bno,@PathVariable("reporter") String reporter,@PathVariable("status") String status,@PathVariable("writer") String writer,@PathVariable("category") String category) {
			
			log.info("process....()");
			
			System.out.println("????"+bno);
			reportService.addReport(bno,reporter,status,writer,category);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		
		
	
}
