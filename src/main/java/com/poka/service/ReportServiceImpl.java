package com.poka.service;

import java.util.List;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;
import com.poka.domain.ReportVO;
import com.poka.mapper.PayAttachMapper;
import com.poka.mapper.PayMapper;
import com.poka.mapper.ReportMapper;

public class ReportServiceImpl implements ReportService {

	private ReportMapper reportMapper;
	
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return reportMapper.getTotalCount(cri);
	}
	
	@Override
	public List<ReportVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return reportMapper.getListWithPaging(cri);
	}

	@Override
	public int process(String rno) {
		// TODO Auto-generated method stub
		return reportMapper.update(rno);
	}

	@Override
	public int addReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.insert(vo);
	}

}
