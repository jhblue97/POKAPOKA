package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.ReviewVO;

public interface ReviewMapper {

	List<ReviewVO> getList(String gno, Criteria cri);

	ReviewVO read(String rno);

	int insert(ReviewVO vo);

	int update(ReviewVO vo);

	int delete(String rno);

}
