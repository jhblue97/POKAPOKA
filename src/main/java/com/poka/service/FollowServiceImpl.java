package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poka.domain.FollowVO;
import com.poka.mapper.FollowMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class FollowServiceImpl implements FollowService {

	private FollowMapper followMapper;
	
	@Override
	public int add(FollowVO follow) {
		return followMapper.insert(follow);
	}

	@Override
	public int delete(String fno) {
		return followMapper.delete(fno);
	}

	@Override
	public List<FollowVO> followList(String userid) {
		
		return followMapper.getfollowList(userid);
	}

	@Override
	public List<FollowVO> followerList(String userid) {
		return followMapper.getfollowerList(userid);
	}

	@Override
	public int followchk(FollowVO follow) {
		
		return followMapper.followchk(follow);
	}

}
