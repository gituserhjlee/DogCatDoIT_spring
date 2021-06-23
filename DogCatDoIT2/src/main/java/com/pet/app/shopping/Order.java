package com.pet.app.shopping;

import java.util.List;

public class Order {
	// 주문정보
	private long orderIdx; // 주문번호
	private long userIdx; // 유저번호
	private int state; // 주문상태
	private String stateName;
	private String order_date; // 주문날짜
	private int totalItemPrice; // 총 상품금액
	private int deliveryPrice; // 배송금액
	private int couponDiscount; // 쿠폰할인액
	private int pointDiscount; // 포인트적용할인액
	private int totalDiscount; // 총 할인금액
	private int totalPayment; // 최종 결제금액
	private String orderMemo; // 주문메모
	private List<OrderDetail> itemList;
	private String from; // 주문출처 'item':상세페이지에서 주문 'cart': 장바구니에서 주문
	
	private String orderName; // 주문이름
	
	// 주문자 정보
	private String orName;
	private String orAddr;
	private String orTel;
	private String orTel1;
	private String orTel2;
	private String orTel3;
	private String orEmail;

	// 배송 정보
	private String diName;
	private String diZip;
	private String diAddr1;
	private String diAddr2;
	private String diTel1;
	private String diTel2;
	private String diTel3;
	private String diTel;

	// 결제정보
	private long payIdx;
	private String pay_date;
	
	// 쿠폰 정보
	private String couponName;
	
	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public long getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(long orderIdx) {
		this.orderIdx = orderIdx;
	}

	public long getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(long userIdx) {
		this.userIdx = userIdx;
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

	public int getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	public String getOrderMemo() {
		return orderMemo;
	}

	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}

	public List<OrderDetail> getItemList() {
		return itemList;
	}

	public void setItemList(List<OrderDetail> itemList) {
		this.itemList = itemList;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrName() {
		return orName;
	}

	public void setOrName(String orName) {
		this.orName = orName;
	}

	public String getOrAddr() {
		return orAddr;
	}

	public void setOrAddr(String orAddr) {
		this.orAddr = orAddr;
	}

	public String getOrTel() {
		return orTel;
	}

	public void setOrTel(String orTel) {
		this.orTel = orTel;
	}

	public String getOrTel1() {
		return orTel1;
	}

	public void setOrTel1(String orTel1) {
		this.orTel1 = orTel1;
	}

	public String getOrTel2() {
		return orTel2;
	}

	public void setOrTel2(String orTel2) {
		this.orTel2 = orTel2;
	}

	public String getOrTel3() {
		return orTel3;
	}

	public void setOrTel3(String orTel3) {
		this.orTel3 = orTel3;
	}

	public String getOrEmail() {
		return orEmail;
	}

	public void setOrEmail(String orEmail) {
		this.orEmail = orEmail;
	}

	public String getDiName() {
		return diName;
	}

	public void setDiName(String diName) {
		this.diName = diName;
	}

	public String getDiZip() {
		return diZip;
	}

	public void setDiZip(String diZip) {
		this.diZip = diZip;
	}

	public String getDiAddr1() {
		return diAddr1;
	}

	public void setDiAddr1(String diAddr1) {
		this.diAddr1 = diAddr1;
	}

	public String getDiAddr2() {
		return diAddr2;
	}

	public void setDiAddr2(String diAddr2) {
		this.diAddr2 = diAddr2;
	}

	public String getDiTel1() {
		return diTel1;
	}

	public void setDiTel1(String diTel1) {
		this.diTel1 = diTel1;
	}

	public String getDiTel2() {
		return diTel2;
	}

	public void setDiTel2(String diTel2) {
		this.diTel2 = diTel2;
	}

	public String getDiTel3() {
		return diTel3;
	}

	public void setDiTel3(String diTel3) {
		this.diTel3 = diTel3;
	}

	public String getDiTel() {
		return diTel;
	}

	public void setDiTel(String diTel) {
		this.diTel = diTel;
	}

	public long getPayIdx() {
		return payIdx;
	}

	public void setPayIdx(long payIdx) {
		this.payIdx = payIdx;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	
}
