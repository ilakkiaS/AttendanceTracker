package com.acc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acc.entity.ResourceMaster;
import com.acc.helper.DatabaseConnection;

public class DaoImplementation implements DaoFacade {
	private static Connection connection = null;
	PreparedStatement statement = null;
	public ResourceMaster searchEmployee(String enterpriseId) throws ClassNotFoundException, SQLException {
		ResourceMaster resource = new ResourceMaster();
		connection = DatabaseConnection.createConnection();
		if(connection != null)
		{
			statement = connection.prepareStatement("select * from employee where enterprise_id = ?");
			statement.setString(1, enterpriseId);
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{
				resource.setEmployeeName(rs.getString("employee_name"));
				resource.setEnterpriseId(rs.getString("enterprise_id"));
				resource.setEmployeeId(rs.getLong("employee_id"));
				resource.setPassword(rs.getString("password"));
				resource.setDesignation(rs.getString("designation"));
			}
		}
		DatabaseConnection.closeConnection();
		return resource;
	}
	public ResourceMaster loginEmployee(String enterpriseId, String password)
			throws ClassNotFoundException, SQLException {
		ResourceMaster resource = new ResourceMaster();
		connection = DatabaseConnection.createConnection();
		if(connection != null)
		{
			statement = connection.prepareStatement("select * from employee where enterprise_id = ? and password = ?");
			statement.setString(1, enterpriseId);
			statement.setString(2, password);
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{
				resource.setEmployeeName(rs.getString("employee_name"));
				resource.setEnterpriseId(rs.getString("enterprise_id"));
				resource.setEmployeeId(rs.getLong("employee_id"));
				resource.setPassword(rs.getString("password"));
				resource.setDesignation(rs.getString("designation"));
			}
			
		}
		DatabaseConnection.closeConnection();
		return resource;
	}
	public int signupEmployee(String enterpriseId, String password) throws ClassNotFoundException, SQLException {
		connection = DatabaseConnection.createConnection();
		int count = 0;
		if(connection != null)
		{
			statement = connection.prepareStatement("update employee set password = ? where enterprise_id = ?");
			statement.setString(1, password);
			statement.setString(2, enterpriseId);
			count = statement.executeUpdate();
		}
		DatabaseConnection.closeConnection();
		return count;
	}
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData)
			throws ClassNotFoundException, SQLException {
		connection = DatabaseConnection.createConnection();
		int count = 0;
		String monthYear = month + year;
		String query = "insert into " + monthYear + " values("+employeeId;
		int length = shiftData.length - 1;
		for(int i = 1 ; i <= length ; i++)
		{
			query = query +",'"+ shiftData[i]+"'";
		}
		query = query + ");";
		
		if(connection != null)
		{
			statement = connection.prepareStatement(query);
			count = statement.executeUpdate();

		}
		DatabaseConnection.closeConnection();
		return count;
	}
	public ArrayList<ResourceMaster> approve(long employeeId) throws ClassNotFoundException, SQLException {
		connection = DatabaseConnection.createConnection();
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		
		if(connection != null)
		{
			statement = connection.prepareStatement("select * from employee where supervisor_id = ?");
			statement.setLong(1, employeeId);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				ResourceMaster resource = new ResourceMaster();
				resource.setEmployeeId(resultSet.getLong("employee_id"));
				resource.setEnterpriseId(resultSet.getString("enterprise_id"));
				resource.setEmployeeName(resultSet.getString("employee_name"));
				employeeObjects.add(resource);
			}
		}
		DatabaseConnection.closeConnection();
		
		return employeeObjects;
	}
	public ArrayList<String> getCalendarData(long employeeId, String month, int year) throws ClassNotFoundException, SQLException {
		connection = DatabaseConnection.createConnection();
		ArrayList<String> calendarData = new ArrayList<String>();
		int length = 0;
		String query = "select * from "+month+year+" where employee_id = ?";
		if(month.equalsIgnoreCase("january") || month.equalsIgnoreCase("march") || month.equalsIgnoreCase("may") || month.equalsIgnoreCase("july") || month.equalsIgnoreCase("august") || month.equalsIgnoreCase("october") || month.equalsIgnoreCase("december"))
			length = 31;
		else if(month.equalsIgnoreCase("april") || month.equalsIgnoreCase("june") || month.equalsIgnoreCase("september") || month.equalsIgnoreCase("november"))
			length = 30;
		else
		{
			if(year % 400 == 0)
				length = 29;
			else if(year % 100 == 0)
				length = 28;
			else if(year % 4 == 0)
				length = 29;
			else
				length = 28;
		}
		if(connection != null)
		{
			statement = connection.prepareStatement(query);
			statement.setLong(1, employeeId);
			ResultSet resultSet = statement.executeQuery();
			resultSet.next();
			for(int i = 2; i <= length + 1; i++)
			{
				calendarData.add(resultSet.getString(i));
			}
			
		}
		DatabaseConnection.closeConnection();
		return calendarData;
	}
	public ArrayList<ResourceMaster> allEmployeeDetails() throws ClassNotFoundException, SQLException {
		connection = DatabaseConnection.createConnection();
		ArrayList<ResourceMaster> allEmployeesData = new ArrayList<ResourceMaster>();
		
		if(connection != null)
		{
			statement = connection.prepareStatement("select * from employee");
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				ResourceMaster resource = new ResourceMaster();
				resource.setEmployeeId(resultSet.getLong("employee_id"));
				resource.setEnterpriseId(resultSet.getString("enterprise_id"));
				resource.setEmployeeName(resultSet.getString("employee_name"));
				resource.setDesignation(resultSet.getString("designation"));
				resource.setSupervisorId(resultSet.getLong("supervisor_id"));
				resource.setTechnology(resultSet.getString("technology"));
				allEmployeesData.add(resource);
			}
		}
		DatabaseConnection.closeConnection();
		return allEmployeesData;
	}
	public ArrayList<Integer> generateReport(String month, long employeeId) throws ClassNotFoundException, SQLException {
		ArrayList<Integer> reportData = new ArrayList<Integer>();
		connection = DatabaseConnection.createConnection();
		String query = "select * from "+month+" where employee_id="+employeeId;
		System.out.println(query);
		int aCount = 0, bCount = 0, cCount = 0;
		if(connection != null)
		{
			statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			ResultSetMetaData rsmd = resultSet.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			resultSet.next();
			for(int i = 2 ; i <= columnsNumber ; i++ )
			{
					if(resultSet.getString(i).equals("a"))
						aCount++;
					if(resultSet.getString(i).equals("b"))
						bCount++;
					if(resultSet.getString(i).equals("c"))
						cCount++;
							
			}
			reportData.add(aCount);
			reportData.add(bCount);
			reportData.add(cCount);
		}
		
		DatabaseConnection.closeConnection();
		return reportData;
	}

}
