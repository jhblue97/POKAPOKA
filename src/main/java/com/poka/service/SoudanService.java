package com.poka.service;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;

public interface SoudanService {

	public Object getList(Criteria cri);

	public Object get(String qno);

	public int register(SoudanVO qna);

	public int modify(SoudanVO qna);

}