package com.poka.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.poka.domain.Criteria;
import com.poka.domain.NijiAttachVO;
import com.poka.domain.NijiVO;
import com.poka.domain.PayAttachVO;
import com.poka.service.NijiService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/niji/*") //브라우저에서 /board/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class NijiController {

	private NijiService nijiService;
	
	     //게시물 목록 조회
		@GetMapping("/list")
		public String list(Criteria cri, Model model) {			
			log.info(".....list().....");	
			
			return null;
		}		
		
		 //게시물 검색 조회
		@GetMapping("/search")
		public String list(@RequestParam("name") String name,Criteria cri, Model model) {			
			log.info(".....list().....");
			return null;
		}		
		
		//게시물 하나 조회
		@GetMapping("/get")
		public String get(@RequestParam("nno") Long nno, 
						@ModelAttribute("cri") Criteria cri,
						Model model) {
			log.info(".....get() or modify() .....");	
			return null;
		}	
		
		//게시물 등록 화면
		@GetMapping("/add")
		@PreAuthorize("isAuthenticated()")
		public String add() {
			return null;
		}
		
		
		
		//게시물 등록
		@PostMapping("/add")
		@PreAuthorize("isAuthenticated()")
		public String add(NijiVO niji, RedirectAttributes rttr) {
		
			return null;
		}
		
		
		
		
		
		
		//게시물 삭제
		@GetMapping("/delete")
		@PreAuthorize("principal.username == #writer") //작성자 확인
		public String delete(@RequestParam("nno") Long nno, 
						@ModelAttribute("cri") Criteria cri,
						Model model) {
			log.info(".....get() or modify() .....");
			return null;
		}
		
		
		//첨부파일 삭제
		public void deleteFile(NijiAttachVO attach) {
			log.info(".....deleteFiles().....");
			if(attach == null) {	//첨부파일이 없는 경우 중단
				return;
			}
			
			try {
				Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" +
													   attach.getUuid() + "_" +
													   attach.getFileName());
				Files.deleteIfExists(file);	//파일이 존재하면 삭제
				
				if(Files.probeContentType(file).startsWith("image")) {	//이미지 파일의 경우 섬네일 삭제
					Path thumbnail = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\s_" +
													   			attach.getUuid() + "_" +
													   			attach.getFileName());
					Files.delete(thumbnail);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			}
			
			
			//첨부파일 삭제
			public void deleteFile(PayAttachVO attach) {
				log.info(".....deleteFiles().....");
				if(attach == null) {	//첨부파일이 없는 경우 중단
					return;
				}
				
				try {
					Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" +
														   attach.getUuid() + "_" +
														   attach.getFileName());
					Files.deleteIfExists(file);	//파일이 존재하면 삭제
					
					if(Files.probeContentType(file).startsWith("image")) {	//이미지 파일의 경우 섬네일 삭제
						Path thumbnail = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\s_" +
														   			attach.getUuid() + "_" +
														   			attach.getFileName());
						Files.delete(thumbnail);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
				
				
				
		//첨부파일 목록 JSON 반환
		@GetMapping(value="/displayFile",
				    produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<NijiAttachVO> getNijiAttach(String nno){
			log.info(".....getAttachList().....");
			return new ResponseEntity<>(nijiService.getAttach(nno), HttpStatus.OK);
		}
		
		//첨부파일 목록 JSON 반환
				@GetMapping(value="/pay/displayFile",
						    produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
				@ResponseBody
				public ResponseEntity<NijiAttachVO> getPayAttach(String pno){
					log.info(".....getAttachList().....");
					return new ResponseEntity<>(nijiService.getAttach(pno), HttpStatus.OK);
				}
				
				
		//게시물 수정
		@GetMapping("/modify")
		@PreAuthorize("principal.username == #board.writer") //작성자 확인
		public String modify(@RequestParam("nno") Long nno) {

			return null;
		}
		
		//게시물 수정
		@PostMapping("/modify")
		@PreAuthorize("principal.username == #board.writer") //작성자 확인
		public String modify(NijiVO niji, 
							 @ModelAttribute("cri") Criteria cri,
							 RedirectAttributes rttr) {
			log.info(".....modify()....." + cri);
			log.info(niji);
			return null;
		}
		
		 //결제 목록 조회
				@GetMapping("/pay/list")
			public String payList(Criteria cri, Model model) {			
			log.info(".....list().....");	
			return null;
		}	
			
				
		//결제 내역 상세 조회
		@GetMapping("/pay/get")
		public String payGet(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri,Model model) {			
			log.info(".....list().....");	
			
			return null;
		}	
		//카카오 결제				
		@GetMapping({ "/kakao/pay"})
		public String pay(@RequestParam("price")String price,@RequestParam("sno")String sno,@RequestParam("userNo")String userno) {
	
				log.info(".....get() or modify() .....");			
				return null;	
		}
		
		@GetMapping({ "/niji/pay_before"})
		public String pay_before(@RequestParam("sno")String sno,@RequestParam("userNo")String userno) {
	
				log.info(".....get() or modify() .....");			
				return null;	
		}
		
		@PostMapping({ "/niji/pay_before"})
		public String pay_before(NijiVO niji) {
	
				log.info(".....get() or modify() .....");			
				return null;	
		}
		
		
		@GetMapping({ "/niji/pay_after"})
		public String pay_after(@RequestParam("sno")String sno,Model model) {
	
				log.info(".....get() or modify() .....");			
				return null;	
		}
		
		
		
		
}
