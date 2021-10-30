package com.poka.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poka.domain.ReviewPageDTO;
import com.poka.domain.ReviewVO;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

@Log4j
@Controller
@RequestMapping("/reviews/*")
@AllArgsConstructor
public class ReviewController {

	// 리뷰 목록
	@GetMapping(value="/pages/{gno}/{page}")
	public ResponseEntity<ReviewPageDTO> list(@PathVariable("page") int page, 
			@PathVariable("gno") Long gno) {
	return new ResponseEntity<>(null,
				HttpStatus.OK);
	}

	// 단일 리뷰 상세
	@GetMapping({ "/get", "/update" })	
	public ResponseEntity<ReviewVO> get() {
		return new ResponseEntity<>(null,HttpStatus.OK);

	}

	// 리뷰 등록
	@PostMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public String add() {

		
		return null;
	}

	// 리뷰 수정
	@PostMapping("/update")
	@PreAuthorize("principal.username == #writer") //작성자 확인
	public String update() {

		return null;
	}

	// 리뷰 삭제
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #writer") //작성자 확인
	public String delete() {
		
		return null;
	}
}
