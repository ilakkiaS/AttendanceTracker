package com.acc.controller;

//import java.security.Provider.Service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acc.entity.ResourceMaster;
import com.acc.service.ServiceImplementaion;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AttendanceController {

	@RequestMapping("/idCheck.htm")
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView modelandview = new ModelAndView();
		ResourceMaster resource = new ResourceMaster();
		ServiceImplementaion service = new ServiceImplementaion();
		String enterpriseId = request.getParameter("enterpriseId");
		resource = service.searchEmployee(enterpriseId);
		String password = resource.getPassword();
		if(resource.getEmployeeName() != null)
		{
			if(!password.isEmpty())
			{
				modelandview.setViewName("Login");
			}
			else
			{
				modelandview.setViewName("Signup");
			}
			modelandview.addObject("resource", resource);
		}
		else
		{
			modelandview.setViewName("index");
			modelandview.addObject("Error_Message", "you cant login");
		}
		return modelandview;
	}
	@RequestMapping("/loginSignup.htm")
	public ModelAndView loginSignup(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView modelandview = new ModelAndView();
		ResourceMaster resource = new ResourceMaster();
		String enterpriseId = request.getParameter("enterpriseId");
		String password = request.getParameter("password");
		String flag = request.getParameter("flag");
		ServiceImplementaion service = new ServiceImplementaion();
		if(flag.equals("login") )
		{	
			resource = service.loginEmployee(enterpriseId,password);
		
			if(resource.getEmployeeName() != null)
			{
				HttpSession session=request.getSession();
				session.setAttribute("resource", resource);
				if(resource.getEmployeeName().equalsIgnoreCase("administrator"))
				{
					modelandview.setViewName("adminPanel");
				}
				else
					modelandview.setViewName("timesheet");
			}
			else
			{
				modelandview.addObject("loginCode", "failure");
				modelandview.setViewName("Login");
			}
		}
		else if(flag.equals("signup"))
		{
			int count = 0;
			count = service.signupEmployee(enterpriseId, password);
			if(count == 1)
			{
				modelandview.addObject("code","success");
				modelandview.setViewName("Login");
			}
			else
			{
				modelandview.addObject("code", "failure");
				modelandview.setViewName("Signup");
			}
		}
		return modelandview;
	}
	@RequestMapping("/calendarstore.htm")
	public ModelAndView calendarDataStore(HttpServletRequest request,HttpServletResponse response)
	{
		ServiceImplementaion service = new ServiceImplementaion();
		HttpSession session=request.getSession();
		ResourceMaster resource = (ResourceMaster)session.getAttribute("resource");
		long employeeId = resource.getEmployeeId();
		int length = 0;
		ModelAndView modelandview = new ModelAndView();
		String month = request.getParameter("chooseMonth");
		int year =  Integer.parseInt(request.getParameter("chooseYear"));
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
		String shift = null;
		String[] shiftData = new String[length+1];
		for(int i = 1 ; i <= length ; i++)
		{
			shift = "shiftdetail"+i;
			shiftData[i] = request.getParameter(shift);
			
		}
		service.calendarDataStore(employeeId, year, month, shiftData);
		modelandview.setViewName("timesheet");
		return modelandview;
	}
	@RequestMapping("/redirect.htm")
	public ModelAndView pageRedirect(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelandview = new ModelAndView();
		String pageName = request.getParameter("pageName");
		modelandview.setViewName(pageName);
		return modelandview;
	}
	@RequestMapping("/approve.htm")
	public ModelAndView getEmployeeNamesToApprove(HttpServletRequest request,HttpServletResponse response)
	{
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		ModelAndView modelandview = new ModelAndView();
		HttpSession session=request.getSession();
		ResourceMaster resource = (ResourceMaster)session.getAttribute("resource");
		long employeeId = resource.getEmployeeId();
		ServiceImplementaion service = new ServiceImplementaion();
		employeeObjects = service.approve(employeeId);
		modelandview.addObject("employeeObjects", employeeObjects);
		modelandview.setViewName("approve");
		return modelandview;

	}
	@RequestMapping("/getCalendarData.htm")
	public ModelAndView getCalendarData(HttpServletRequest request,HttpServletResponse response)
	{
		ArrayList<ResourceMaster> employeeObjects = new ArrayList<ResourceMaster>();
		 String[] monthName = { "january", "february", "march", "april", "may", "june", "july",
			        "august", "september", "october", "november", "december" };
		 Calendar cal = Calendar.getInstance();
		 String month = monthName[cal.get(Calendar.MONTH)];
		int year = cal.get(Calendar.YEAR);
		HttpSession session=request.getSession();
		ResourceMaster resource = (ResourceMaster)session.getAttribute("resource");
		long supervisorId = resource.getEmployeeId();
		long employeeId = Long.parseLong(request.getParameter("employeeId"));
		System.out.println(employeeId);
		ServiceImplementaion service = new ServiceImplementaion();
		ArrayList<String> calendarData = new ArrayList<String>();
		ModelAndView modelandview = new ModelAndView();
		calendarData = service.getCalendarData(employeeId,month,year);
		System.out.println(calendarData);
		//String[] calendarString = calendarData.toArray(new String[calendarData.size()]);
		employeeObjects = service.approve(supervisorId);
		modelandview.addObject("employeeObjects", employeeObjects);
		modelandview.setViewName("approve");
		session.setAttribute("calendarData", calendarData);
		return modelandview;
	}
	@RequestMapping("/allEmployeeDetails.htm")
	public ModelAndView allEmployeeDetails(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelandview = new ModelAndView();
		ServiceImplementaion service = new ServiceImplementaion();
		ArrayList<ResourceMaster> allEmployeesData = new ArrayList<ResourceMaster>();
		allEmployeesData = service.allEmployeeDetails();
		modelandview.setViewName("employeeDetails");
		modelandview.addObject("allEmployeesData", allEmployeesData);
		return modelandview;
	}
	@RequestMapping("/generateReport.htm")
	public ModelAndView generateReport(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		ResourceMaster resource = (ResourceMaster)session.getAttribute("resource");
		long supervisorId = resource.getEmployeeId();
		ModelAndView modelandview = new ModelAndView();
		ServiceImplementaion service = new ServiceImplementaion();
		String month = request.getParameter("monthName");
		int position = month.indexOf(',');
		month = month.substring(0, position) + month.substring(position + 1);
		ArrayList<ResourceMaster> employeeObjects = service.approve(supervisorId);
		Map<String, ArrayList> empIdAndData = new HashMap();
		for(ResourceMaster employee : employeeObjects)
		{
			ArrayList<Integer> reportData = service.generateReport(month,employee.getEmployeeId());
			String employeeId = String.valueOf(employee.getEmployeeId());
			empIdAndData.put(employeeId, reportData);
		}
		modelandview.addObject("empIdAndData", empIdAndData);
		modelandview.addObject("month", month);
		
		modelandview.setViewName("pdfView");
		return modelandview;
		
	}
	
	
}