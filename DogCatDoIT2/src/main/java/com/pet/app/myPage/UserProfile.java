package com.pet.app.myPage;

import org.springframework.web.multipart.MultipartFile;

public class UserProfile {
	private int profileNum;
	private int userNum;
	private String animalName;
	private String animalBirth;
	private String region;
	private String animalKind;
	private String introduce;
	private int orderNo;
	private String animalPhoto;
	private MultipartFile upload;
	private int animalAge;
	
	public int getAnimalAge() {
		return animalAge;
	}
	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getAnimalPhoto() {
		return animalPhoto;
	}
	public void setAnimalPhoto(String animalPhoto) {
		this.animalPhoto = animalPhoto;
	}
	public int getProfileNum() {
		return profileNum;
	}
	public void setProfileNum(int profileNum) {
		this.profileNum = profileNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public String getAnimalBirth() {
		return animalBirth;
	}
	public void setAnimalBirth(String animalBirth) {
		this.animalBirth = animalBirth;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAnimalKind() {
		return animalKind;
	}
	public void setAnimalKind(String animalKind) {
		this.animalKind = animalKind;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}	
}
