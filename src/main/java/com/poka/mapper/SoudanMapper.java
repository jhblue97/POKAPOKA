package com.poka.mapper;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;

public interface SoudanMapper {

	public List<SoudanVO> getListWithPaging();

	public SoudanVO read(String qno);

	public int insert(SoudanVO qna);

	public int update(SoudanVO qna);

}
