package com.pet.app.expert;

import java.util.List;
import java.util.Map;

public interface ExpertService {
	public void insertExpert(Expert dto, String mode) throws Exception;
	
	
	public int dataCount(Map<String, Object> map);
	public List<Expert> listExpert(Map<String, Object> map);

	public void updateHitCount(int expertNum) throws Exception;
	public Expert readExpert(int expertNum);
	public Expert preReadExpert(Map<String, Object> map);
	public Expert nextReadExpert(Map<String, Object> map);
	
	public void updateExpert(Expert dto) throws Exception;
	public void deleteExpert(int expertNum, String userId) throws Exception;
	
	public List<Expert> listArticleExpert(int groupNum);
	
}
