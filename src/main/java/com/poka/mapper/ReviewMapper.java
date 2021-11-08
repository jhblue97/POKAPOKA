package com.poka.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.poka.domain.Criteria;
import com.poka.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getList(@Param("gno") String gno, @Param("cri") Criteria cri);

	public ReviewVO read(String rno);

	public int insert(ReviewVO vo);

	public int update(ReviewVO vo);

	public int delete(String rno);

}
