package com.pet.app.myPage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.FileManager;
import com.pet.app.common.dao.CommonDAO;

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
			String animalPhoto = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(animalPhoto!=null) {
				dto.setAnimalPhoto(animalPhoto);
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
}
