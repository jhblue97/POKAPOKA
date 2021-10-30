package com.poka.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poka.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/user/*") //브라우저에서 /user/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class UserController {

	//로그인
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		log.info("Login()");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 에러 - 계정을 확인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public void logout() {
		log.info("logout()");
	}
	
	//접근거부
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("accessDenied()");
		model.addAttribute("msg", "접근 거부 - 권한 부족");
	}
	
	//회원 가입 화면
	@GetMapping("/signIn")
	public void signIn() {	}
	
	//회원 가입
	@PostMapping("/signIn")
	public void signIn(MemberVO vo) {
		log.info("signIn()");
	}
	
	//userView.jsp
	//회원 정보 조회 화면
	@GetMapping("/get")
	public String get() {
		log.info("get()");
		return null;
	}
	
	//아이디 체크
	@GetMapping("/chk/id")
	public void chkId() {
		
	}
	
	//닉네임 체크
	@GetMapping("/chk/nick")
	public void chkNick() {
		
	}
	
	//이메일 체크
	@PostMapping("/chk/email")
	public void chkEmail() {
		
	}
	
	//userUpdate.jsp
	//회원정보 수정 화면
	@GetMapping("/modify")
	public String modify() {
		return null;
	}
	
	//회원정보 수정
	@PostMapping("/modify")
	public void modify(MemberVO vo) {
		
	}
	
	//비밀번호 변경
	@PostMapping("/chg/pw")
	public void chgPw() {
		
	}
	
	//닉네임 변경
	@PostMapping("/chg/nick")
	public void chgNink() {
		
	}
	
	//회원탈퇴
	@PostMapping("/delete")
	public void delete() {
		
	}
	
}
