package com.pet.app.shopping;

public class Coupon {
	private long couponNum;
	private String couponName;
	private String deadline;
	private int stock;
	private int rate;
	private boolean end;
	
	public long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public boolean isEnd() {
		return end;
	}
	public void setEnd(boolean end) {
		this.end = end;
	}
	
	
}
