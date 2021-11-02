package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.GradeVO;
import com.poka.mapper.GradeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class GradeServiceImpl implements GradeService {

	private GradeMapper gradeMapper;

	@Override
	@Transactional
	public void add(GradeVO grade) {
		gradeMapper.insert(grade);
		
	}

	@Override
	public boolean modify(GradeVO grade) {
		boolean modifyResult = gradeMapper.update(grade) == 1; //게시물 수정
		return modifyResult;
	}

	@Override
	public boolean delete(String gradecode) {
		return gradeMapper.delete(gradecode) == 1 ? true : false;
	}

	@Override
	public GradeVO get(String gradecode) {
		return gradeMapper.read(gradecode);
	}

	@Override
	public List<GradeVO> getList() {
		return gradeMapper.getList();
	}

}
