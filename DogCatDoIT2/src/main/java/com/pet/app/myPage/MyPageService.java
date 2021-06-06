package com.pet.app.myPage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception;
	public void setAge(UserProfile dto) throws Exception;
	public void updateUserProfile(int profileNum, String pathname) throws Exception;
	public void deleteUserProfile(int profileNum) throws Exception;
	public List<UserProfile> readUserProfile(Map<String, Object> map);
	public void insertRequestQualification(Qualification dto, String pathname) throws Exception;
	public List<Qualification> readRequestQualification(String userId);
	public void updateRequestQualification(int requestNum, String pathname) throws Exception;
	public void deleteRequestQualification(int requestNum) throws Exception;
	public void approveRequestQualification(int requestNum) throws Exception;
	public void insertMasterProfile(PetMasterProfile dto, String pathname) throws Exception;
	public PetMasterProfile readPetMasterProfile(String userId);
	public void updateMasterProfile(int masterNum, String pathname) throws Exception;
	public void deleteMasterProfile(int masterNum) throws Exception;
	
	
}
