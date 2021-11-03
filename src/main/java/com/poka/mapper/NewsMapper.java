package com.poka.mapper;

import java.util.List;

import com.poka.domain.NewsVO;

public interface NewsMapper {

	public List<NewsVO> getList();
	
	public NewsVO read(String newsNo);
	
}
