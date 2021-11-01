package com.poka.service;

import java.util.List;


import com.poka.domain.Criteria;
import com.poka.domain.PayAttachVO;
import com.poka.domain.PayVO;
import com.poka.mapper.PayAttachMapper;
import com.poka.mapper.PayMapper;

public class PayServiceImpl implements PayService {

	private PayMapper payMapper;
	private PayAttachMapper attachMapper;		 

	@Override
	public PayAttachVO getAttach(String pno) {

		return attachMapper.findByBno(pno);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return payMapper.getTotalCount(cri);
	}

	@Override
	public PayVO get(String pno) {
		// TODO Auto-generated method stub
		return payMapper.read(pno);
	}

	@Override
	public void add(PayVO payvo) {
		
		
		//첨부파일이 없는 경우						 
		if(payvo.getPayAttachVO() == null) {
			return;
		}
			attachMapper.insert(payvo.getPayAttachVO()); //이거는 무조건 attach메퍼타입으로
	}

	@Override
	public List<PayVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return payMapper.getListWithPaging(cri);
	}

}
