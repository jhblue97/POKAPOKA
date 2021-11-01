package com.poka.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poka.domain.FollowVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/follow/*") //브라우저에서 /follow/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class FollowController {
	

	//팔로우 조회 화면
	@GetMapping("/list1/{userid}")					
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<FollowVO> list1(@PathVariable("userid") String userid) {
		
		return new ResponseEntity<>(null, HttpStatus.OK);
	
	}
	
	//팔로우 삭제 ajax
	@PostMapping("/delete/{userid}/{fno}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> delete(@PathVariable("userid") String userid, @PathVariable("fno") String fno) {
		
		return null;
	}
	
	//팔로워 조회 화면
	@GetMapping("/list2/{userid}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<FollowVO> list2(@PathVariable("userid") String userid) {
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
	//팔로우 추가
	@PostMapping("/add/{a_userid}/{p_userid}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> add(@PathVariable("a_userid") String a_userid, @PathVariable("p_userid") String p_userid) {
		
		
		return null;
	}
	
	//팔로우 체크 ajax
	@RequestMapping(method = RequestMethod.GET, value = "/chk/{p_userid}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> chk(@RequestBody FollowVO vo, @PathVariable("p_userid") String p_userid) {

		return null;
	}
	
}
