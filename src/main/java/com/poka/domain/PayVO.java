package com.poka.domain;

import java.util.Date;
import java.util.List;

public class PayVO {

	private BoardAttachVO boardAttachVO;
	private String   pno; //결제 넘버
	private String   nno; //거래글 넘버
	private String title; 
	private String content;
	private String seller; //판매자
	private String buyer; //구매자
	private String buyer_email; //구매자 이메일
	private int pay_status;
	private int price;
	private List<TagVO> tagVO;
	private Date   pay_Date;
	private Date   updateDate;
	
}
