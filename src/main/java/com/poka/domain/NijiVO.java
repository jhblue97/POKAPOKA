package com.poka.domain;

import java.util.Date;
import java.util.List;

import com.poka.domain.BoardAttachVO;

public class NijiVO {

	private List<BoardAttachVO>	attachList;	//첨부파일 목록
	private int    replyCnt;
	private Long   bno;
	private String title;
	private String content;
	private String writer;
	private Date   regDate;
	private Date   updateDate;
	
	
}
