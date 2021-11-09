package com.poka.service;

import com.poka.domain.GradeVO;
import com.poka.domain.UserVO;

public interface UserService {
	public void signIn(UserVO vo);	//회원가입
	public boolean withdraw(String userid);	//회원탈퇴
	public UserVO get(String userid);	//회원 상세 정보 조회
	public GradeVO getGrade(String gradecode);
	public int idchk(UserVO vo);	//아이디 체크
	public int nickchk(UserVO vo);	//닉네임 체크
	public int emailchk(UserVO vo);	//이메일 체크
	public void pwchg(UserVO vo);	//비밀번호 변경
	public void nickchg(UserVO vo);	//닉네임 변경
}
