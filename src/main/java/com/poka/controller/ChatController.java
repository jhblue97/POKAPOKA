package com.poka.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/chat/*") //브라우저에서 /board/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor

public class ChatController {

 
		@GetMapping( "/invite")
		public ResponseEntity invite(@RequestParam("userid") String a_userid, @RequestParam("p_userid") String p_userid,Model model) {
			return null;
		}
		
		@GetMapping( "/createRoom")
		public ResponseEntity createRoom(@RequestParam("userid") String a_userid, @RequestParam("p_userid") String p_userid,Model model) {
			return null;
		}
		
		@PostMapping( "/message")
		public ResponseEntity message(@RequestParam("userid") String a_userid, @RequestParam("p_userid") String p_userid,@RequestParam("msg") String msg,Model model) {
			return null;
		}
		
		@GetMapping( "/findRoom")
		public ResponseEntity findRoom(@RequestParam("userid") String a_userid, @RequestParam("p_userid") String p_userid,Model model) {
			return null;
		}
		
	
}
