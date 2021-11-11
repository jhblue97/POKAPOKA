package com.poka.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poka.domain.Criteria;
import com.poka.domain.PageDTO;
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
		public void list(Criteria cri, Model model) {
		
			
		}
			 
		//신고 처리
		@GetMapping( value="/process/{rno}/{status}")
		public ResponseEntity<String> get(@PathVariable("rno") String rno,@PathVariable("status") String status) {
			log.info("process....()");
			
			int aa = reportService.process(rno,status);
			return new ResponseEntity<String>("success", HttpStatus.OK);
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
