package com.poka.service;

import java.util.List;

import com.poka.domain.GradeVO;

public interface GradeService {

	public void add(GradeVO vo);				//등급 등록
	public boolean modify(GradeVO vo);						//등급 수정
	public boolean delete(String grade_code);				//등급 삭제
	public GradeVO get(String grade_code);				//등급 상세
	public List<GradeVO> getList();						//등급 기준 목록 조회
	
}
