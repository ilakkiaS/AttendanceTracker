package com.acc.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.acc.entity.ResourceMaster;

public interface DaoFacade {
	public ResourceMaster searchEmployee(String enterpriseId) throws ClassNotFoundException, SQLException;
	public ResourceMaster loginEmployee(String enterpriseId,String password) throws ClassNotFoundException, SQLException;
	public int signupEmployee(String enterpriseId, String password) throws ClassNotFoundException, SQLException;
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData, String flag)throws ClassNotFoundException,SQLException;
	public ArrayList<ResourceMaster> approve(long employeeId)throws ClassNotFoundException,SQLException;
	public ArrayList<String> getCalendarData(long employeeId, String month, int year)throws ClassNotFoundException,SQLException;
	public ArrayList<ResourceMaster> allEmployeeDetails()throws ClassNotFoundException,SQLException;
	public ArrayList<Integer> generateReport(String month, int year, long employeeId)throws ClassNotFoundException,SQLException;
	public int addNewEmployee(ResourceMaster resource,String creatorName)throws ClassNotFoundException,SQLException;
	public int addNewProject(String projectName,String projectDescription,String creatorName)throws ClassNotFoundException,SQLException;
	public  Map<String,Integer> statistics()throws ClassNotFoundException,SQLException;
}
