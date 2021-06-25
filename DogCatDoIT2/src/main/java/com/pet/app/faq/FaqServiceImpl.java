package com.pet.app.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("faq.faqService")
public class FaqServiceImpl implements FaqService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFaq(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list=dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Faq readFaq(int num) {
		Faq dto = null;
		try {
			dto = dao.selectOne("faq.readFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFaq(Faq dto) throws Exception {
		try {
			dao.updateData("faq.updateFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faq.deleteFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCategory(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCategory(Faq dto) throws Exception {
		try {
			dao.updateData("faq.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Faq> listCategory(Map<String, Object> map) {
		List<Faq> listCategory = null;
		try {
			listCategory = dao.selectList("faq.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("faq.deleteCategory", categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
