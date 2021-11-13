package com.poka.mapper;

import java.util.List;
import java.util.Map;

import com.poka.domain.Criteria;
import com.poka.domain.ReportVO;

public interface ReportMapper {

	//전체 게시물 수 반환
	public int getTotalCount(Criteria cri);	
	
	//전체 게시물 목록 반환 - 페이징 처리
	public List<ReportVO> getListWithPaging(Criteria cri);
	
	//전체 게시물 목록 반환
	public List<ReportVO> getList();
	
	//신고 처리
	public void process(String bno);
	
	//신고 등록
	public void insert(Map<String,String> map);
	
}
