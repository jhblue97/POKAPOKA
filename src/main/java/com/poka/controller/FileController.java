package com.poka.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poka.domain.BoardAttachVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/file/*") //브라우저에서 /board/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class FileController {

	//첨부파일 삭제
		public void deleteFile(BoardAttachVO attachList) {

		}
		//첨부파일 목록 JSON 반환
		@GetMapping(value="/getAttachList",
				    produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<BoardAttachVO> getAttachList(Long bno){
			
			log.info(".....getAttachList().....");
			return null;
			
		}
		
		
	
}
