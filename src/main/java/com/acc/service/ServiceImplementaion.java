package com.acc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acc.dao.DaoImplementation;
import com.acc.entity.ResourceMaster;

public class ServiceImplementaion implements ServiceFacade{
	ResourceMaster resource = new ResourceMaster();
	DaoImplementation daoImpl = new DaoImplementation();
	public ResourceMaster searchEmployee(String enterpriseId) {
		
		try{
			resource = daoImpl.searchEmployee(enterpriseId);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return resource;
	}
	public ResourceMaster loginEmployee(String enterpriseId, String password) {
		
		try{
			resource = daoImpl.loginEmployee(enterpriseId,password);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return resource;
	}
	public int signupEmployee(String enterpriseId, String password) {
		int count = 0;
		try{
			count = daoImpl.signupEmployee(enterpriseId,password);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData) {
		int count = 0;
		try{
			 count = daoImpl.calendarDataStore(employeeId, year, month, shiftData);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<ResourceMaster> approve(long employeeId) {
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		try{
			employeeObjects = daoImpl.approve(employeeId);
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return employeeObjects;
	}
	public ArrayList<String> getCalendarData(long employeeId, String month, int year) {
		ArrayList<String> calendarData = new ArrayList<String>();
		try{
			calendarData = daoImpl.getCalendarData(employeeId, month, year);
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return calendarData;
	}
	public ArrayList<ResourceMaster> allEmployeeDetails() {
		ArrayList<ResourceMaster> allEmployeesData = new ArrayList<ResourceMaster>();
		try{
			allEmployeesData = daoImpl.allEmployeeDetails();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return allEmployeesData;
	}
	public ArrayList<Integer> generateReport(String month, long employeeId) {
		ArrayList<Integer> reportData = new ArrayList<Integer>();
		try{
			reportData = daoImpl.generateReport(month, employeeId);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return reportData;
	}

}