package com.poka.domain;
 
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String  userid;
	private String  userpw;
	private String  nickname;
	private String  email;
	private Date    birth;
	private String  gradecode;
	private UserAttachVO  user_img;
	private String  gender;
	private Date    lastlogin;
	private String  account;
	private Date    regDate;
	private Date    updateDate;
	private boolean enabled;
	private List<AuthVO> authList;
}
