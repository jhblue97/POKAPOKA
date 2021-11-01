package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private BoardAttachVO attach;	//첨부파일 목록
	private String   bno;
	private String title;
	private String content;
	private String writer;
	private Date   regDate;
	private Date   updateDate;
}












