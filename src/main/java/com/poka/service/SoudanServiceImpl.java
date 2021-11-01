package com.poka.service;

import org.springframework.stereotype.Service;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;
import com.poka.mapper.SoudanMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SoudanServiceImpl implements SoudanService {
	// 상담 매퍼 생성
	private SoudanMapper sMapper;

	@Override
	public Object getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object get(String qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(SoudanVO qna) {
		// TODO Auto-generated method stub
		return 0;

	}

	@Override
	public int modify(SoudanVO qna) {
		// TODO Auto-generated method stub
		return 0;

	}

}
