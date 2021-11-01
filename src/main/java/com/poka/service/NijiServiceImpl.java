package com.poka.service;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.NijiAttachVO;
import com.poka.domain.NijiVO;
import com.poka.mapper.NijiAttachMapper;
import com.poka.mapper.NijiMapper;
import com.poka.mapper.PayAttachMapper;
import com.poka.mapper.PayMapper;

public class NijiServiceImpl implements NijiService{

	
	private NijiMapper nijiMapper;
	private NijiAttachMapper attachMapper;		 

	
	@Override
	public NijiAttachVO getAttach(String nno) {
		// TODO Auto-generated method stub
		return attachMapper.findByBno(nno);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return nijiMapper.getTotalCount(cri);
	}

	@Override
	public boolean modify(NijiVO niji) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(niji.getNno());	//기존 첨부파일 삭제
		
		boolean modifyResult = nijiMapper.update(niji) == 1; //게시물 수정
		
		if(modifyResult			//게시물 수정에 성공하고, 첨부파일 목록이 있으면 등록 
				   && niji.getNijiAttachVO() != null) {			

			attachMapper.insert(niji.getNijiAttachVO()); //이거는 무조건 attach메퍼타입으로
	    	}
		
		return modifyResult;
	}

	@Override
	public boolean delete(String nno) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(nno);		//첨부파일 모두 삭제
		return nijiMapper.delete(nno) == 1 ? true : false;
	}

	@Override
	public NijiVO get(String nno) {
		// TODO Auto-generated method stub
		return nijiMapper.read(nno);
	}

	@Override
	public void add(NijiVO nijivo) {
		
		//첨부파일이 없는 경우						 
		if(nijivo.getNijiAttachVO() == null) {
			return;
		}
			attachMapper.insert(nijivo.getNijiAttachVO()); //이거는 무조건 attach메퍼타입으로
	}

	@Override
	public List<NijiVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return nijiMapper.getListWithPaging(cri);
	}	


	
}
