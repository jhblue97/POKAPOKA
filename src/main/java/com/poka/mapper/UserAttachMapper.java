package com.poka.mapper;

import com.poka.domain.UserAttachVO;

public interface UserAttachMapper {

	public UserAttachVO getOldFile();			//기존 첨부파일
	public void insert(UserAttachVO vo);		//첨부파일 등록
	public void delete(String uuid);			//첨부파일 삭제
	public UserAttachVO findByBno(String userid);	//첨부파일

}
