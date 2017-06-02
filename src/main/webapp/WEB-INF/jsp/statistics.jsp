<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta charset="ISO-8859-1">
<title>Attendance Tracker~ Statistics</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
html, body {
    max-width: 100%;
    overflow-x: hidden;
}
</style>


<link rel="stylesheet" href="css/sideNav.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		var x = document.getElementById("shiftA").value;
		var y = document.getElementById("shiftB").value;
		var z = document.getElementById("shiftC").value;
	/* 	alert(shiftA);
		alert(shiftB);
		alert(shiftC); */
        var data = google.visualization.arrayToDataTable([
        	['Shift Name', 'value'],
          ['Shift A',   x],
          ['Shift B',   y],
          ['Shift C',  z],
       
        ]);

        var options = {
          title: 'HCSC Shift Details for the Month of March',
         /*  is3D:true, */
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));

        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    
        var data = google.visualization.arrayToDataTable([
          ['Total Entries', 'HCSC'],
          ['Submitted',     40],
          ['Not Submitted',      60],
          
        
      
        ]);

        var options = {
          title: 'Total Number of Entries for the Month',
          pieHole: 0.4,
         
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d1'));

        chart.draw(data, options);
      }
    </script>
    
  </head>
  <body>
  <div class="nav-side-menu">
		<div class="brand">ATTENDANCE TRACKER</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>
		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">
				<li><a href="redirect.htm?pageName=adminPanel"><i class="fa fa-upload fa-lg"></i>
						Upload New Employee Details</a></li>
				
				
				<li><a href="allEmployeeDetails.htm"> <i
						class="fa fa-users fa-lg"></i> Employee Details
				</a></li>
				 <li><a href="redirect.htm?pageName=projectDetails"><i
						class="fa fa-upload fa-lg"></i> Upload New Project Details
				</a></li>
				<li  class="active"><a href="#"><i class="fa fa-pie-chart fa-lg"></i>
						Statistics</a></li>


				<li><a href="redirect.htm?pageName=report"><i class="fa fa-file-excel-o fa-lg"></i>
						Generate Reports</a></li>

				<li><a href="redirect.htm?pageName=reminder"> <i class="fa fa-envelope-open-o fa-lg"></i>
						Reminder
				</a></li>

			</ul>
		</div>
	</div>
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12">
  
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    <div id="piechart_3d1" style="width: 900px; height: 500px;"></div>
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
		<c:forEach items="${shiftCount}" var="shift">
			<input type = "hidden" name = ${shift.key} id = ${shift.key} value = ${shift.value}>
		</c:forEach>
  </body>
</html>