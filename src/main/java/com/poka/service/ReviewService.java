package com.poka.service;

import com.poka.domain.Criteria;
import com.poka.domain.ReviewPageDTO;
import com.poka.domain.ReviewVO;

public interface ReviewService {
	// 페이징 포함한 리뷰 목록
	public ReviewPageDTO getListPage(String gno, Criteria cri);

	// 리뷰 단일 조회
	public ReviewVO get(String rno);

	// 리뷰 등록
	public int register(ReviewVO vo);

	// 리뷰 수정
	public int modify(ReviewVO vo);

	// 리뷰 삭제
	public int remove(String rno);

}