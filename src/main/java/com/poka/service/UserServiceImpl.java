package com.poka.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.GradeVO;
import com.poka.domain.UserVO;
import com.poka.mapper.GradeMapper;
import com.poka.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;
	private GradeMapper gradeMapper;

	@Override
	public void signIn(UserVO user) {
		userMapper.signIn(user);
	}

	@Override
	public boolean withdraw(String userid) {
		return userMapper.withdraw(userid) == 1 ? true : false;
	}

	@Override
	public UserVO get(String userid) {
		return userMapper.read(userid);
	}

	@Override
	public GradeVO getGrade(String gradecode) {
		return gradeMapper.read(gradecode);
	}
	
	@Override
	public int idchk(String userid) {
		return userMapper.idchk(userid);
	}

	@Override
	public int nickchk(String nickname) {
		return userMapper.nickchk(nickname);
	}

	@Override
	public int pwchg(UserVO user) {
		return  userMapper.pwchg(user);
	}

	@Override
	public int nickchg(UserVO user) {
		 return userMapper.nickchg(user);
	}

}
