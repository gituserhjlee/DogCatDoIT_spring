package com.pet.app.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.FileManager;
import com.pet.app.common.dao.CommonDAO;
import com.pet.app.member.Member;

@Service("myPage.myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	// 프로필 입력
	@Override
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setAnimalPhoto(saveFilename);
			}

			dao.insertData("myPage.insertUserProfile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 강아지 나이 계산
	@Override
	public int setAge(int profileNum) throws Exception {
		int age = dao.selectOne("myPage.getAge1", profileNum);
		if(age==0) {
			age = dao.selectOne("myPage.getAge2", profileNum);
		}
		return age;
	}
	
	// 프로필 업데이트
	@Override
	public void updateUserProfile(UserProfile dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			
			if(saveFilename != null) {
				if(dto.getAnimalPhoto().length()!=0	) {
					fileManager.doFileDelete(dto.getAnimalPhoto(), pathname);
				}
				
				dto.setAnimalPhoto(saveFilename);
			}
			
			dao.updateData("myPage.updateUserProfile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	// 프로필 삭제
	@Override
	public void deleteUserProfile(int profileNum, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			dao.deleteData("myPage.deleteUserProfile", profileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 프로필 읽기
	@Override
	public UserProfile readUserProfile(Map<String, Object> map) {
		UserProfile dto = null;
		try {
			dto = dao.selectOne("myPage.readUserProfile", map);
		} catch (Exception e) {
		}
		return dto;
	}
	
	// 프로필 개수 구하기
	@Override
	public int countUserProfile(String userId) {
		int result=0;
		try {
			result = dao.selectOne("myPage.countUserProfile", userId);
		} catch (Exception e) {
		}
		return result;
	}
	
	// 자격신청
	@Override
	public void insertRequestQualification(Qualification dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
				}
			dao.insertData("myPage.insertRequestQualification", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 자격 신청 내역
	@Override
	public List<Qualification> listRequestQualification(String userId) {
		List<Qualification> list = null;
		try {
			list = dao.selectList("myPage.listRequestQualification", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 자격 신청 내용
	@Override
	public Qualification readRequestQualification(int requestNum) {
		Qualification dto = null;
		try {
			dto = dao.selectOne("myPage.readRequestQualification", requestNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 자격신청 수정
	@Override
	public void updateRequestQualification(Qualification dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.updateData("myPage.updateRequestQualification", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 자격신청 삭제
	@Override
	public void deleteRequestQualification(int requestNum, String pathname) throws Exception {
		try {
			Qualification dto = readRequestQualification(requestNum);
			if(dto == null) return;
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dao.deleteData("myPage.deleteRequestQualification", requestNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 회원정보 수정
	@Override
	public void setMember(Member dto) throws Exception {
		try {
			if(dto.getEmail1().length()!=0 && dto.getEmail2().length()!=0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}
			
			if(dto.getTel1().length()!=0 && dto.getTel2().length()!=0 && dto.getTel3().length()!=0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			dao.updateData("myPage.setMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	// 회원정보 삭제
	@Override
	public void deleteMember(String userId) throws Exception {
		try {
			dao.deleteData("myPage.deleteMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 출석체크
	@Override
	public void insertAttendance(String userId) throws Exception {
		try {
			dao.insertData("myPage.insertAttendance", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 출석 카운트
	@Override
	public int countAttendance(String userId) {
		int count = 0;
		try {
			count = dao.selectOne("myPage.countAttendance", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// 출석내역
	@Override
	public Attendance readAttendance(String userId) {
		Attendance dto = null;
		try {
			dto = dao.selectOne("myPage.readAttendance", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 일정추가
	@Override
	public void insertUserCalendar(UserCalendar dto) throws Exception {
		try {
			if(dto.getAll_day()!=null) {
				dto.setStime("");
				dto.setEtime("");
			}
			
			if(dto.getStime().length()==0&&dto.getEtime().length()==0&&dto.getSday().equals(dto.getEday()))
				dto.setEday("");
			
			if(dto.getRepeat_cycle()!=0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			
			dao.insertData("myPage.insertUserCalendar", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	// 달력
	@Override
	public List<UserCalendar> listMonth(Map<String, Object> map) throws Exception {
		List<UserCalendar> list=null;
		try {
			list=dao.selectList("myPage.listMonth", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	// 일정 불러오기
	@Override
	public UserCalendar readUserCalendar(int userCalendarNum) throws Exception {
		UserCalendar dto = null;
		try {
			dto=dao.selectOne("myPage.readUserCalendar", userCalendarNum);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	// 일정 업데이트
	@Override
	public void updateUserCalendar(UserCalendar dto) throws Exception {
		try {
			if(dto.getAll_day()!=null) {
				dto.setStime("");
				dto.setEtime("");
			}
			
			if(dto.getStime().length()==0&&dto.getEtime().length()==0&&dto.getSday().equals(dto.getEday()))
				dto.setEday("");
			
			if(dto.getRepeat_cycle()!=0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			dao.updateData("myPage.updateUserCalendar", dto);
		} catch (Exception e) {
			throw e;
		}
	}
	
	// 일정 삭제
	@Override
	public void deleteUserCalendar(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("myPage.deleteUserCalendar", map);
		} catch (Exception e) {
			throw e;
		}
	}

	// 포인트 내역 등록
	@Override
	public void insertPointHistory(PointHistory dto) throws Exception {
		try {
			dao.insertData("myPage.insertPointHistory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 포인트 내역 리스트
	@Override
	public List<PointHistory> readPointHistory(Map<String, Object> map){
		List<PointHistory> list = null;
		try {
			list = dao.selectList("myPage.readPointHistory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	
}
