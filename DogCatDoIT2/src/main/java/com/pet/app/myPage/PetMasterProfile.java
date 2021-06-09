package com.pet.app.myPage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PetMasterProfile {
	private int masterNum;
	private String userId;
	private String introduce;
	private String qualification;
	private String reg_date;
	private String region;
	private String imageFilename;
	private List<MultipartFile> uploads;
	
	public int getMasterNum() {
		return masterNum;
	}
	public void setMasterNum(int masterNum) {
		this.masterNum = masterNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public List<MultipartFile> getUploads() {
		return uploads;
	}
	public void setUploads(List<MultipartFile> uploads) {
		this.uploads = uploads;
	}
	
}