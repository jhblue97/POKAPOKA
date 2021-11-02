package com.poka.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.UserAttachVO;
import com.poka.domain.UserVO;
import com.poka.mapper.GameMapper;
import com.poka.mapper.UserAttachMapper;
import com.poka.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;
	private UserAttachMapper attachMapper;
	
	@Override
	public UserAttachVO getAttach(String userid) {
		return attachMapper.findByBno(userid);
	}

	@Override
	public int logIn(String userid, String userpw) {
		return userMapper.logIn(userid, userpw);
	}

	@Override
	@Transactional
	public void signIn(UserVO user) {
		userMapper.signIn(user);
		
		//첨부파일이 없는 경우						 
		if(user.getUserimg() == null) {
			return;
		}
		
		//첨부파일이 있는 경우 - 첨부파일 테이블에 추가
		attachMapper.insert(user.getUserimg());
	}

	@Override
	public boolean modify(UserVO user) {
		attachMapper.delete(user.getUserid());	//기존 첨부파일 삭제
		
		boolean modifyResult = userMapper.update(user) == 1; //게시물 수정
		
		if(modifyResult			//게시물 수정에 성공하고, 첨부파일 목록이 있으면 등록 
		   && user.getUserimg() != null) {	
			attachMapper.insert(user.getUserimg());
		}
		return modifyResult;

	}

	@Override
	public boolean withdraw(String userid) {
		attachMapper.delete(userid);		//첨부파일 삭제
		return userMapper.withdraw(userid) == 1 ? true : false;

	}

	@Override
	public UserVO get(String userid) {
		return userMapper.read(userid);
	}

	@Override
	public boolean idchk(UserVO user) {
		return userMapper.idchk(user);
	}

	@Override
	public boolean nickchk(UserVO user) {
		return userMapper.nickchk(user);
	}

	@Override
	public boolean emailchk(UserVO user) {
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
