package com.pet.app.cAdmin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;
import com.pet.app.myPage.Qualification;

@Service("cAdmin.communityAdminService")
public class CommunityAdminServiceImpl implements CommunityAdminService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int memberCount() {
		int memberCount = 0;
		try {
			memberCount = dao.selectOne("cAdmin.memberCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberCount;
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;
		try {
			dto = dao.selectOne("cAdmin.readMember", userId);
			
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
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		try {
			list = dao.selectList("cAdmin.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Qualification> listRequestQualification(Map<String, Object> map) {
		List<Qualification> list = null;
		try {
			list = dao.selectList("cAdmin.listRequestQualification", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void updateRequestQualification(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("cAdmin.updateRequestQualification", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateQualification(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("cAdmin.updateQualification", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void deleteQualification(String userId) throws Exception {
		try {
			dao.deleteData("cAdmin.deleteQualification", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int requestCount() {
		int requestCount = 0;
		try {
			requestCount = dao.selectOne("cAdmin.requestCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestCount;
	}

	@Override
	public void updateClevel(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("cAdmin.updateClevel", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updatePoint(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("cAdmin.updatePoint", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
