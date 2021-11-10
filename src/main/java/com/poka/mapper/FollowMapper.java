package com.poka.mapper;

import java.util.List;

import com.poka.domain.FollowVO;

public interface FollowMapper {
	public int insert(FollowVO follow);		//팔로우 추가
	public int delete(String fno);				//팔로우 삭제
	public List<FollowVO> getfollowList(String userid);		//팔로우 목록 조회
	public List<FollowVO> getfollowerList(String userid);	//팔로워 목록 조회
	public int followchk(FollowVO follow);		//팔로우 체크
	
}
