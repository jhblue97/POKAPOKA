package com.poka.domain;

import lombok.Data;



@Data
public class AttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private String no; 		//여러 컨트롤의 공통 번호
	private String flag; 	// 여러 컨트롤러의 플래그 'G' 등급 / 'N' '2차게시' / 'P' '페이결제'  
}
