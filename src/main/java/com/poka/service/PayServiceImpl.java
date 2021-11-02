package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poka.domain.Criteria;
import com.poka.domain.PayVO;
import com.poka.mapper.PayMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PayServiceImpl implements PayService {

	private PayMapper payMapper;		 

	

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
		
		

	}

	@Override
	public List<PayVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return payMapper.getListWithPaging(cri);
	}

}
