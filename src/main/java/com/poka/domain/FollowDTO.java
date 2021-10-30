package com.poka.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class FollowDTO {
	
	private List<MemberVO> followList;
	private List<MemberVO> followerList;
	
}
