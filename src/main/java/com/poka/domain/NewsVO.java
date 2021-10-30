package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NewsVO {
	private String   news_no;
	private String news_title;
	private String news_content;
	private Date   news_regDate;
	private Date   news_updateDate;
}












