package com.poka.mapper;

import java.util.List;
import java.util.Map;

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
	
	public int update2(NijiVO niji);
	
	//게시물 하나 삭제
	public int delete(String nno);
	
	public int deleteTag(String nno);
	
	
	//게시물 하나 조회
	public NijiVO read(String nno);

	//게시물 등록
	public void insert(NijiVO niji);
	
	public List<NijiTagVO> getTag(String nno);
	
	//마지막 시퀀스 찾기
	public int getLastSeq();
	
	//게시물 등록
	public void insertTag(Map<String,String> map);
	
}
