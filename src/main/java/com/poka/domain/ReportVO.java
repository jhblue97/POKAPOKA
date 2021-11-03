package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class ReportVO {

	private String report_no;
	private String active_userid;
	private String passive_userid;
	private String bno;
	private Date regDate;
	private String category;
	private int status;
	
}
