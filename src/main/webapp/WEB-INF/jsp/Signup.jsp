
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/styles.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<title>SignUp</title>
<script type="text/javascript">
function formValidation()
{
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	if(password == confirmPassword)
		{
		return true;
		}
	else 
		{
		alert("Passwords Mismatch");
		document.getElementById('password').value = "";
		document.getElementById('confirmPassword').value = "";
		return false;
		}
}

function preventBack(){window.history.forward();}
setTimeout("preventBack()", 0);
window.onunload=function(){null};

</script>  
</head>
<body onload="preventBack();">
<% String enterpriseId=(String)request.getParameter("enterpriseId");
%>



	<form action = "loginSignup.htm" onsubmit = "return formValidation();" > 
	<input type = "hidden" value = "signup" id = "flag" name = "flag">
	<input type = "hidden" value = "<%= enterpriseId%>" id = "enterpriseId" name = "enterpriseId">
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Attendance Tool</span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Sign Up</h2>
			</div>
			<label for="username">EnterpriseId</label>
			<br/>
			<input type="text" value = "<%= enterpriseId%>" id = "enterprise" name = "enterprise" disabled >
			<br/>
			<input type="password" id = "password" name = password placeholder = "Enter Password">
			<br/>
			<input type="password" id = "confirmPassword" name = confirmPassword placeholder = "Confirm Password">
			<br/>
			<button type="submit">Signup</button>
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