package com.pet.app.myPage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception;
	public int setAge(int profileNum) throws Exception;
	public void updateUserProfile(UserProfile dto, String pathname) throws Exception;
	public void deleteUserProfile(int profileNum, String pathname) throws Exception;
	public UserProfile readUserProfile(Map<String, Object> map);
	public int countUserProfile(String userId);
//	public void insertRequestQualification(Qualification dto, String pathname) throws Exception;
//	public List<Qualification> readRequestQualification(String userId);
//	public void updateRequestQualification(Qualification dto, String pathname) throws Exception;
//	public void deleteRequestQualification(int requestNum, String pathname) throws Exception;
//	public void approveRequestQualification(int requestNum) throws Exception;
//	public void insertMasterProfile(PetMasterProfile dto, String pathname) throws Exception;
//	public PetMasterProfile readPetMasterProfile(String userId);
//	public void updateMasterProfile(PetMasterProfile dto, String pathname) throws Exception;
//	public void deleteMasterProfile(int masterNum) throws Exception;
	
	
}
