package com.pet.app.myPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("myPage.myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertUserProfile(UserProfile dto) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
