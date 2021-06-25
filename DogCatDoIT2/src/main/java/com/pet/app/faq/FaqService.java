package com.pet.app.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public void insertFaq(Faq dto) throws Exception;
	public List<Faq> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Faq readFaq(int num);
	public void updateFaq(Faq dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	
	public void insertCategory(Faq dto) throws Exception;
	public void updateCategory(Faq dto) throws Exception;
	public List<Faq> listCategory(Map<String, Object> map);
	public void deleteCategory(int categoryNum) throws Exception;
}


