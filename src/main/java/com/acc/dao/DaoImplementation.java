package com.acc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.acc.entity.CalendarData;
import com.acc.entity.DayData;
import com.acc.entity.Project;
//import com.acc.entity.Project;
import com.acc.entity.ResourceMaster;
import com.acc.entity.Timesheet;
import com.acc.helper.DatabaseConnection;
@Repository
public class DaoImplementation extends AbstractDao implements DaoFacade {
	
	PreparedStatement statement = null;
	public ResourceMaster searchEmployee(String enterpriseId) throws ClassNotFoundException, SQLException {
		
		Session session=getSession();
		Query query=session.createQuery("select e from  ResourceMaster e where e.enterpriseId=:entId");
		query.setParameter("entId", enterpriseId);
		List<ResourceMaster> empList=query.list();
		ResourceMaster resource = new ResourceMaster();

		for(ResourceMaster resources:empList)
		{
			resource = resources;
		}
		return resource;
	}
	public ResourceMaster loginEmployee(String enterpriseId, String password)
			throws ClassNotFoundException, SQLException {
		
		Session session=getSession();
		Query query=session.createQuery("select e from  ResourceMaster e where e.enterpriseId=:entId and e.password=:pass");
		query.setParameter("entId", enterpriseId);
		query.setParameter("pass",password);
		ResourceMaster resource = new ResourceMaster();
		List<ResourceMaster> empList=query.list();
		for(ResourceMaster resources:empList)
		{
			resource = resources;
		}
		return resource;
	}
	public int signupEmployee(String enterpriseId, String password) throws ClassNotFoundException, SQLException {
		int count = 0;
		Session session=getSession();Query query=session.createQuery("update ResourceMaster r set r.password=:password where r.enterpriseId=:enterpriseid");
		query.setParameter("enterpriseid", enterpriseId);
		query.setParameter("password",password);
		count = query.executeUpdate();
		return count;
	}
	public int calendarDataStore(long employeeId, int year, String month, String[] shiftData, String flag)
			throws ClassNotFoundException, SQLException {
		int count;
		Session session=getSession();
		 if(flag.equals("update")){
			Query query=session.createQuery("select e from  Timesheet e where e.employeeId=:empId and e.month=:month and e.year=:year");
			query.setParameter("empId", employeeId);
			query.setParameter("month",month);
			query.setParameter("year",year);
			List<Timesheet> empList=query.list();
			for(Timesheet timesheet:empList){
				session.delete(timesheet);
				}
		 	}
		 for(count = 1 ; count < shiftData.length ; count++){
				Timesheet timesheet = new Timesheet();
				timesheet.setEmployeeId(employeeId);
				timesheet.setMonth(month);
				timesheet.setYear(year);
				timesheet.setDate(count);
				timesheet.setShift(shiftData[count]);
				session.save(timesheet);
				}
		
		if(count == shiftData.length)
			return 1;
		else
			return 0;
	}
	public ArrayList<ResourceMaster> approve(long employeeId) throws ClassNotFoundException, SQLException {
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		Session session=getSession();
		Query query=session.createQuery("select e from  ResourceMaster e where e.supervisorId=:supId");
		query.setParameter("supId", employeeId);
		List<ResourceMaster> empList=query.list();
		for(ResourceMaster resource:empList)
		{
			employeeObjects.add(resource);
		}
		
		return employeeObjects;
	}
	public CalendarData getCalendarData(long employeeId, String month, int year) throws ClassNotFoundException, SQLException {
		int length = 0;
		CalendarData calendarData = new CalendarData();
		calendarData.setEmployeeId(employeeId);
		calendarData.setMonth(month);
		calendarData.setYear(year);
		List<DayData> dayData = new ArrayList<DayData>();
		Session session=getSession();
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
		for(int i = 1  ; i <= length ; i++)
		{
			Query query=session.createQuery("select e from  Timesheet e where employeeId=:empId and date=:date and month=:month and year=:year");
			DayData day_Data = new DayData();
			query.setParameter("empId", employeeId);
			query.setParameter("date", i);
			query.setParameter("month", month);
			query.setParameter("year", year);
			List<Timesheet> timesheet=query.list();
			for(Timesheet time : timesheet)
			{
				day_Data.setDate(time.getDate());
				day_Data.setShift(time.getShift());
			}
			dayData.add(day_Data);
		}
		calendarData.setDayData(dayData);
		return calendarData;
	}
	public ArrayList<ResourceMaster> allEmployeeDetails() throws ClassNotFoundException, SQLException {
		ArrayList<ResourceMaster> allEmployeesData = new ArrayList<ResourceMaster>();
		Session session=getSession();
		Query query=session.createQuery("select e from  ResourceMaster e ");
		List<ResourceMaster> empList=query.list();
		for(ResourceMaster resource:empList)
		{
			System.out.println(resource.getSupervisorId());
			allEmployeesData.add(resource);
		}
		return allEmployeesData;
	}
	public ArrayList<Integer> generateReport(String month, int year, long employeeId) throws ClassNotFoundException, SQLException {
		ArrayList<Integer> reportData = new ArrayList<Integer>();
		int aCount = 0, bCount = 0, cCount = 0;
		String shift=null;
		Session session=getSession();
		Query query=session.createQuery("select e from  Timesheet e where employeeId=:empid and month=:month and year=:year");
		query.setParameter("empid", employeeId);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Timesheet> empList=query.list();
		for(Timesheet shiftData : empList)
		{
			shift = shiftData.getShift();
			if(shift.equals("a"))
				aCount++;
			if(shift.equals("b"))
				bCount++;
			if(shift.equals("c"))
				cCount++;				
		}
		reportData.add(aCount);
		reportData.add(bCount);
		reportData.add(cCount);
		return reportData;
	}
	public int addNewEmployee(ResourceMaster resource, String creatorName) throws ClassNotFoundException, SQLException {
		Session session=getSession();
		ResourceMaster resourceMaster = new ResourceMaster();
		resourceMaster.setEmployeeId(resource.getEmployeeId());
		resourceMaster.setEnterpriseId(resource.getEnterpriseId());
		resourceMaster.setEmployeeName(resource.getEmployeeName());
		resourceMaster.setDesignation(resource.getDesignation());
		resourceMaster.setCareerLevel(resource.getCareerLevel());
		resourceMaster.setSupervisorId(resource.getSupervisorId());
		resourceMaster.setTechnology(resource.getTechnology());
		resourceMaster.setDefaultShift("a");
		resourceMaster.setCreatedBy(creatorName);
		session.save(resourceMaster);
		return 1;
	}
	
	public int addNewProject(String projectName, String projectDescription, String creatorName)throws ClassNotFoundException, SQLException {
		Session session=getSession();
		Project project = new Project();
		project.setProjectName(projectName);
		project.setProjectDescription(projectDescription);
		project.setCreatedBy(creatorName);
		session.save(project);		
		return 1;
		
	}
	public Map<String, Integer> statistics() throws ClassNotFoundException, SQLException {
		  String[] monthName = { "january", "february", "march", "april", "may", "june", "july",
			        "august", "september", "october", "november", "december" };
		  int aCount = 0, bCount = 0, cCount = 0;
		  String shift=null;
		  Calendar cal = Calendar.getInstance();
		  String month = monthName[cal.get(Calendar.MONTH)];
		  int year = cal.get(Calendar.YEAR);
		  Session session=getSession();
		  Query query=session.createQuery("select e from  Timesheet e where month=:month and year=:year");
		  query.setParameter("month", month);
		  query.setParameter("year", year);
		  List<Timesheet> empList=query.list();
		  for(Timesheet shiftData : empList)
		  {
				shift = shiftData.getShift();
				if(shift.equals("a"))
					aCount++;
				if(shift.equals("b"))
					bCount++;
				if(shift.equals("c"))
					cCount++;				
		  }
		  Map<String,Integer> shiftCount = new HashMap<String, Integer>();	  
		  shiftCount.put("shiftA", aCount);
		  shiftCount.put("shiftB", bCount);
		  shiftCount.put("shiftC", cCount);
		return shiftCount;
	}
	public List<Project> getAllProjects() throws ClassNotFoundException, SQLException {
		 Session session=getSession();
		  Query query=session.createQuery("select e from Project e");
		  List<Project> allProjectsData = query.list();
		return allProjectsData;
	}
	public List<ResourceMaster> getEmployeeDetailsByProject(Integer projectId) throws ClassNotFoundException, SQLException {
		Session session=getSession();
		List<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		Query query=session.createQuery("select e from ResourceMaster e where projectId=:projId");
		 query.setParameter("projId", projectId);
		 employeeObjects = query.list();
		return employeeObjects;
	}

}
