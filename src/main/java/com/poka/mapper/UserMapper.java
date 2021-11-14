package com.poka.mapper;

import com.poka.domain.UserVO;

public interface UserMapper {
	public UserVO read(String user_id);//회원 상세 정보 조회
	public int signIn(UserVO vo);	//회원가입
	public int withdraw(String user_id);	//회원탈퇴
	public int idchk(String user_id);	//아이디 체크
	public int nickchk(String nickname);	//닉네임 체크
	public int emailchk(UserVO vo);	//이메일 체크
	public int pwchg(UserVO vo);	//비밀번호 변경
	public int nickchg(UserVO vo);	//닉네임 변경
}
