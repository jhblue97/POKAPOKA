package com.poka.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 20);	//기본 페이지는 1, 게시물 수는 20개
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr(){
		//검색 타입 - 제목 T, 내용 C, 작성자 W  배열로 처리
		return type == null ? new String[] {} : type.split("");
	}
	
	//파라미터 처리
	public String getListLink() {
		UriComponentsBuilder builder 
			= UriComponentsBuilder.fromPath("")
								  .queryParam("pageNum", pageNum)
								  .queryParam("amount", amount)
								  .queryParam("type", type)
								  .queryParam("keyword", keyword);
		return builder.toUriString();						  
	}
}












