package com.pet.app.shopping;

public class Cart {
	private long basketIdx;
	private long userIdx;
	private String basket_date;
	private long detailId;
	private int count;

	public long getBasketIdx() {
		return basketIdx;
	}

	public void setBasketIdx(long basketIdx) {
		this.basketIdx = basketIdx;
	}

	public long getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(long userIdx) {
		this.userIdx = userIdx;
	}

	public String getBasket_date() {
		return basket_date;
	}

	public void setBasket_date(String basket_date) {
		this.basket_date = basket_date;
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
