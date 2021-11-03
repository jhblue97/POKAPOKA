package com.poka.domain;
 
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String  user_id;
	private String  user_pw;
	private String  nickname;
	private String  email;
	private String    birth;
	private String  gradecode;
	private String  img;
	private String  gender;
	private Date    lastlogin;
	private String  account;
	private Date    regDate;
	private Date    updateDate;
	private boolean enabled;
	private int grade_exp;
	private List<AuthVO> authList;
}
