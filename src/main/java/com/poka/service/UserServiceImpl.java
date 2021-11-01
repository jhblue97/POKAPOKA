package com.poka.service;

import com.poka.domain.UserAttachVO;
import com.poka.domain.UserVO;

public class UserServiceImpl implements UserService {

	@Override
	public UserAttachVO addAttach(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean logIn(String userid, String userpw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean signIn(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void modify(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void withdraw(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO get(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean idchk(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean nickchk(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean emailchk(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean pwchg(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean nickchg(UserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

}
