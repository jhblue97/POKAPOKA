package com.poka.service;

import java.util.List;

import com.poka.domain.FollowVO;

public interface FollowService {
	
	public boolean add(String userid);		//팔로우 추가
	public boolean delete(String fno);		//팔로우 삭제
	public List<FollowVO> followList();		//팔로우 목록 조회
	public List<FollowVO> followerList();	//팔로워 목록 조회
	public boolean followchk(FollowVO vo);	//팔로우 체크
}
