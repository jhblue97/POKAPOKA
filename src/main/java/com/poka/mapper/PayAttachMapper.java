package com.poka.mapper;

import com.poka.domain.PayAttachVO;

public interface PayAttachMapper {
	public PayAttachVO getOldFile();			//기존 첨부파일
	
	public void deleteAll(String pno);			//첨부파일 모두 삭제 
	public void insert(PayAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public PayAttachVO findByBno(String pno);	//첨부파일

}
