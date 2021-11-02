package com.poka.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.BoardAttachVO;
import com.poka.domain.GradeAttachVO;
import com.poka.domain.GradeVO;
import com.poka.service.GradeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/grade/*") //브라우저에서 /grade/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class GradeController {
	
	private GradeService gradeService;
	
	//gradeAdd.jsp
	//등급 등록 화면
	@GetMapping("/add")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String add() {
		log.info(".....add().....");
				
		return null;
	}
	//등급 등록
	@PostMapping("/add")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String add(String admin, GradeVO grade, RedirectAttributes rttr) {
		log.info(".....add().....");
		
		//첨부파일이 있는 경우 데이터베이스에 추가
		if(grade.getGrade_img() != null) {
			log.info(grade.getGrade_img());
		}
		
		rttr.addFlashAttribute("result", grade.getGrade_code());
		return "redirect:/grade/list";
	}
		
	//첨부파일 삭제
	public void deleteFile(GradeAttachVO attach) {
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
	
	//등급 삭제
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String delete(String admin, @RequestParam("grade_code") String grade_code, RedirectAttributes rttr) {
		log.info(".....delete().....");
		GradeAttachVO attach = gradeService.addAttach(grade_code);
		
		if(gradeService.delete(grade_code)) { //삭제에 성공한 경우
			deleteFile(attach);	//첨부파일 삭제
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	//첨부파일 JSON 반환
	@GetMapping(value="/getAttach",
			    produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<GradeAttachVO> getAttach(String grade_code){
		log.info(".....getAttach().....");
		return new ResponseEntity<>(gradeService.addAttach(grade_code), HttpStatus.OK);
	}
	
	//gradeUpdate.jsp
	//등급 수정 화면
	@GetMapping("/update")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String update(String admin, @RequestParam("gradeNo") String gradeNo) {
		return null;
	}
	
	//등급 수정
	@PostMapping("/update")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String update(String admin, GradeVO vo, RedirectAttributes rttr) {
		
		return null;
	}
	
	
	
	//gradeList.jsp
	//등급 기준 조회 화면
	@GetMapping("/list")
	@PreAuthorize("principal.username == #admin")		//관리자 확인
	public String list(String admin, Model model) {
		return null;
	}
}