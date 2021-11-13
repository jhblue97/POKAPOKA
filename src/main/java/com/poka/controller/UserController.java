package com.poka.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.UserVO;
import com.poka.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/user/*") //브라우저에서 /user/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class UserController {

	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	BCryptPasswordEncoder pwdEncoder;
	
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
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		log.info("logout()");
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/";
	}	
	
	//접근거부
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("accessDenied()");
		model.addAttribute("msg", "접근 거부 - 권한 부족");
		return null;
	}
	
	//회원 가입 화면
	@GetMapping("/signIn")
	public void signIn() {}
	
	//회원 가입
	@PostMapping("/signIn")
	public String signIn(UserVO user, RedirectAttributes rttr){
		log.info("signIn()");
		
		String pwd = pwdEncoder.encode(user.getUser_pw());
		user.setUser_pw(pwd);
		
		//회원가입
		userService.signIn(user);
		rttr.addAttribute("result", user.getUser_id());
		
		return "redirect:/user/login";
	}

	//회원탈퇴
	@GetMapping("/delete")
	public String delete(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		log.info(".....delete().....");
		userService.withdraw(userid);
		return "redirect:/";
	}
	
	//첨부파일 삭제
	public void deleteFile(String filename) {
		try {
			Path file = Paths.get("c:\\upload\\" + filename);
			Files.deleteIfExists(file);	//파일이 존재하면 삭제
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//userView.jsp
	//회원 정보 조회 화면
	@GetMapping("/get")
	public String get(@RequestParam("user_id") String user_id, Model model, @RequestParam("gradecode") String gradecode) {
		log.info("get()");
		model.addAttribute("user", userService.get(user_id));
		model.addAttribute("grade", userService.getGrade(gradecode));
		return "/user/userView";
	}
	
	//아이디 체크
	@GetMapping("/chkId/{user_id}")
	public ResponseEntity<String> chkId(@PathVariable("user_id") String user_id) throws Exception{
		return userService.idchk(user_id) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	//닉네임 체크
	@GetMapping("/chkNick/{nickname}")
	public ResponseEntity<String> chkNick(@PathVariable("nickname") String nickname) throws Exception{
		
		return userService.nickchk(nickname) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//이메일 인증
	@GetMapping("/emailChk/{email}")
	public String emailChk(@PathVariable("email") String email) throws Exception{
		 Random random = new Random();
		 //6자리 인증코드 
		  int checkNum = random.nextInt(888888) + 111111;
		  
		  //이메일보내기
		  String setFrom = "dybo13635@gmail.com";
		  String toMail = email;
		  String title = "회원가입 인증 메일입니다.";
		  String content = "POKAPOKA 홈페이지 이메일 인증절차입니다.<br><br>" + 
		  "인증번호는 " + checkNum + "입니다.<br>" + 
				  "이메일 인증란에 인증번호를 입력해주세요.";
		  
//		  try {
//	            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//	            helper.setFrom(setFrom);
//	            helper.setTo(toMail);
//	            helper.setSubject(title);
//	            helper.setText(content,true);
//	            mailSender.send(message);
//	            
//	        }catch(Exception e) {
//	            e.printStackTrace();
//	        }
		  
		  String num = Integer.toString(checkNum);
		  
		  return num;
	}
	
	//userUpdate.jsp
	//회원정보 수정 화면
	@GetMapping("/modify")
	public String modify(@RequestParam("userid") String userid, Model model,@RequestParam("gradecode") String gradecode) {
		model.addAttribute("user", userService.get(userid));
		model.addAttribute("grade", userService.getGrade(gradecode));
		return "/user/userUpdate";
	}
	
	//회원정보 수정
	@PostMapping("/modify")
	public String modify(UserVO user) {
		
		return "redirect:/user/get";
	}
	
	//비밀번호 변경
	@PostMapping("/chg/pw")
	public ResponseEntity<String> chgPw(@RequestBody UserVO vo) {
		
		return null;
	}
	
	//닉네임 변경
	@PostMapping("/chg/nick")
	public ResponseEntity<String> chgNink(@RequestBody UserVO vo) {
		
		return null;
	}
	
}
