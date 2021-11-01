package com.poka.service;

import com.poka.domain.UserAttachVO;
import com.poka.domain.UserVO;

public interface UserService {
	public UserAttachVO getAttach(String userid);	//첨부파일
	public int logIn(String userid, String userpw);	//로그인
	public void signIn(UserVO vo);	//회원가입
	public boolean modify(UserVO vo);	//회원정보 수정
	public boolean withdraw(String userid);	//회원탈퇴
	public UserVO get(String userid);	//회원 상세 정보 조회
	public boolean idchk(UserVO vo);	//아이디 체크
	public boolean nickchk(UserVO vo);	//닉네임 체크
	public boolean emailchk(UserVO vo);	//이메일 체크
	public boolean pwchg(UserVO vo);	//비밀번호 변경
	public boolean nickchg(UserVO vo);	//닉네임 변경
}
