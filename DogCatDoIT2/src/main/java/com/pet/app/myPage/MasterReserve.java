package com.pet.app.myPage;

public class MasterReserve {
	private int reserveNum;
	private int userNum;
	private int serviceNum;
	private String reserveTime;
	private String memo;
	private String state;
	
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getServiceNum() {
		return serviceNum;
	}
	public void setServiceNum(int serviceNum) {
		this.serviceNum = serviceNum;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}