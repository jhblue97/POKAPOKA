package com.poka.service;

import java.util.List;

import com.poka.domain.FollowVO;
import com.poka.mapper.FollowMapper;

public class FollowServiceImpl implements FollowService {

	private FollowMapper followMapper;
	
	@Override
	public void add(FollowVO follow) {
		followMapper.insert(follow);
		
	}

	@Override
	public boolean delete(String fno) {
		return followMapper.delete(fno) == 1 ? true : false;
	}

	@Override
	public List<FollowVO> followList() {
		return followMapper.getfollowList();
	}

	@Override
	public List<FollowVO> followerList() {
		return followMapper.getfollowerList();
	}

	@Override
	public boolean followchk(FollowVO follow) {
		
		return followMapper.followchk(follow) == 1 ? true : false;
	}

}
