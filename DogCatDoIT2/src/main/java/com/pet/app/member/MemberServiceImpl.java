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
		try {
			if(dto.getEmail1().length()!=0 && dto.getEmail2().length()!=0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}
			
			if(dto.getTel1().length()!=0 && dto.getTel2().length()!=0 && dto.getTel3().length()!=0) {
				dto.setTel(dto.getTel1()+ "-"+dto.getTel2()+ "-"+ dto.getTel3());
			}
			
			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setUserIdx(memberSeq);
			
			dao.insertData("member.insertMember", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
	public Member readMember(String userId) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.readMember", userId);
			
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
					
				}
				
				if(dto.getTel()!=null) {
					String [] s=dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
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

	@Override
	public void insertQualification(String userId) throws Exception {
		try {
			dao.insertData("member.insertQualification", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
}
