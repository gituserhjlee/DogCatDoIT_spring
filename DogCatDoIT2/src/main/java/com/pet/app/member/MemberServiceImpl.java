package com.pet.app.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member loginMember(String userId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member readMember(String userIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		return 0;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		
		return list;
	}

	
}
