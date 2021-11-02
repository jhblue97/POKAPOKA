package com.poka.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.BoardAttachVO;
import com.poka.domain.UserAttachVO;
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
	
	//로그인
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
		log.info("Login()");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 에러 - 계정을 확인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
		
		return null;
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout() {
		log.info("logout()");
		
		return null;
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
	public String signIn() {	
		
		return  null;
	}
	
	//회원 가입
	@PostMapping("/signIn")
	public String signIn(UserVO user) {
		log.info("signIn()");
		
		//첨부파일이 있는 경우 데이터베이스에 추가
		if(user.getUser_img() != null) {
			log.info(user.getUser_img());
		}

		return "redirect:/";
	}
	
	//첨부파일 삭제
	public void deleteFile(UserAttachVO attach) {
		log.info("deleteFile()......");
		if(attach == null) {	//첨부파일이 없는 경우 중단
			return;
		}
		
		try {
			Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" + 
												   attach.getUuid() + "_" + 
												   attach.getFileName());
			Files.deleteIfExists(file); //파일이 존재하면 삭제
			
			if(Files.probeContentType(file).startsWith("image")) {	//이미지 파일의 경우 섬네일 삭제
				Path thumbnail = Paths.get("c:\\upload\\"  + attach.getUploadPath() + "\\s_" +
														     attach.getUuid() + "_" +
														     attach.getFileName());
                Files.delete(thumbnail);														     	
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//회원탈퇴
	@PostMapping("/delete")
	public String delete(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		log.info(".....delete().....");
		UserAttachVO attach = userService.getAttach(userid);
		
		if(userService.withdraw(userid)) { //삭제에 성공한 경우
			deleteFile(attach);	//첨부파일 삭제
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/";
	}
	
	//첨부파일 JSON 반환
	@GetMapping(value="/getAttach",
			    produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<UserAttachVO> getAttach(String userid){
		log.info(".....getAttach().....");
		return new ResponseEntity<>(userService.getAttach(userid), HttpStatus.OK);
	}
	
	//userView.jsp
	//회원 정보 조회 화면
	@GetMapping("/get")
	public String get(UserVO vo) {
		log.info("get()");
		return null;
	}
	
	//아이디 체크
	@GetMapping("/chk/id")
	public ResponseEntity<String> chkId(@RequestBody UserVO vo) {
		
		return null;
	}
	
	//닉네임 체크
	@GetMapping("/chk/nick")
	public ResponseEntity<String> chkNick(@RequestBody UserVO vo) {
		
		return null;
	}
	
	//이메일 체크
	@PostMapping("/chk/email")
	public ResponseEntity<String> chkEmail(@RequestBody UserVO vo ) {
		
		return null;
	}
	
	//userUpdate.jsp
	//회원정보 수정 화면
	@GetMapping("/modify")
	public String modify() {
		return null;
	}
	
	//회원정보 수정
	@PostMapping("/modify")
	public String modify(UserVO vo) {
		
		return null;
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
