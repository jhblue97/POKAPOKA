package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FollowVO {
	private String fno;			
	private String  follow;		//기준이 되는 유저가 팔로잉하고 있는 유저들의 id값을 저장 FK
	private String  follower;	//기준이 되는 유저를 팔로잉 하고 있는 유저들의 id값을 저장 FK
	private Date    regDate;	//등록날짜
}
