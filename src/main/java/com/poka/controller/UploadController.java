package com.poka.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poka.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	//현재 시점의 '연/월/일' 폴더 경로 문자열 생성
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		
		return str.replace("-", File.separator);  
	}
	
	//업로드 파일 - 이미지 여부 확인
	public boolean checkImgType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			//이미지 파일이면 true 반환
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//섬네일 이미지 파일 전송  
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(
				FileCopyUtils.copyToByteArray(file),
				header,
				HttpStatus.OK
			);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//파일 삭제
	@PostMapping("/deleteFile")
	@PreAuthorize("isAuthenticated()")	//로그인 확인
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		try {
			File file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();	//파일 삭제
			
			if(type.equals("image")) { //이미지 파일의 경우 원본 파일 삭제
				String originFile = file.getAbsolutePath().replace("s_", ""); //원본 파일명 
				file = new File(originFile);
				file.delete();	//원본 파일 삭제
			}
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//파일 다운로드 
	@GetMapping(value="/download",
			    produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName, 
					@RequestHeader("User-Agent") String userAgent){
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		if(resource.exists() == false) {	//resource가 없는 경우 404 반환
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		log.info("resource : " + resource);
		
		String resourceNm = resource.getFilename();
		//UUID 제거
		resourceNm = resourceNm.substring(resourceNm.indexOf("_") + 1);
		
		HttpHeaders header = new HttpHeaders();
		try {
			if(userAgent.contains("Trident")) {		//IE
				resourceNm = URLEncoder.encode(resourceNm, "UTF-8").replaceAll("\\+", " ");
			} else if(userAgent.contains("Edge")) {	//Edge
				resourceNm = URLEncoder.encode(resourceNm, "UTF-8");
			} else {
				resourceNm = new String(resourceNm.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			header.add("Content-Disposition", 
					   "attachement; filename=" + resourceNm);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	
	@PostMapping("/uploadAjaxAction")
	@PreAuthorize("isAuthenticated()")	//로그인 확인
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxAction(MultipartFile[] uploadFile) {  
		log.info("uploadAjaxAction");
		
		List<AttachFileDTO> list = new ArrayList<>();				//
		
		// 연/월/일 폴더 생성
		File uploadPath = new File("c:\\upload", getFolder());
		log.info("uploadPath : " + uploadPath);
		
		//해당 폴더가 존재하지 않는 경우에만 생성
		if( !uploadPath.exists() ) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multi : uploadFile) {
			log.info("-------------------------------");
			log.info("file name : " + multi.getOriginalFilename());
			log.info("file size : " + multi.getSize());
			
			String uplodFileNm = multi.getOriginalFilename();
			AttachFileDTO attachDTO = new AttachFileDTO();			//
			attachDTO.setFileName(uplodFileNm);						//1
			
			//IE의 경우 파일명만 가져오기
			uplodFileNm = uplodFileNm.substring(uplodFileNm.lastIndexOf("\\") + 1);
			
			//UUID 이용 파일명 중복 방지 처리
			UUID uuid = UUID.randomUUID();
			uplodFileNm = uuid.toString() + "_" + uplodFileNm;
			
			attachDTO.setUuid(uuid.toString());						//2
			attachDTO.setUploadPath(getFolder());					//3
			
			File saveFile = new File(uploadPath, uplodFileNm);
			
			try { 
				multi.transferTo(saveFile);	//파일 업로드
				
				//이미지 파일이면 썸네일 생성
				if(checkImgType(saveFile)) {
					attachDTO.setImage(true);						//4		
					
					FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadPath, "s_" + uplodFileNm)	
					);
					
					//가로 100 * 세로 100 썸네일 생성
					Thumbnailator.createThumbnail(
						multi.getInputStream(), thumbnail, 100, 100
					);
					thumbnail.close();
				}//END  썸네일 생성
				
				list.add(attachDTO);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}//END for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}//END uploadAjaxAction()
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax()");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormAction(MultipartFile[] uploadFile) {
		log.info("uploadFormAction");
		
		for(MultipartFile multi : uploadFile) {
			log.info("-------------------------------");
			log.info("file name : " + multi.getOriginalFilename());
			log.info("file size : " + multi.getSize());
			
			File saveFile = new File("c:\\upload", multi.getOriginalFilename());
			
			try { 
				multi.transferTo(saveFile);	//파일 업로드
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
}




















