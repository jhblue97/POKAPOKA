package com.poka.domain;
 
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String  userid;
	private String  userpw;
	private String  nickname;
	private String  email;
	private Date    birth;
	private String  gradecode;
	private String  profile;
	private String  gender;
	private Date    lastlogin;
	private String  account;
	private Date    regdate;
	private Date    updateDate;
	private boolean enabled;
	private boolean isLogin;
	private List<AuthVO> authList;
}
