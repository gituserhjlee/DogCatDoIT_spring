package com.pet.app.shopping;

public class OrderDetail {
	private long sodIdx;
	private long orderIdx;

	// 아이템
	private long itemId;
	private String itemName;
	private String saveFilename;
	private long itemSalePrice;
	private int discountRate;
	private long discountedPrice;
	private long discountPrice;
	private int count;
	private long totalPrice;

	// 아이템 옵션 
	private long optionId;
	private String optionName;
	// 디테일 옵션
	private long detailId;
	private String detailName;
	// 카트 옵션
	private long cartIdx;
	
	public long getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(long discountPrice) {
		this.discountPrice = discountPrice;
	}
	public long getCartIdx() {
		return cartIdx;
	}
	public void setCartIdx(long cartIdx) {
		this.cartIdx = cartIdx;
	}
	public long getSodIdx() {
		return sodIdx;
	}
	public void setSodIdx(long sodIdx) {
		this.sodIdx = sodIdx;
	}
	public long getOrderIdx() {
		return orderIdx;
	}
	public void setOrderIdx(long orderIdx) {
		this.orderIdx = orderIdx;
	}
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public long getItemSalePrice() {
		return itemSalePrice;
	}
	public void setItemSalePrice(long itemSalePrice) {
		this.itemSalePrice = itemSalePrice;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public long getDiscountedPrice() {
		return discountedPrice;
	}
	public void setDiscountedPrice(long discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getOptionId() {
		return optionId;
	}
	public void setOptionId(long optionId) {
		this.optionId = optionId;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public long getDetailId() {
		return detailId;
	}
	public void setDetailId(long detailId) {
		this.detailId = detailId;
	}
	public String getDetailName() {
		return detailName;
	}
	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}

}
