package com.pet.app.shopping;

public class BestItemDTO {
	private long detailid;
	private String itemname;
	private String optionname;
	private String detailname;
	private int qty;
	public long getDetailid() {
		return detailid;
	}
	public void setDetailid(long detailid) {
		this.detailid = detailid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getOptionname() {
		return optionname;
	}
	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}
	public String getDetailname() {
		return detailname;
	}
	public void setDetailname(String detailname) {
		this.detailname = detailname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
