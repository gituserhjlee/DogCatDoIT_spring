package com.pet.app.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String userIdx);
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public void insertQualification(String userId) throws Exception;
}
