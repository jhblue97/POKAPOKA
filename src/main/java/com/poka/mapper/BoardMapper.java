package com.poka.mapper;

import java.util.List;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;

public interface BoardMapper {
	
	//전체 게시물 수 반환
	public int getTotalCount(Criteria cri);	
	
	//전체 게시물 목록 반환 - 페이징 처리
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	//전체 게시물 목록 반환
	public List<BoardVO> getList();
	
	//게시물 하나 수정
	public int update(BoardVO board);
	
	//게시물 하나 삭제
	public int delete(String bno);
	
	//게시물 하나 조회
	public BoardVO read(String bno);
	
	//게시물 등록 with select Key
	public Integer insertSelectKey(BoardVO board);
	
	//게시물 등록
	public void insert(BoardVO board);
}



















