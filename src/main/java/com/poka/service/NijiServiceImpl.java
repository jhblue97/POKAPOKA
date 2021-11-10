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
		
		boolean modifyResult;
		
		if(niji.getCategory().equals("S")) {
			nijiMapper.deleteTag(niji.getNno());
			 modifyResult = nijiMapper.update(niji) == 1; //게시물 수정
			 
			 
				Map<String,String> map;
				if(niji.getFullTag()!=null) {
					String[] tag = niji.getFullTag().split(",");
					
					for(int i=0; i<tag.length; i++) {
						map = new HashMap<String,String>();
						System.out.println("이게맞나"+niji.getNno() + tag[i]);
						map.put("nno", niji.getNno());
						map.put("tagname",tag[i]);
						nijiMapper.insertTag(map);
						
					}
				
				
				}
			 
		}else {
			 modifyResult = nijiMapper.update2(niji) == 1; //게시물 수정
		}
		return modifyResult;
	}

	@Override
	public boolean delete(String nno) {
		// TODO Auto-generated method stub
		
			nijiMapper.deleteTag(nno);	
		return nijiMapper.delete(nno) == 1 ? true : false;
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
		System.out.println("가격 ->"+nijivo.getPrice());
		System.out.println("가격1 ->"+nijivo.getCategory());
		System.out.println("가격2 ->"+nijivo.getContent());
		System.out.println("가격3 ->"+nijivo.getWriter());
		System.out.println("가격 4->"+nijivo.getImage());

		if(nijivo.getImage()==null) {
			
			nijivo.setImage("");
		}
		if(nijivo.getCategory().equals("B")) {
			nijivo.setImage("tanuki_koubai.png");
		}
		
		nijiMapper.insert(nijivo);
		Map<String,String> map;
		if(nijivo.getFullTag()!=null && !(nijivo.getFullTag().equals("")) ) {
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
	public NijiVO get(String nno) {
		// TODO Auto-generated method stub
		NijiVO niji = nijiMapper.read(nno);
		List<NijiTagVO>  nijitag= nijiMapper.getTag(nno); 
		
		String[] str = new String[nijitag.size()];
		
		int i = 0;
		for (NijiTagVO ddd : nijitag) {
			str[i] = ddd.getTagname();
			
			i++;
		}
		
		
		String aa = String.join(",", str);
		niji.setFullTag(aa);
		
		niji.setTag(nijitag);

		return niji;
	}

	
	@Override
	public List<NijiTagVO> getTag(String nno) {
		
		return nijiMapper.getTag(nno);
	}	


	
}
