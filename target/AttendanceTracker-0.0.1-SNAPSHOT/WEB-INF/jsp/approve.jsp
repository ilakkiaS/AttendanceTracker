<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "com.acc.entity.ResourceMaster"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<TITLE>Approve</TITLE>
<% HttpSession sess=request.getSession();
ResourceMaster resource = (ResourceMaster)sess.getAttribute("resource");
ArrayList<String> calendarData=(ArrayList<String>)request.getAttribute("calendarData");
 int i=0;
//String[] calendarData = (String[])request.getAttribute("calendarData");
%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

<STYLE TYPE="text/css">
TD, TH {text-align:center}

.btn-group-info .dropdown-menu {
  background-color: #4ebbdb !important;
}
.btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
.icon-btn { padding: 1px 15px 3px 2px; border-radius:50px;}
body {
	margin-top: 60px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

#calendar {
	padding-top: 50px;
	width: 900px;
	margin: 0 auto;
}
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
	text-align: center;
	display: inline;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: inline-block;
	top:60px;
	transition: 0.3s;
	
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 30;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

</STYLE>



<SCRIPT LANGUAGE="JavaScript">
/*******************
  UTILITY FUNCTIONS
********************/
// day of week of month's first day
function getFirstDay(theYear, theMonth){
    var firstDate = new Date(theYear,theMonth,1)
    return firstDate.getDay()
}
// number of days in the month
function getMonthLen(theYear, theMonth) {
    var oneDay = 1000 * 60 * 60 * 24
    var thisMonth = new Date(theYear, theMonth, 1)
    var nextMonth = new Date(theYear, theMonth + 1, 1)
    var len = Math.ceil((nextMonth.getTime() - 
        thisMonth.getTime())/oneDay)
    return len
}
// create array of English month names
var theMonths = ["January","February","March","April","May","June","July","August",
"September","October","November","December"]
// return IE4+ or W3C DOM reference for an ID
function getObject(obj) {
    var theObj
    if (document.all) {
        if (typeof obj == "string") {
            return document.all(obj)
        } else {
            return obj.style
        }
    }
    if (document.getElementById) {
        if (typeof obj == "string") {
            return document.getElementById(obj)
        } else {
            return obj.style
        }
    }
    return null
}

/************************
  DRAW CALENDAR CONTENTS
*************************/
// clear and re-populate table based on form's selections
function populateTable(form) {
    var theMonth = form.chooseMonth.selectedIndex
    var theYear = parseInt(form.chooseYear.options[form.chooseYear.selectedIndex].text)
    // initialize date-dependent variables
    var firstDay = getFirstDay(theYear, theMonth)
    var howMany = getMonthLen(theYear, theMonth)
    
    // fill in month/year in table header
    getObject("tableHeader").innerHTML = theMonths[theMonth] + 
    " " + theYear
    
    // initialize vars for table creation
    var dayCounter = 1
    var TBody = getObject("tableBody")
    // clear any existing rows
    while (TBody.rows.length > 0) {
        TBody.deleteRow(0)
    }
    var newR, newC
    var done=false
    var calendar = document.getElementById("calendar")
    while (!done) {
        // create new row at end
        newR = TBody.insertRow(TBody.rows.length)
        for (var i = 0; i < 7; i++) {
            // create new cell at end of row
            newC = newR.insertCell(newR.cells.length)
            if (TBody.rows.length == 1 && i < firstDay) {
                // no content for boxes before first day
                newC.innerHTML = ""    
                continue
            }
            if (dayCounter == howMany) {
                // no more rows after this one
                done = true
            }
            
          
	
		if (dayCounter <= howMany)
			{
			newC.innerHTML = dayCounter 
			<%System.out.println(calendarData.get(i));%> 
			dayCounter++
			}
		else
			{
			newC.innerHTML = "";
			}
		

        }
        
    }
}

/*******************
  INITIALIZATIONS
********************/
// create dynamic list of year choices
function fillYears() {
    var today = new Date()
    var thisYear = today.getFullYear()
    var yearChooser = document.dateChooser.chooseYear
    for (i = thisYear; i < thisYear + 5; i++) {
        yearChooser.options[yearChooser.options.length] = new Option(i, i)
    }
    setCurrMonth(today)
}
// set month choice to current month
function setCurrMonth(today) {
    document.dateChooser.chooseMonth.selectedIndex = today.getMonth()
}

function employeeSelect(){	
	var selectEmployee = document.getElementById("selectEmployee");
	var employeeId = selectEmployee.options[selectEmployee.selectedIndex].value;
	/* var actionUrl = "getCalendarData.htm?employeeId="+employeeId;
	alert(actionUrl);
	document.getElementById("selectEmployeeForm").action = actionUrl; */
	document.getElementById("employeeId").value = employeeId;
	document.getElementById("selectEmployeeForm").submit();
	
}
</SCRIPT>
</HEAD>

<BODY onLoad="fillYears(); populateTable(document.dateChooser)">
<c:forEach items="${calendarData}" var="item">
	<input type = "hidden" id = "calendar" value = ${item} >
</c:forEach>
<%-- <div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<br/><br/>
		<table>
		<c:forEach items="${employeeObjects}" var="employeeObjects">
			<tr><td><a href="getCalendarData.htm?employeeId=${employeeObjects.employeeId}">${employeeObjects.employeeName}</a></td></tr>
		</c:forEach>
		</table>
	
	</div> --%>
	<form name = "selectEmployeeForm" id = "selectEmployeeForm" action="getCalendarData.htm">
	<input type="hidden" name="employeeId" id="employeeId">
	<div id = "selectEmployeeDiv">
 		<select onchange="employeeSelect()" id = "selectEmployee">
 			<c:forEach items="${employeeObjects}" var="employeeObjects">
				<option value="${employeeObjects.employeeId}">${employeeObjects.employeeName}</option>
			</c:forEach>
		</select>
	</div>
	</form>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
		
			
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><span style="font-size: 20px; cursor: pointer" onclick="openNav()">&#9776;
		Team </span>
				&emsp;&emsp;Attendance-Tracker</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="redirect.htm?pageName=timesheet"><span
						class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
						TimeSheets </a></li>
				<li><a href="redirect.htm?pageName=report"><span
						class="glyphicon glyphicon-save-file" aria-hidden="true">
							Reports</a></li>
				<li class="active"><a href="#"><span
						class="glyphicon glyphicon-ok" aria-hidden="true"> Approve</a></li>
			</ul>
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown" id="logout"><a class="dropdown-toggle"
					href="#" data-toggle="dropdown" id="navLogout"><span
						class="glyphicon glyphicon-user">&nbsp${resource.employeeName}</span></a>
					<div class="dropdown-menu">
						<button type="button" class="btn btn-danger btn-block">Logout</button>
					</div></li>
			</ul>
		</div>
	</nav>

<H1></H1>
<HR>
<FORM NAME="dateChooser" action="calendarstore.htm" >
<br><br><br><br><br><br><br>
<TABLE ID="calendarTable" BORDER=1 ALIGN="center">
<TR>
    <TH ID="tableHeader" COLSPAN=7></TH>
</TR>


<TR>
    <TD COLSPAN=7>
    <P>
    
        <SELECT NAME="chooseMonth" 
        onChange="populateTable(this.form)">
            <OPTION SELECTED>January<OPTION>February
            <OPTION>March<OPTION>April<OPTION>May
            <OPTION>June<OPTION>July<OPTION>August
            <OPTION>September<OPTION>October
            <OPTION>November<OPTION>December
    </SELECT>
    <SELECT NAME="chooseYear" onChange="populateTable(this.form)">
    </SELECT>
    
    </P></TD>
</TR>
<TR><TH>Sun</TH><TH>Mon</TH><TH>Tue</TH><TH>Wed</TH>
<TH>Thu</TH><TH>Fri</TH><TH>Sat</TH></TR>
<TBODY ID="tableBody"></TBODY>
</TABLE>
<br><br>
<a class="btn icon-btn btn-success" href="#"><span class="glyphicon btn-glyphicon glyphicon-check img-circle text-success"></span>Approve</a>&emsp;&emsp;
	<a class="btn icon-btn btn-danger" href="#"><span class="glyphicon btn-glyphicon glyphicon-remove img-circle text-danger"></span>Reject</a>&emsp;&emsp;
	<a class="btn icon-btn btn-warning" href="#"><span class="glyphicon btn-glyphicon glyphicon-edit img-circle text-warning"></span>Adjust</a>
	
 </FORM>
 	<script>
	function openNav() {
	    document.getElementById("mySidenav").style.width = "20%";
	}
	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	 	document.getElementById("main").style.width="100%";
	}
	
	</script>
</BODY>
</HTML>