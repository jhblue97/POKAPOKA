package com.poka.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poka.domain.FollowVO;
import com.poka.service.FollowService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/follow/*") //브라우저에서 /follow/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class FollowController {
	
	FollowService followService;
	//팔로우 조회 화면
	@GetMapping(value="list1/{userid}")					
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<List<FollowVO>> list1(@PathVariable("userid") String userid) {
		return new ResponseEntity<>(followService.followList(userid), HttpStatus.OK);
	
	}
	
	//팔로우 삭제 
	@GetMapping(value="/{fno}",
			 produces= { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> delete(@PathVariable("fno") String fno) {
		
		return followService.delete(fno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//팔로워 조회 화면
	@GetMapping(value="list2/{userid}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<List<FollowVO>> list2(@PathVariable("userid") String userid) {
		return new ResponseEntity<>(followService.followerList(userid), HttpStatus.OK);
	}
	
	//팔로우 추가
	@GetMapping(value="/new",
			 produces= { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> add(@PathVariable("userid") String userid) {
		
		
		return null;
	}
	
	//팔로우 체크
	@RequestMapping(method = RequestMethod.GET, value = "/chk")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> chk(@RequestBody FollowVO vo) {

		return null;
	}
	
}
