package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poka.domain.Criteria;
import com.poka.domain.GameVO;
import com.poka.mapper.GameMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class GameServiceImpl implements GameService {
	private GameMapper gMapper;

	@Override
	public List<GameVO> getList(Criteria cri) {
		log.info("getList");
		return gMapper.getList();
	}

	@Override
	public GameVO get(String gno) {
		log.info("get" + gno);
		return gMapper.read(gno);
	}

	@Override
	public void registerList(GameVO vo) {
		log.info("Regster Game");
		gMapper.insertGame(vo);

	}

}
