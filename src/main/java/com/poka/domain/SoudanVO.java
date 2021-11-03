package com.poka.domain;

import java.util.Date;
import lombok.Data;

@Data
public class SoudanVO {

	private String qno;
	private String questioner;
	private String answerer;
	private String q_content;
	private String a_content;
	private Date q_regDate;
	private Date a_regDate;
}
