package com.pet.app.shopping;

import org.springframework.web.multipart.MultipartFile;

public class Item {

	private long itemId;//시퀀스
	private long itemCategoryId;
	private long shopStoreId;
	private String itemName;
	private long itemOriginalPrice;
	private long itemSalePrice;
	private int discountRate;
	private long discountedPrice;
	private String registered;//sysdate
	private String saveFileName;
	private String des;
	private String content;
	private boolean enabled;//초기엔 true
	private String manufacturer;
	private MultipartFile upload;
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	
	public long getItemCategoryId() {
		return itemCategoryId;
	}
	public void setItemCategoryId(long itemCategoryId) {
		this.itemCategoryId = itemCategoryId;
	}
	public long getShopStoreId() {
		return shopStoreId;
	}
	public void setShopStoreId(long shopStoreId) {
		this.shopStoreId = shopStoreId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public long getItemOriginalPrice() {
		return itemOriginalPrice;
	}
	public void setItemOriginalPrice(long itemOriginalPrice) {
		this.itemOriginalPrice = itemOriginalPrice;
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
	public String getRegistered() {
		return registered;
	}
	public void setRegistered(String registered) {
		this.registered = registered;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public long getDiscountedPrice() {
		return discountedPrice;
	}
	public void setDiscountedPrice(long discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	
	
	
	

	

}
