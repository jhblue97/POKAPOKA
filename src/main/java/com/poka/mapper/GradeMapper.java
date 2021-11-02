package com.poka.mapper;

import java.util.List;

import com.poka.domain.GradeVO;

public interface GradeMapper {

	public int insert(GradeVO vo);						//등급 등록
	public int update(GradeVO vo);						//등급 수정
	public int delete(String grade_code);				//등급 삭제
	public GradeVO read(String grade_code);				//등급 상세
	public List<GradeVO> getList();		
}
