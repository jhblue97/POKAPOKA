package com.poka.mapper;

import com.poka.domain.NijiAttachVO;

public interface NijiAttachMapper {
	public NijiAttachVO getOldFile();			//기존 첨부파일
	
	public void deleteAll(String bno);			//첨부파일 모두 삭제 
	public void insert(NijiAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public NijiAttachVO findByBno(String bno);	//첨부파일

}
