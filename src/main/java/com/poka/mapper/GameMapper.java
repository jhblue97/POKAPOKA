package com.poka.mapper;

import java.util.List;

import com.poka.domain.GameVO;

public interface GameMapper {

	public List<GameVO> getList();

	public GameVO read(String gno);

}
