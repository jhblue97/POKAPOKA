package com.poka.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewVO {

	private String rno; // 리뷰ID. Re+시퀀스
	private String content; // 리뷰 내용
	private String writer; // 작성자
	private String gno; // 작성된 게임ID
	private float score; // 별점
	private Date regDate; // 리뷰 등록일
	private Date updateDate; // 리뷰 업데이트 일자

}
