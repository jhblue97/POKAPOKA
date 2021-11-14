package com.poka.service;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.GameVO;

public interface GameService {
	// 전체 게임 목록 반환
	public List<GameVO> getList(Criteria cri);

	// 단일 게임 반환
	public GameVO get(String gno);

	// 게임 목록 업데이트는 Task에서 주기적으로 실행 해 줄 것.
	public void registerList(GameVO vo);
}