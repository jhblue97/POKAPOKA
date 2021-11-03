package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.NijiTagVO;
import com.poka.domain.NijiVO;

public interface NijiMapper {

	//전체 게시물 수 반환
	public int getTotalCount(Criteria cri);	
	
	//전체 게시물 목록 반환 - 페이징 처리
	public List<NijiVO> getListWithPaging(Criteria cri);
	
	//전체 게시물 목록 반환
	public List<NijiVO> getList();
	
	//게시물 하나 수정
	public int update(NijiVO niji);
	
	//게시물 하나 삭제
	public int delete(String nno);
	
	//게시물 하나 조회
	public NijiVO read(String nno);

	//게시물 등록
	public void insert(NijiVO niji);
	
	public List<NijiTagVO> getTag(String nno);
	
	
}
