package com.poka.service;

import java.util.List;

import com.poka.domain.NewsVO;

public interface NewsService {

	public List<NewsVO> getList();

	public NewsVO get(String newsNo);

}