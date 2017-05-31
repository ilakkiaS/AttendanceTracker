package com.acc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.DaoFacade;
import com.acc.dao.DaoImplementation;
import com.acc.entity.ResourceMaster;
@Service
public class ServiceImplementaion implements ServiceFacade{
	@Autowired
	DaoFacade dao;
	ResourceMaster resource = new ResourceMaster();
	DaoImplementation daoImpl = new DaoImplementation();
	@Transactional
	public ResourceMaster searchEmployee(String enterpriseId) {
		
		try{
			resource = dao.searchEmployee(enterpriseId);
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
	@Transactional
	public ResourceMaster loginEmployee(String enterpriseId, String password) {
		
		try{
			resource = dao.loginEmployee(enterpriseId,password);
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
	@Transactional
	public int signupEmployee(String enterpriseId, String password) {
		int count = 0;
		try{
			count = dao.signupEmployee(enterpriseId,password);
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
	@Transactional
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData) {
		int count = 0;
		try{
			 count = dao.calendarDataStore(employeeId, year, month, shiftData);
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
	@Transactional
	public ArrayList<ResourceMaster> approve(long employeeId) {
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		try{
			employeeObjects = dao.approve(employeeId);
			
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
	@Transactional
	public ArrayList<ResourceMaster> allEmployeeDetails() {
		ArrayList<ResourceMaster> allEmployeesData = new ArrayList<ResourceMaster>();
		try{
			allEmployeesData = dao.allEmployeeDetails();
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
	@Transactional
	public ArrayList<Integer> generateReport(String month, int year, long employeeId) {
		ArrayList<Integer> reportData = new ArrayList<Integer>();
		try{
			reportData = dao.generateReport(month, year, employeeId);
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
