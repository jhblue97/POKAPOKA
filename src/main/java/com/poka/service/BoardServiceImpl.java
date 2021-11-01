package com.poka.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.poka.domain.BoardAttachVO;
import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.mapper.BoardAttachMapper;
import com.poka.mapper.BoardMapper;

public class BoardServiceImpl implements BoardService {

	private BoardMapper boardMapper;
	private BoardAttachMapper attachMapper;		
	
	@Override
	public BoardAttachVO getAttach(String bno) {
		return attachMapper.findByBno(bno);
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

	@Override
	@Transactional
	public boolean modify(BoardVO board) {
		attachMapper.delete(board.getBno());	//기존 첨부파일 삭제
		
		boolean modifyResult = boardMapper.update(board) == 1; //게시물 수정
		
		if(modifyResult			//게시물 수정에 성공하고, 첨부파일 목록이 있으면 등록 
		   && board.getAttach() != null) {	
			attachMapper.insert(board.getAttach());
		}
		return modifyResult;
	}

	@Override
	@Transactional
	public boolean delete(String bno) {
		attachMapper.delete(bno);		//첨부파일 삭제
		return boardMapper.delete(bno) == 1 ? true : false;
	}

	@Override
	public BoardVO get(String bno) {
		return boardMapper.read(bno);
	}

	@Override
	@Transactional
	public void add(BoardVO board) {
		boardMapper.insertSelectKey(board);
		
		//첨부파일이 없는 경우						 
		if(board.getAttach() == null) {
			return;
		}
		
		//첨부파일이 있는 경우 - 첨부파일 테이블에 추가
		attachMapper.insert(board.getAttach());
		
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return boardMapper.getListWithPaging(cri);
	}

}
