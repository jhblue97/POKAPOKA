package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FollowVO {
	private String fno;
	private String  follow;
	private String  follower;
	private Date    regDate;
}
