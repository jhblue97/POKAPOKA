package com.poka.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.GradeAttachVO;
import com.poka.domain.GradeVO;
import com.poka.mapper.GradeAttachMapper;
import com.poka.mapper.GradeMapper;

public class GradeServiceImpl implements GradeService {

	private GradeMapper gradeMapper;
	private GradeAttachMapper attachMapper;
	
	@Override
	public GradeAttachVO addAttach(String grade_code) {
		return attachMapper.findByBno(grade_code);
	}

	@Override
	@Transactional
	public void add(GradeVO grade) {
		gradeMapper.insert(grade);
		
		//첨부파일이 없는 경우						 
		if(grade.getGrade_img() == null) {
			return;
		}
		
		//첨부파일이 있는 경우 - 첨부파일 테이블에 추가
		attachMapper.insert(grade.getGrade_img());
		
	}

	@Override
	@Transactional
	public boolean modify(GradeVO grade) {
		attachMapper.delete(grade.getGrade_code());	//기존 첨부파일 삭제
		
		boolean modifyResult = gradeMapper.update(grade) == 1; //게시물 수정
		
		if(modifyResult			//게시물 수정에 성공하고, 첨부파일 목록이 있으면 등록 
		   && grade.getGrade_img() != null) {	
			attachMapper.insert(grade.getGrade_img());
		}
		return modifyResult;

	}

	@Override
	@Transactional
	public boolean delete(String grade_code) {
		attachMapper.delete(grade_code);		//첨부파일 삭제
		return gradeMapper.delete(grade_code) == 1 ? true : false;
	}

	@Override
	public GradeVO get(String grade_code) {
		return gradeMapper.read(grade_code);
	}

	@Override
	public List<GradeVO> getList() {
		return gradeMapper.getList();
	}

}
