package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private List<BoardAttachVO>	attachList;	//첨부파일 목록
	private String   bno;
	private String title;
	private String content;
	private String writer;
	private Date   regDate;
	private Date   updateDate;
	private GradeVO grade;
	private String reportStatus;
}












