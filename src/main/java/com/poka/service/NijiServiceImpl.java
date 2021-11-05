package com.poka.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.poka.domain.Criteria;
import com.poka.domain.NijiTagVO;
import com.poka.domain.NijiVO;
import com.poka.mapper.NijiMapper;
import com.poka.mapper.PayMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class NijiServiceImpl implements NijiService{

	
	private NijiMapper nijiMapper;
	

	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return nijiMapper.getTotalCount(cri);
	}

	@Override
	public boolean modify(NijiVO niji) {
		// TODO Auto-generated method stub
		
		//attachMapper.deleteAll(niji.getNno());	//기존 첨부파일 삭제
		
		boolean modifyResult = nijiMapper.update(niji) == 1; //게시물 수정
		
		/*
		 * if(modifyResult //게시물 수정에 성공하고, 첨부파일 목록이 있으면 등록 && niji.getNijiAttachVO() !=
		 * null) {
		 * 
		 * attachMapper.insert(niji.getNijiAttachVO()); //이거는 무조건 attach메퍼타입으로 }
		 */
		
		return modifyResult;
	}

	@Override
	public boolean delete(String nno) {
		// TODO Auto-generated method stub
		
		//attachMapper.deleteAll(nno);		//첨부파일 모두 삭제
		return nijiMapper.delete(nno) == 1 ? true : false;
	}

	@Override
	public NijiVO get(String nno) {
		// TODO Auto-generated method stub
		return nijiMapper.read(nno);
	}

	@Override
	public void add(NijiVO nijivo) {
		
		/*
		 * //첨부파일이 없는 경우 if(nijivo.getNijiAttachVO() == null) { return; }
		 * attachMapper.insert(nijivo.getNijiAttachVO()); //이거는 무조건 attach메퍼타입으로
		 */	
		
		int number = nijiMapper.getLastSeq(); //19
		String nno = "N"+(number);
		//nijivo.setNno(nno);
		
		nijiMapper.insert(nijivo);
		Map<String,String> map;
		if(nijivo.getFullTag()!=null) {
			String[] tag = nijivo.getFullTag().split(",");
			
			for(int i=0; i<tag.length; i++) {
				map = new HashMap<String,String>();
				System.out.println("이게맞나"+nno + tag[i]);
				map.put("nno", nno);
				map.put("tagname",tag[i]);
				nijiMapper.insertTag(map);
				
			}
		
		
		}
	
		
	}

	@Override
	public List<NijiVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		return nijiMapper.getListWithPaging(cri);
	}

	@Override
	public List<NijiTagVO> getTag(String nno) {
		
		return nijiMapper.getTag(nno);
	}	


	
}
