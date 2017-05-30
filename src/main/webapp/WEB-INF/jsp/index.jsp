<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/styles.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
function preventBack(){
	window.history.forward();
	
	}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
</script>
<% HttpSession sesson = request.getSession();
%>
</head>
<body onload="preventBack();">

	<form action="idCheck.htm">
		<c:if test="${Error_Message == 'you cant login'}">
			<script>
  				alert("Access Denied......You cant access this tool !!!");
			</script>
		</c:if>
		<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Attendance Tool</span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">EnterpriseId</label>
			<br/>
			<input type="text" id="enterpriseId" name = "enterpriseId" >
			<br/>
			<button type="submit">Next</button>
		</div>
	</div>
	</form>
</body>
<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>
</html>