package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FollowVO {
	private String fno;
	private String  follow_userid;
	private String  follower_userid;
	private Date    regDate;
}
