package com.poka.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.UserVO;
import com.poka.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;

	@Override
	public void signIn(UserVO user) {
		userMapper.signIn(user);
	}

	@Override
	public boolean modify(UserVO user) {
		boolean modifyResult = userMapper.update(user) == 1; //게시물 수정
		return modifyResult;
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
	public int idchk(UserVO user) {
		return userMapper.idchk(user);
	}

	@Override
	public int nickchk(UserVO user) {
		return userMapper.nickchk(user);
	}

	@Override
	public int emailchk(UserVO user) {
		return userMapper.emailchk(user);
	}

	@Override
	public boolean pwchg(UserVO user) {
		return userMapper.pwchg(user);
	}

	@Override
	public boolean nickchg(UserVO user) {
		return userMapper.nickchg(user);
	}

}
