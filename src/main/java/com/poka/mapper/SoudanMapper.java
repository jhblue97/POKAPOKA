package com.poka.mapper;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;

public interface SoudanMapper {

	public Object getListWithPaging(Criteria cri);

	public Object read(String qno);

	public int insert(SoudanVO qna);

	public int update(SoudanVO qna);

}
