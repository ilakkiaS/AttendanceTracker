package com.acc.entity;

import java.util.List;

public class CalendarData {
	private Long employeeId;
	private String month;
	private int year;
	private List<DayData> dayData;
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public List<DayData> getDayData() {
		return dayData;
	}
	public void setDayData(List<DayData> dayData) {
		this.dayData = dayData;
	}

}
