package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;
import com.poka.domain.PayVO;
import com.poka.domain.ReportVO;

public interface ReportMapper {

	//전체 게시물 수 반환
	public int getTotalCount(Criteria cri);	
	
	//전체 게시물 목록 반환 - 페이징 처리
	public List<ReportVO> getListWithPaging(Criteria cri);
	
	//전체 게시물 목록 반환
	public List<ReportVO> getList();
	
	//신고 처리
	public int update(String rno);
	
	//신고 등록
	public int insert(ReportVO reportvo);
	
}