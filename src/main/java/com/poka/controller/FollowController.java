package com.poka.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poka.domain.FollowDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/follow/*") //브라우저에서 /follow/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class FollowController {
	

	//팔로우 조회 화면
	@GetMapping("/list1")
	public ResponseEntity<FollowDTO> list1 (@PathVariable("userno") String userno) {
		
		return new ResponseEntity<>(null, HttpStatus.OK);
	
	}
	
	//팔로우 삭제 ajax
	@PostMapping("/delete")
	public ResponseEntity<String> delete() {
		
		return null;
	}
	
	//팔로워 조회 화면
	@GetMapping("/list2")
	public ResponseEntity<FollowDTO> list2 (@PathVariable("userno") String userno) {
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
	//팔로우 추가
	@PostMapping("/add")
	public ResponseEntity<String> add() {
		
		
		return null;
	}
	
	//팔로우 체크 ajax
	@GetMapping("/chk")
	public ResponseEntity<String> chk() {

		return null;
	}
	
}
