package com.pet.app.member;

// 세션에 저장할 정보(아이디, 이름, 권한등)
public class SessionInfo {
	private Long userIdx;
	private String userId;
	private String userName;
	private Long memberLevel;
	private int slevel;
	private int clevel;
	
	public Long getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(Long userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(Long memberLevel) {
		this.memberLevel = memberLevel;
	}
	public int getSlevel() {
		return slevel;
	}
	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}
	public int getClevel() {
		return clevel;
	}
	public void setClevel(int clevel) {
		this.clevel = clevel;
	}
	
}
