package com.poka.mapper;

import com.poka.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public BoardAttachVO getOldFile();			//기존 첨부파일
	public void insert(BoardAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public BoardAttachVO findByBno(String bno);	//첨부파일

}
