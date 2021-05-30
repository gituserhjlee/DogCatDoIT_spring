package com.pet.app.myPage;

public class Qualification {
	private int requestNum;
	private int userNum;
	private String originalFilename;
	private String saveFilename;
	private String gubun;
	private String state;
	
	public int getRequestNum() {
		return requestNum;
	}
	public void setRequestNum(int requestNum) {
		this.requestNum = requestNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}