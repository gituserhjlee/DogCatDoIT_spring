package com.pet.app.shopping;

public class ItemCategory {
	private long ItemCategoryId;
	private String ItemCategoryName;
	private long parentNum;
	public long getItemCategoryId() {
		return ItemCategoryId;
	}
	public void setItemCategoryId(long itemCategoryId) {
		ItemCategoryId = itemCategoryId;
	}
	public String getItemCategoryName() {
		return ItemCategoryName;
	}
	public void setItemCategoryName(String itemCategoryName) {
		ItemCategoryName = itemCategoryName;
	}
	public long getParentNum() {
		return parentNum;
	}
	public void setParentNum(long parentNum) {
		this.parentNum = parentNum;
	}
	
	
}
