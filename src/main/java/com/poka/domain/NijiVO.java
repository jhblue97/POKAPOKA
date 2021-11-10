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
	private String category;
	private String image; //판매이미지
	private String serverImage; //판매이미지서버 보관용 
	private int price;
	private String writer;
	private List<NijiTagVO> tag;
	private Date   regDate;
	private Date   updateDate;
	private String fullTag;
	
	
	
}
