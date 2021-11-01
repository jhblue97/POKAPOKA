package com.poka.service;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.PayAttachVO;
import com.poka.domain.PayVO;

public interface PayService {	

	public PayAttachVO getAttach(String pno);
	public int getTotal(Criteria cri);					//전체 게시물 수 반환
	public PayVO get(String bno);						//게시물 하나 조회
	public void add(PayVO board);			        	//게시물 등록 with select Key
	public List<PayVO> getList(Criteria cri);	        //전체 게시물 목록 반환 - 페이징

	
}
