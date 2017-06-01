<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Tracker~ Employee Details</title>
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
				
				
				<li class="active"><a href="allEmployeeDetails.htm"> <i
						class="fa fa-users fa-lg"></i> Employee Details
				</a></li>
				 <li><a href="redirect.htm?pageName=projectDetails"><i
						class="fa fa-upload fa-lg"></i> Upload New Project Details
				</a></li>
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
		<div class="row">
			<div class="col-md-12">

				<div class="jumbotron">
					<h4>Employee Details by Project
						&emsp;&emsp;&emsp;&emsp;&emsp;Employee Details by Enterprise ID</h4>

					<select class="selectpicker" data-live-search="true"
						name="projectName" data-style="btn-warning">
						<option data-tokens="ITS">ITS</option>
						<option data-divider="true"></option>
						<option data-tokens="PPW">PPW</option>
						<option data-divider="true"></option>
						<option data-tokens="CCSP">CCSP</option>
						<option data-divider="true"></option>
						<option data-tokens="SHARED ACCUMS">SHARED ACCUMS</option>
						<option data-divider="true"></option>
					</select> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <select
						class="selectpicker" data-live-search="true" name="projectName"
						data-style="btn-warning">
						<option data-tokens="vijay.aa.kumar">vijay.aa.kumar</option>
						<option data-divider="true"></option>
						<option data-tokens="menaka.a.ganesan">menaka.a.ganesan</option>
						<option data-divider="true"></option>
						<option data-tokens="vijayendra.karnam">vijayendra.karnam</option>
						<option data-divider="true"></option>
						<option data-tokens="madhu.meena.raja">madhu.meena.raja</option>
						<option data-divider="true"></option>
						<option data-tokens="mohan.suresh.raju">mohan.suresh.raju</option>
						<option data-divider="true"></option>
						<option data-tokens="balaji.a.preethi">balaji.a.preethi</option>
						<option data-divider="true"></option>
					</select>

					<hr>
				</div>

				<table class="table table-inverse">
					<thead>
						<tr>
							<th>#</th>
							<th>Enterprise ID</th>
							<th>Employee Name</th>
							<th>Designation</th>
							<th>Supervisor ID</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${allEmployeesData}" var = "allEmployeesData" varStatus = "loop">
					<tr>
						<th scope="row"><c:out value = "${loop.count }"></c:out></th>
						<td><c:out value = "${allEmployeesData.enterpriseId}"/></td>
						<td><c:out value = "${allEmployeesData.employeeName}"/></td>
						<td><c:out value = "${allEmployeesData.designation}"/></td>
						<td><c:out value = "${allEmployeesData.supervisorId}"/></td>
						<td><i class="fa fa-pencil fa-2x" aria-hidden="true"></i></td>
						<td><i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></td>
					</tr>
				</c:forEach>
												
					</tbody>
				</table>
				


			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
</body>

</html>