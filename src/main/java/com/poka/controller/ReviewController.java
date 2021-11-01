package com.poka.controller;

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

import com.poka.domain.ReviewPageDTO;
import com.poka.domain.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/review/")
@AllArgsConstructor
public class ReviewController {
	// 리뷰 서비스 클래스 가져오기

	// 리뷰 목록
	@GetMapping(value = "/pages/{gno}/{page}")
	public ResponseEntity<ReviewPageDTO> list(@PathVariable("page") int page, @PathVariable("gno") Long gno) {
		log.info("Load Reaview List"); // 동작 테스트용 로그

		return new ResponseEntity<>(null, HttpStatus.OK); // 리뷰 목록 반환
	}

	// 단일 리뷰 상세
	@GetMapping("/get")
	public ResponseEntity<ReviewVO> get(@PathVariable("rno") String rno) {
		return new ResponseEntity<>(null, HttpStatus.OK);

	}

	// 리뷰 등록
	@PostMapping(value = "/add", produces = { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> add(@RequestBody ReviewVO vo) {
		log.info("Create ReviewVO : " + vo);

		return null;
	}

	// 리뷰 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{rno}", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("principal.userId == #vo.writer") // 작성자 일치 확인
	public ResponseEntity<String> update(@RequestBody ReviewVO vo, @PathVariable("rno") String rno) {
		log.info("update Review"); // 동작 확인용

		return null;
	}

	// 리뷰 삭제
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("principal.userId == #vo.writer") // 작성자 일치 확인
	public ResponseEntity<String> delete(@RequestBody ReviewVO vo, @PathVariable("rno") String rno) {
		log.info("executing update"); //동작 확인용

		return null;
	}
}
