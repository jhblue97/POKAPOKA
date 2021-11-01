package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NewsVO {
	private String news_no;
	private String news_title;
	private String content;
	private Date regDate;
	private Date updateDate;
}
