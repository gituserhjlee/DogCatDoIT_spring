package com.pet.app.cAdmin;

import java.util.List;
import java.util.Map;

import com.pet.app.myPage.Qualification;

public interface CommunityAdminService {
	public int memberCount();
	public Member readMember(String userId);
	public List<Member> listMember(Map<String, Object> map);
	public List<Qualification> listRequestQualification(Map<String, Object> map);
	public void updateRequestQualification(Map<String, Object> map) throws Exception;
	public void updateQualification(Map<String, Object> map) throws Exception;
	public void deleteQualification(String userId) throws Exception;
	public int requestCount();
	public void updateClevel(Map<String, Object> map) throws Exception;
	public void updatePoint(Map<String, Object> map) throws Exception;
	public String readShopLevel(long userIdx);
}
