package com.pet.app.shopping;

public class Cart {
	private long cartIdx;
	private long userIdx;
	private String cart_date;
	private long detailId;
	private int count;

	public long getCartIdx() {
		return cartIdx;
	}

	public void setCartIdx(long cartIdx) {
		this.cartIdx = cartIdx;
	}

	public long getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(long userIdx) {
		this.userIdx = userIdx;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}

	public long getDetailId() {
		return detailId;
	}

	public void setDetailId(long detailId) {
		this.detailId = detailId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
