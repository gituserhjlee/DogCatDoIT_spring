package com.pet.app.talk;

import java.util.List;

public class Talk {
	private int num;
	private String content;
	private String senderId, senderName;
	private String receiverId, receiverName;
	private String sendDay, identifyDay;
	private String sendDelete, receiveDelete;

	private List<String> receivers;
	private String userId, name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSendDay() {
		return sendDay;
	}
	public void setSendDay(String sendDay) {
		this.sendDay = sendDay;
	}
	public String getIdentifyDay() {
		return identifyDay;
	}
	public void setIdentifyDay(String identifyDay) {
		this.identifyDay = identifyDay;
	}
	public String getSendDelete() {
		return sendDelete;
	}
	public void setSendDelete(String sendDelete) {
		this.sendDelete = sendDelete;
	}
	public String getReceiveDelete() {
		return receiveDelete;
	}
	public void setReceiveDelete(String receiveDelete) {
		this.receiveDelete = receiveDelete;
	}
	public List<String> getReceivers() {
		return receivers;
	}
	public void setReceivers(List<String> receivers) {
		this.receivers = receivers;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
