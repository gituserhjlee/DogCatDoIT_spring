package com.pet.app.myPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("myPage.myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertUserProfile(UserProfile dto, String pathname) throws Exception {
		try {
			dao.insertData("myPage.insertUserProfile", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
