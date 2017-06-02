<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test="${code == 'success'}">
<script>
  alert("Project details added successfully!!!!");
</script>
</c:if>
<c:if test="${code == 'failure'}">
<script>
  alert("Error..... Try again!!");
</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance Tracker~ Project Details</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link rel="stylesheet" href="css/sideNav.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.fa-pencil
{
color:#F8C471;
}
.fa-trash-o
{
color:#FF0000;
}
</style>

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
				 
				 <li class="active"><a href="#"><i
						class="fa fa-upload fa-lg"></i> Upload New Project Details</a></li>
				<li><a href="redirect.htm?pageName=statistics"><i class="fa fa-pie-chart fa-lg"></i>
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
	<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Attendance Tool</span></h1>
		</div>
	<form action = "addNewProject.htm"  > 
			
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Project Details</h2>
			</div>
			<table>
			<tr><td>Project Name </td><td><input type="text" name="projectName"></td></tr>
			<tr><td>Project Description </td><td><textarea rows="4" cols="50" name="projectDescription"></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="Add details"/></td></tr>
			
            </table> 
 
		</div>
	</form>
	</div>


</body>
</html>