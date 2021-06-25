package com.pet.app.junggo;

import java.util.List;
import java.util.Map;

public interface JunggoService {
	public void insertJunggo(Junggo dto) throws Exception;
	public List<Junggo> listJunggo(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Junggo readJunggo(int num);
	public void updateJunggo(Junggo dto) throws Exception;
	public void deleteJunggo(Map<String, Object> map) throws Exception;
	void updateHitCount(int num) throws Exception;
	
	public void insertCategory(Junggo dto) throws Exception;
	public void updateCategory(Junggo dto) throws Exception;
	public List<Junggo> listCategory(Map<String, Object> map);
	public void deleteCategory(int categoryNum) throws Exception;
	
	
	public int replyCount(Map<String, Object> map);
	public List<JReply> listReply(Map<String, Object> map);
	public void insertReply(JReply dto) throws Exception;
	public void deleteReply(Map<String, Object> paramMap) throws Exception;

}


