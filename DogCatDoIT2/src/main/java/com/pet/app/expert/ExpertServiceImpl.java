package com.pet.app.expert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("expert.expertService")
public class ExpertServiceImpl implements ExpertService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertExpert(Expert dto, String mode) throws Exception{
		try {
			int seq = dao.selectOne("expert.seq");
			
			if(mode.equals("created")) { // 새글 등록시
				dto.setExpertNum(seq);
				dto.setGroupNum(seq);
				dto.setDepth(0);
				dto.setOrderNo(0);
				dto.setParent(0);
			} else { // 답글 등록
  				// OrderNo 변경
				Map<String, Object> map =new HashMap<>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				dao.updateData("expert.updateOrderNo", map);
				
				dto.setExpertNum(seq);
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			
			dao.insertData("expert.insertExpert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("expert.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Expert> listExpert(Map<String, Object> map) {
		List<Expert> list = null;
		
		try {
			list = dao.selectList("expert.listExpert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void updateHitCount(int expertNum) throws Exception{
		try {
			dao.updateData("expert.updateHitCount", expertNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Expert readExpert(int expertNum) {
		Expert dto = null;
		try {
			dto = dao.selectOne("expert.readExpert", expertNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Expert preReadExpert(Map<String, Object> map) {
		Expert dto = null;
		try {
			dto = dao.selectOne("expert.preReadExpert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Expert nextReadExpert(Map<String, Object> map) {
		Expert dto = null;
		try {
			dto = dao.selectOne("expert.nextReadExpert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void updateExpert(Expert dto) throws Exception{
		try {
			dao.updateData("expert.updateExpert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteExpert(int expertNum, String userId) throws Exception{
		try {
			Expert dto = readExpert(expertNum);
			if(dto == null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			dao.deleteData("expert.deleteExpert", expertNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Expert> listArticleExpert(int groupNum){
		List<Expert> list = null;
		
		try {
			list = dao.selectList("expert.listArticleExpert", groupNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
