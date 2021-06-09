package com.pet.app.myPage;

import org.springframework.web.multipart.MultipartFile;

public class UserProfile {
	private int profileNum;
	private String userId;
	private String animalName;
	private String animalBirth;
	private String region;
	private String animalKind;
	private String introduce;
	private int orderNum;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}	
}
