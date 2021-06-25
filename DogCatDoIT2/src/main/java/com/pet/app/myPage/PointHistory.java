package com.pet.app.myPage;

public class PointHistory {
	private int pointNum;
	private String userId;
	private long amount;
	private String by_what;
	private String get_date;
	
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public String getBy_what() {
		return by_what;
	}
	public void setBy_what(String by_what) {
		this.by_what = by_what;
	}
	public String getGet_date() {
		return get_date;
	}
	public void setGet_date(String get_date) {
		this.get_date = get_date;
	}
}
