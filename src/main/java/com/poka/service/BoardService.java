package com.poka.service;

import java.util.List;

import com.poka.domain.BoardAttachVO;
import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.GradeVO;

public interface BoardService {
	public List<BoardAttachVO> getAttachList(String bno);	//첨부파일 목록 반환
	public int getTotal(Criteria cri);			//전체 게시물 수 반환
	public boolean modify(BoardVO board);		//게시물 하나 수정
	public boolean delete(String bno);			//게시물 하나 삭제
	public BoardVO get(String bno);				//게시물 하나 조회
	public void add(BoardVO board);				//게시물 등록 with select Key
	public List<BoardVO> getList(Criteria cri);	//전체 게시물 목록 반환 - 페이징
}
