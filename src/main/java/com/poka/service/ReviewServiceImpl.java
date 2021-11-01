package com.poka.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.Criteria;
import com.poka.domain.ReviewPageDTO;
import com.poka.domain.ReviewVO;
import com.poka.mapper.GameMapper;
import com.poka.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper rMapper;

	@Setter(onMethod_ = @Autowired)
	private GameMapper gMapper;

	@Override
	public ReviewPageDTO getListPage(String gno, Criteria cri) {
		// 페이징 처리된 리뷰 리스트를 반환
		return new ReviewPageDTO(rMapper.getList(gno, cri));
	}

	@Override
	public ReviewVO get(String rno) {
		// 단일 리뷰 반환
		return rMapper.read(rno);
	}

	@Transactional
	@Override
	public int register(ReviewVO vo) {
		// 리뷰 등록
		return rMapper.insert(vo);
	}

	@Transactional
	@Override
	public int modify(ReviewVO vo) {
		// 리뷰 수정
		return rMapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(String rno) {
		// 리뷰 삭제
		return rMapper.delete(rno);
	}

}
