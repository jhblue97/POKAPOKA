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

import com.poka.domain.Criteria;
import com.poka.domain.ReviewPageDTO;
import com.poka.domain.ReviewVO;
import com.poka.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/review/")
@AllArgsConstructor
public class ReviewController {
	// 리뷰 서비스 클래스 가져오기
	private ReviewService rService;

	// 리뷰 목록
	@GetMapping(value = "/pages/{gno}/{page}")
	public ResponseEntity<ReviewPageDTO> list(@PathVariable("page") int page, @PathVariable("gno") String gno) {
		log.info("Load Reaview List"); // 동작 테스트용 로그

		Criteria cri = new Criteria(page, 5);

		return new ResponseEntity<>(rService.getListPage(gno, cri), HttpStatus.OK); // 리뷰 목록 반환
	}

	// 단일 리뷰 상세
	@GetMapping("/{rno}")
	public ResponseEntity<ReviewVO> get(@PathVariable("rno") String rno) {
		log.info("get Review");

		// 단일 리뷰 반환
		return new ResponseEntity<>(rService.get(rno), HttpStatus.OK);

	}

	// 리뷰 등록
	@PostMapping(value = "/add", produces = { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> add(@RequestBody ReviewVO vo) {
		log.info("Create ReviewVO : " + vo);

		// 리뷰 등록 성공 시 200, 실패 시 500 반환 될 것.
		return rService.register(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 리뷰 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{rno}", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("principal.userId == #vo.writer") // 작성자 일치 확인
	public ResponseEntity<String> update(@RequestBody ReviewVO vo, @PathVariable("rno") String rno) {
		log.info("update Review"); // 동작 확인용
		vo.setRno(rno); // 혹시 몰라서 vo의 rno를 한번 더 정정해줌.

		// 리뷰 수정 성공 시 200, 실패 시 500 반환
		return rService.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 리뷰 삭제
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	@PreAuthorize("principal.userId == #vo.writer") // 작성자 일치 확인
	public ResponseEntity<String> delete(@RequestBody ReviewVO vo, @PathVariable("rno") String rno) {
		log.info("executing update"); // 동작 확인용

		return rService.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
