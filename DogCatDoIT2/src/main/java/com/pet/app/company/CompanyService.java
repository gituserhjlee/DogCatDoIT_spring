package com.pet.app.company;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	public void insertCompany(Company dto, String pathname) throws Exception;
	public List<Company> listCompany(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Company readCompany(int boardnum);
	public void updateHitCount(int boardnum) throws Exception;
	public Company preReadCompany(Map<String, Object> map);
	public Company nextReadCompany(Map<String, Object> map);
	public void updateCompany(Company dto, String pathname) throws Exception;
	public void deleteCompany(int boardnum, String pathname, String userId) throws Exception;
	
	public void insertCompanyLike(Map<String, Object> map) throws Exception;
	public int companyLikeCount(int boardnum);
	
	public void insertReview(Review dto) throws Exception;
	public List<Review> listReview(Map<String, Object> map);
	public int reviewCount(Map<String, Object> map);
	public void deleteReview(Map<String, Object> map) throws Exception;
	}


