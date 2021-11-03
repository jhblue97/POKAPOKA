package com.poka.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NewsVO {
	private String newsNo;
	private String title;
	private String content;
	private Date regDate;
}
