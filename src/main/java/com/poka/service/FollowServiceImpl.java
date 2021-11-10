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
	public void add(FollowVO follow) {
		followMapper.insert(follow);
		
	}

	@Override
	public boolean delete(String fno) {
		return followMapper.delete(fno) == 1 ? true : false;
	}

	@Override
	public List<FollowVO> followList(String userid) {
//		System.out.println("test"+userid);
		
		List<FollowVO>  test = followMapper.getfollowList(userid);
//		System.out.println("size :: "+test.size());
//		for (FollowVO followVO : test) {
//			System.out.println("followVO"+followVO.getFollow());
//		}
//		
		return followMapper.getfollowList(userid);
	}

	@Override
	public List<FollowVO> followerList(String userid) {
		return followMapper.getfollowerList(userid);
	}

	@Override
	public boolean followchk(FollowVO follow) {
		
		return followMapper.followchk(follow) == 1 ? true : false;
	}

}
