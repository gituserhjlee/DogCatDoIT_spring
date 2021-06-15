package com.pet.app.myPage;

public class Attendance {
	private String userId;
	private int attendanceNum;
	private String attendanceDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAttendanceNum() {
		return attendanceNum;
	}
	public void setAttendanceNum(int attendanceNum) {
		this.attendanceNum = attendanceNum;
	}
	public String getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
}
