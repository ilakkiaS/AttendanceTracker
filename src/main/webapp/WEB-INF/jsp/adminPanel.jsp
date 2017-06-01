<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/sideNav.css">
<link href="css/jquery.filer.css" rel="stylesheet">
<link href="css/jquery.filer-dragdropbox-theme.css"
	rel="stylesheet">
<title>Attendance Tracker ~ Admin Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="script/custom.js" type="text/javascript"></script>
<script src="script/jquery.filer.min.js" type="text/javascript"></script>
<style>
body {
	font-family: 'Roboto Condensed', sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #47525d;
	background-color: #fff;
	margin: 0;
}

hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #eee;
}

.jFiler {
	font-family: inherit;
}

</style>
</head>
<body>
<c:if test="${code == 'success'}">
<script>
  alert("Employee details added successfully!!");
</script>
</c:if>
<c:if test="${code == 'failure'}">
<script>
  alert("Error..... Please Try again !!!");
</script>
</c:if>
	<div class="nav-side-menu">
		<div class="brand">
			<h3>ATTENDANCE TRACKER</h3>
		</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>
		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">
			<li class="active"><a href="#"><i
						class="fa fa-upload fa-lg"></i> Upload New Employee Details</a></li>
			
				<li><a href="allEmployeeDetails.htm"> <i
						class="fa fa-users fa-lg"></i> Employee Details
				</a></li>
				

				<li data-toggle="collapse" data-target="#service" class="collapsed">
					<a href="redirect.htm?pageName=statistics"><i class="fa fa-pie-chart fa-lg"></i> Statistics</a>
				</li>


				<li data-toggle="collapse" data-target="#new" class="collapsed">
					<a href="redirect.htm?pageName=report"><i class="fa fa-file-excel-o fa-lg"></i> Generate
						Reports</a>
				</li>

				<li><a href="redirect.htm?pageName=reminder"> <i class="fa fa-envelope-open-o fa-lg"></i>
						Reminder
				</a></li>

			</ul>
		</div>
	</div>
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12">
				<br>
				<br>
				<br>
				<br>
				<div id="content">
					<form action="addEmployee.htm">
						<table>
							<tr><td>Employee Name:</td><td><input type="text" name="employeeName"></td></tr>
							<tr><td>Employee ID:</td><td><input type="text" name="employeeId"></td></tr>
							<tr><td>Enterprise Id:</td><td><input type="text" name="enterpriseId"></td></tr>
							<tr><td>Career Level</td><td><input type="text" name="careerLevel"></td></tr>							
							<tr><td>Supervisor Id:</td><td><input type="text" name="supervisorId"></td></tr>
							<tr><td>Designation:</td><td><input type="text" name="designation"></td></tr>
							<tr><td>Technology:</td><td><input type="text" name="technology"></td></tr>
							<tr><td colspan="2"><input type="submit" value="Add Details"></td></tr>			
						</table>					
					</form>
					

				</div>
				<br>
				<br> 
			</div>
		</div>
	</div>
</body>
</html>