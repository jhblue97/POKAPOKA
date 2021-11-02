package com.poka.mapper;

import java.util.List;

import com.poka.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public List<BoardAttachVO> getOldFiles();		//기존 첨부파일 목록
	
	public void deleteAll(String bno);				//첨부파일 모두 삭제 
	public void insert(BoardAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public List<BoardAttachVO> findByBno(String bno);	//첨부파일

}
