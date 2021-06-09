package com.pet.app.shopping;

public class ShopReview {
	private long useridx;
	private long itemId;
	private int score;
	private String content;
	private String registered;
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegistered() {
		return registered;
	}
	public void setRegistered(String registered) {
		this.registered = registered;
	}

	
}
