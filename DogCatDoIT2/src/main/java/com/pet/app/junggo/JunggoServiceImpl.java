package com.pet.app.junggo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;


@Service("junggo.junggoService")
public class JunggoServiceImpl implements JunggoService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertJunggo(Junggo dto) throws Exception {
		try {
			dao.insertData("junggo.insertJunggo", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Junggo> listJunggo(Map<String, Object> map) {
		List<Junggo> list = null;
		
		try {
			list=dao.selectList("junggo.listJunggo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("junggo.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try{
			// 조회수 증가
			dao.updateData("junggo.updateHitCount", num);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public Junggo readJunggo(int num) {
		Junggo dto = null;
		try {
			dto = dao.selectOne("junggo.readJunggo", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateJunggo(Junggo dto) throws Exception {
		try {
			dao.updateData("junggo.updateJunggo", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteJunggo(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("junggo.deleteJunggo", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCategory(Junggo dto) throws Exception {
		try {
			dao.insertData("junggo.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCategory(Junggo dto) throws Exception {
		try {
			dao.updateData("junggo.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Junggo> listCategory(Map<String, Object> map) {
		List<Junggo> listCategory = null;
		try {
			listCategory = dao.selectList("junggo.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("junggo.deleteCategory", categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("j.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<JReply> listReply(Map<String, Object> map) {
		List<JReply> list=null;
		try {
			list=dao.selectList("junggo.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("junggo.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void insertReply(JReply dto) throws Exception {
		try {
			dao.insertData("junggo.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	

	

}
