package com.pet.app.shopping;

public class Order {
	private long orderIdx; // 주문번호
	private long userNum; // 유저번호
	private int state; // 주문상태
	private String order_date; // 주문날짜
	private int totalItemPrice; // 총상품금액
	private int deliveryPrice; // 배송금액
	private int couponDiscount; // 쿠폰할인액
	private int pointDiscount; // 포인트적용할인액
	private int totalDiscount; // 총 할인금액
	private int totalAmount; // 최종결제금액
	private String memo; // 주문메모

	private String couponIdx; // 주문쿠폰번호(id)
	private String couponNum; // 쿠폰번호
	private String couponName;

	public long getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(long orderIdx) {
		this.orderIdx = orderIdx;
	}

	public long getUserNum() {
		return userNum;
	}

	public void setUserNum(long userNum) {
		this.userNum = userNum;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getTotalItemPrice() {
		return totalItemPrice;
	}

	public void setTotalItemPrice(int totalItemPrice) {
		this.totalItemPrice = totalItemPrice;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public int getCouponDiscount() {
		return couponDiscount;
	}

	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}

	public int getPointDiscount() {
		return pointDiscount;
	}

	public void setPointDiscount(int pointDiscount) {
		this.pointDiscount = pointDiscount;
	}

	public int getTotalDiscount() {
		return totalDiscount;
	}

	public void setTotalDiscount(int totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCouponIdx() {
		return couponIdx;
	}

	public void setCouponIdx(String couponIdx) {
		this.couponIdx = couponIdx;
	}

	public String getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(String couponNum) {
		this.couponNum = couponNum;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

}
