package com.poka.service;

import java.util.List;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;
import com.poka.domain.ReportVO;

public interface ReportService {	

	public int getTotal(Criteria cri);					//전체 게시물 수 반환
		
	public List<ReportVO> getList(Criteria cri);			//전체 게시물 목록 반환 - 페이징
	
    public int process(String rno,String status); //신고 처리 
	
	public void addReport(String rno,String reporter,String status,String writer,String category); //자유게시판 - 신고하기  userid (신고자)
	
}
