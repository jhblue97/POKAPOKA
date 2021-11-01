package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getList(String gno, Criteria cri);

	public ReviewVO read(String rno);

	public int insert(ReviewVO vo);

	public int update(ReviewVO vo);

	public int delete(String rno);

}
