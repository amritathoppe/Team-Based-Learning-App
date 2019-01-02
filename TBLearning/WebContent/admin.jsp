<html>
<head>
<title>Admin</title>
<script type="text/javascript">
function checkSession() {
	var timeout = document.getElementById("timeout").value * 1000;
	var endDate = new Date().getTime() + timeout;
	
function checkTimeOut(){
	    if(new Date().getTime() > endDate){
	        // redirect to timeout page
	        window.location = "login.jsp";
	    }
	}

 window.setInterval(checkTimeOut, 1000); // check once per second
}
</script>
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

<style>body {
    background-color: lightblue;
}

</style>
</head>
<body>
<%@include file="includes/admin_header.jsp" %>  
<% int timeout=request.getSession(false).getMaxInactiveInterval();%>
<input type="hidden" id="timeout" value=<%=timeout%> />
<script type="text/javascript">
	checkSession();
</script>
</body>
</html>   