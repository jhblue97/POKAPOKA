package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;
import com.poka.domain.PayVO;

public interface PayMapper {

	//전체 게시물 수 반환
	public int getTotalCount(Criteria cri);	
	
	//전체 게시물 목록 반환 - 페이징 처리
	public List<PayVO> getListWithPaging(Criteria cri);
	
	//전체 게시물 목록 반환
	public List<PayVO> getList();
	
	//게시물 하나 조회
	public PayVO read(String nno);

	//게시물 등록
	public void insert(PayVO niji);
	
}
