package com.poka.service;

import java.util.List;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;

public interface ReportService {	

	public int getTotal(Criteria cri);					//전체 게시물 수 반환
	
	public boolean modify(NijiVO niji);				//게시물 하나 수정
	
	public List<NijiVO> getList(Criteria cri);			//전체 게시물 목록 반환 - 페이징
	
    public int process(String rno); //신고 처리 
	
	public int addReport(BoardVO vo,String userid); //자유게시판 - 신고하기  userid (신고자)
	
}
