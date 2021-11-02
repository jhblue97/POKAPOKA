package com.poka.domain;

import java.util.Date;
import java.util.List;

import com.poka.domain.BoardAttachVO;

import lombok.Data;
@Data
public class NijiVO {

	private String   nno; //거래글 넘버
	private String title; 
	private String content;
	private String writer;
	private String category;
	private String img; //판매이미지
	private int price;
	private List<TagVO> tagVO;
	private Date   regDate;
	private Date   updateDate;
	
	
	
}
