package com.pet.app.myPage;

import java.util.List;
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

	@Override
	public void setAge(UserProfile dto) throws Exception {
		int age = dao.selectOne("myPage.getAge1");
		if(age==0) {
			age = dao.selectOne("myPage.getAge2");
		}
		dto.setAnimalAge(age);
	}

	@Override
	public void updateUserProfile(int profileNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserProfile(int profileNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserProfile> readUserProfile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertRequestQualification(Qualification dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Qualification> readRequestQualification(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateRequestQualification(int requestNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRequestQualification(int requestNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void approveRequestQualification(int requestNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertMasterProfile(PetMasterProfile dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PetMasterProfile readPetMasterProfile(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMasterProfile(int masterNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMasterProfile(int masterNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
