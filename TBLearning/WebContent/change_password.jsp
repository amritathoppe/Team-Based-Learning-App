<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript">
	window.MathJax = {
		tex2jax : {
			inlineMath : [ [ '$', '$' ], [ "\\(", "\\)" ] ],
			processEscapes : true
		}
	};
</script>
<title>Forgot Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="Stylings.css">-->

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" >
<%@include file="includes/admin_header.jsp" %>
<%
String status = (String) request.getParameter("status");
if (status != null) {
	if(status.equals("s")) {
		%>
		<div class="alert alert-success alert-dismissable">
		  <strong>Success!</strong> Your password has successfully been reset.
		</div>
		<%
	}
}
%>
		<div class="row">
			<div class="col-md-offset-3 col-md-6 ">
<c:if test="${not empty requestScope.error}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${requestScope.error}</strong> 
    <c:if test="${not empty requestScope.attempt}">
     <strong>${requestScope.attempt}</strong> 
 </c:if>
  </div>
</c:if>

				<div class="panel panel-default" style="margin-top:0px">
					<div class="panel-heading"> 
						<strong> <center>Change Password</center></strong>
					</div>
					<div class="panel-body">
	<form data-toggle="validator" id = "formform" role="form" method="post" action="LoginServlet">
  <div class="form-group">
	<div class="row">
		<div class="col-sm-6 form-group">
			<label for="password" class="control-label" >New Password</label>
			<input id="password" type="password" placeholder="Enter New Password" class="form-control" name="password" minlength="5" required />
		</div>
		<div class="col-sm-6 form-group">
			<label for="confirm_password" class="control-label">Confirm New Password</label>
			<input id="confirm_password" type="password" placeholder="Confirm password" class="form-control" name="confirm_password" minlength="5" required />
		</div>	

		<div class="form-group">
										<div class="col-sm-6  form-group">
										<input type="submit" id="changepasswordform" class="btn btn-lg btn-primary btn-block">
										</div>
											<input type="hidden" id="task" name="task"/>
											
									<script>
                                    document.getElementById("changepasswordform").onclick = function() {
			                                
			                                	var str = "changePassword";
			                                	var url_string = window.location.href;
			                                	var url = new URL(url_string);
			                                	var c = url.searchParams.get("session_id")
			                                	if (c) {
			                                        str += "&session_id=" + c;
			                                	}
			                                    document.getElementById("task").value = str;

			                                	console.log(str);
                                    };
                                   </script>
                                   <script>
                                   var password = document.getElementById("password")
                                   , confirm_password = document.getElementById("confirm_password");

                                 function validatePassword(){
                                   if(password.value != confirm_password.value) {
                                     confirm_password.setCustomValidity("Passwords Don't Match");
                                   } else {
                                     confirm_password.setCustomValidity('');
                                   }
                                 }

                                 password.onchange = validatePassword;
                                 confirm_password.onkeyup = validatePassword;
                                   </script>
								
						 		</div>
						 		</div>
						 		</div>
	</div>
	</div>
	</form>
		</div>
		</div>
	</div>
	
	</body>