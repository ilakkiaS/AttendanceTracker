<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "com.acc.entity.ResourceMaster"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<HTML>
<HEAD>
<TITLE>TIMESHEET</TITLE>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

<STYLE TYPE="text/css">
TD, TH {text-align:center}

.btn-group-info .dropdown-menu {
  background-color: #4ebbdb !important;
}
</STYLE>
<c:if test="${code == 'success'}">
<script>
  alert("Timesheet Submitted");
</script>
</c:if>
<c:if test="${code == 'failure'}">
<script>
  alert("Error submitting your Timesheet");
</script>
</c:if>
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
    var j=1;
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
            
           


	   //DROP DOWN
		 var select = document.createElement("select");
	  var s="shiftdetail"+j;
		select.setAttribute("name",s);
		j++;
		select.options.add( new Option("shift A","a", true, true) );
		select.options.add( new Option("shift B","b") );
		select.options.add( new Option("shift C","c") );
		if (dayCounter <= howMany)
			{
			newC.innerHTML = dayCounter;
			newC.appendChild(select);
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

</SCRIPT>
</HEAD>

<BODY onLoad="fillYears(); populateTable(document.dateChooser)">
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Attendance-Tracker</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> TimeSheets </a></li>
      <c:if test = "${resource.designation == 'AM' || resource.designation == 'TL'}">
      <li><a href="redirect.htm?pageName=report"><span class="glyphicon glyphicon-save-file" aria-hidden="true"> Reports</a></li>
       <li><a href="approve.htm"><span class="glyphicon glyphicon-ok" aria-hidden="true"> Approve</a></li>
       </c:if>
    </ul>
	<ul class="nav navbar-nav pull-right">
	<li class="dropdown" id="logout">
	
	<a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogout"><span class="glyphicon glyphicon-user"></span>&nbsp${resource.employeeName}</a>
	<div class="dropdown-menu">
	<button type="button" class="btn btn-danger btn-block">Logout</button>
	</div>
	</li>
	</ul>
  </div>
</nav>
<H1></H1>
<HR>
<FORM id = "dateChooser" NAME="dateChooser" action="calendarstore.htm" >
	<br><br><br><br><br><br><br>
	<input type = "hidden" id = "flag" name = "flag" value = "submit"/>
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
	<br/><br/>
		<center><input class="btn icon-btn btn-success" type="submit" name = "submit" value="submit"/>&nbsp&nbsp&nbsp&nbsp
		<input class="btn icon-btn btn-warning" type="submit" name = "submit" value="update"/></center>
 </FORM>
<script>
	function submit(){
		var x = document.getElementById("flag1").value;
		alert(x);
		document.getElementById("dateChooser").submit();
		
	}
</script>
</BODY>
</HTML>