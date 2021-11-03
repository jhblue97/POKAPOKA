package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poka.domain.NewsVO;
import com.poka.mapper.NewsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class NewsServiceImpl implements NewsService {
	private NewsMapper nMapper;

	@Override
	public List<NewsVO> getList() {
		return nMapper.getList();
	}

	@Override
	public NewsVO get(String newsNo) {
		log.info("get news");
		return nMapper.read(newsNo);
	}

}
