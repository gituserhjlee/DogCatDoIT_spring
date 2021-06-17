package com.pet.app.myPage;

import java.util.List;
import java.util.Map;

import com.pet.app.member.Member;

public interface MyPageService {
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception;
	public int setAge(int profileNum) throws Exception;
	public void updateUserProfile(UserProfile dto, String pathname) throws Exception;
	public void deleteUserProfile(int profileNum, String pathname) throws Exception;
	public UserProfile readUserProfile(Map<String, Object> map);
	public int countUserProfile(String userId);
	public void insertRequestQualification(Qualification dto, String pathname) throws Exception;
	public List<Qualification> listRequestQualification(String userId);
	public Qualification readRequestQualification(int requestNum);
	public void updateRequestQualification(Qualification dto, String pathname) throws Exception;
	public void deleteRequestQualification(int requestNum, String pathname) throws Exception;
//	public void insertMasterProfile(PetMasterProfile dto, String pathname) throws Exception;
//	public PetMasterProfile readPetMasterProfile(String userId);
//	public void updateMasterProfile(PetMasterProfile dto, String pathname) throws Exception;
//	public void deleteMasterProfile(int masterNum) throws Exception;
	public void insertAttendance(String userId) throws Exception;
	public int countAttendance(String userId);
	public Attendance readAttendance(String userId);
	public void insertUserCalendar(UserCalendar dto) throws Exception;
	public List<UserCalendar> listMonth(Map<String, Object> map) throws Exception;
	public UserCalendar readUserCalendar(int userCalendarNum) throws Exception;
	public void updateUserCalendar(UserCalendar dto) throws Exception;
	public void deleteUserCalendar(Map<String, Object> map) throws Exception;
	public void setMember(Member dto) throws Exception;
	public void deleteMember(String userId) throws Exception;
	public void insertPointHistory(PointHistory dto) throws Exception;
	public List<PointHistory> readPointHistory(Map<String, Object> map);
}
