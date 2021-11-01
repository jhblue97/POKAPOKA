package com.poka.mapper;

import com.poka.domain.GradeAttachVO;

public interface GradeAttachMapper {

	public GradeAttachVO getOldFile();			//기존 첨부파일
	public void insert(GradeAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public GradeAttachVO findByBno(String grade_code);	//첨부파일
}
