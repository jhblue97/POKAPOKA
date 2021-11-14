package com.poka.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;
import com.poka.domain.GradeVO;
import com.poka.domain.NijiVO;
import com.poka.domain.ReportVO;
import com.poka.mapper.PayMapper;
import com.poka.mapper.ReportMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
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
	public List<ReportVO> getList2(String bno) {
		// TODO Auto-generated method stub
		
		return reportMapper.getListWithPaging2(bno);
	} 
	
	@Override
	public void process(String bno) {
		// TODO Auto-generated method stub
		reportMapper.process(bno);
	}

	@Override 
	public void addReport(String bno,String reporter,String status,String writer,String category) {
		// TODO Auto-generated method stub
		Map<String,String> map;
		map = new HashMap<String,String>();
		map.put("bno",bno);
		map.put("reporter",reporter);
		map.put("status",status);
		map.put("writer",writer);
		map.put("category",category);
		
		reportMapper.insert(map);
	}
    


}
