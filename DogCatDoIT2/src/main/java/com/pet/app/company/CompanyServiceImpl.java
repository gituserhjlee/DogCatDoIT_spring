package com.pet.app.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.FileManager;
import com.pet.app.common.dao.CommonDAO;

@Service("company.companyService")
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCompany(Company dto, String pathname) throws Exception{
		try{
			
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.insertData("company.insertBoard", dto);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Company> listCompany(Map<String, Object> map) {
		List<Company> list=null;
		
		try{
			list=dao.selectList("company.listCompany", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("company.dataCount", map);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Company readCompany(int boardnum) {
		Company dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("company.readCompany", boardnum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(int boardnum) throws Exception {
		try{
			// 조회수 증가
			dao.updateData("bbs.updateHitCount", boardnum);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Company preReadCompany(Map<String, Object> map) {
		Company dto=null;
		
		try{
			dto=dao.selectOne("company.preReadCompany", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}

	@Override
	public Company nextReadCompany(Map<String, Object> map) {
		Company dto=null;
		
		try{
			dto=dao.selectOne("company.nextReadCompany", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void updateCompany(Company dto, String pathname) throws Exception{
		try{
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.updateData("company.updateCompany", dto);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCompany(int boardnum, String pathname, String userId) throws Exception{
		try{
			Company dto=readCompany(boardnum);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dao.deleteData("company.deleteCompany", boardnum);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertReview(Review dto) throws Exception {
		try {
			dao.insertData("company.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list=null;
		try {
			list=dao.selectList("company.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("company.reviewCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReview(Map<String, Object> map) throws Exception{
		try {
			dao.deleteData("company.deleteReview", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCompanyLike(Map<String, Object> map) throws Exception{
		try {
			dao.insertData("company.insertCompanyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int companyLikeCount(int boardnum) {
		int result=0;
		try {
			result=dao.selectOne("company.companyLikeCount", boardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
