package com.acc.service;


import java.util.ArrayList;
import java.util.Map;

import com.acc.entity.ResourceMaster;

public interface ServiceFacade {
	public ResourceMaster searchEmployee(String enterpriseId);
	public ResourceMaster loginEmployee(String enterpriseId,String password);
	public int signupEmployee(String enterpriseId, String password);
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData, String flag);
	public ArrayList<ResourceMaster> approve(long employeeId);
	public ArrayList<String> getCalendarData(long employeeId, String month, int year);
	public ArrayList<ResourceMaster> allEmployeeDetails();
	public ArrayList<Integer> generateReport(String month, int year, long employeeId);
	public int addNewEmployee(ResourceMaster resource, String creatorName);
	public int addNewProject(String projectName,String projectDescription,String creatorName);
	public   Map<String,Integer> statistics();

}
