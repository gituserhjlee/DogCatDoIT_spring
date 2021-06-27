package com.pet.app.myPage;

import java.util.List;
import java.util.Map;

import com.pet.app.member.Member;

public interface MyPageService {
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception;
	public int setAge(int profileNum) throws Exception;
	public void updateUserProfile(UserProfile dto, String pathname) throws Exception;
	public void deleteUserProfile(int profileNum, String pathname) throws Exception;
	public UserProfile readUserProfile(int profileNum);
	public List<UserProfile> listUserProfile(String userId);
	public int countUserProfile(String userId);
	public void insertRequestQualification(Qualification dto, String pathname) throws Exception;
	public List<Qualification> listRequestQualification(String userId);
	public Qualification readRequestQualification(int requestNum);
	public void updateRequestQualification(Qualification dto, String pathname) throws Exception;
	public void deleteRequestQualification(int requestNum, String pathname) throws Exception;
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
	public int readPoint(String userId);
	public void insertPointHistory(PointHistory dto) throws Exception;
	public List<PointHistory> readPointHistory(Map<String, Object> map);
	public int pointHistoryCount(Map<String, Object> map);
	public void updateAttendancePoint(String userId) throws Exception;
	public int readAccumulation(String userId);
	public void updateClevel(String userId) throws Exception;
	public List<Posting> listPosting(Map<String, Object> map);
	public int countPosting(String userId);
}
