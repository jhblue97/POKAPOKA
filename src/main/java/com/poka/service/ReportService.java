package com.poka.service;

import java.util.List;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.GradeVO;
import com.poka.domain.NijiVO;
import com.poka.domain.ReportVO;

public interface ReportService {	

	public int getTotal(Criteria cri);					//전체 게시물 수 반환
		
	public List<ReportVO> getList(Criteria cri);			//전체 게시물 목록 반환 - 페이징
	
    public void process(String bno); //신고 처리 
	
	public void addReport(String rno,String reporter,String status,String writer,String category); //자유게시판 - 신고하기  userid (신고자)
	
	public List<ReportVO> getList2(String bno); //등급 기준 목록 조회
}
