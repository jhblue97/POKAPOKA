package com.poka.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO { // 페이징 처리 클래스
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private int total; // 전체 게시물의 수
	private boolean prev; // 이전
	private boolean next; // 다음
	private Criteria cri; // 한 페이지에 표시할 게시물의 수 및 표시할 페이지 번호
	// private int amount; //한 페이지에 표시할 게시물의 수
	// private int pageNum; //표시할 페이지 번호

	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;

		// 끝 페이지 계산 - 1 페이지에 4개씩 페이지 번호를 표시하는 경우
		endPage = (int) (Math.ceil(cri.getPageNum() / 4.0)) * 4;

		startPage = endPage - 9; // 시작 페이지 계산

		// 실제 끝 페이지 계산
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < endPage) { // 끝 페이지 재계산
			endPage = realEnd;
		}

		prev = startPage > 1; // 이전 페이지
		next = endPage < realEnd; // 다음 페이지
	}

}
