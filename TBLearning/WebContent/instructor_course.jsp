<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <style>
  .modal-header {
  color: #fff;
    background-image: linear-gradient(255deg, #f9b25e, #f17b30);
}
#display {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#display td, #display thead {
    border: 1px solid #ddd;
    padding: 8px;
}
#display thead{
font-weight: bold;
background-color:black;
color:white;
}
#panelbox{
padding:10px,10px;}
#panelwithtable{
padding:10px;
 border:1px solid black;
}
</style>
</head>
<body>
<%@include file="includes/header.jsp" %>
<c:if test="${not empty sessionScope.msg1}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${sessionScope.msg1}</strong> 
    </div>
</c:if>
 
<div class ="panel-body" align="center" id="panelbox">
<div id="panelwithtable"  align="center" class = "panel panel-default" style="width:70%">
   
 <table align="center" width="50%"  cellspacing="6" id="display" style="width: 90%;">
    
      <thead>
    

<tr>
							
							<td  width="20%" >Course Id</td>
							<td width="50%" >Course Title</td>
							<td width="20%">Year Offered</td>
							<td width="20%" >Semester</td>
							
					</tr>
			</thead>
				<%ResultSet rs=(ResultSet)request.getAttribute("resultSet");String a="null";
				while (rs.next()) {%>
				
				
				<% ;
				
				switch(rs.getString(5))
					{
				case "FS":a="FALL";break;
				case "SM":a="SUMMER";break;
				case "SP":a="SPRING";break;
				case "WN":a="WINTER";break;
					default:break;
					}
					
				%>
<tr>	
	<td id="<%rs.getInt(1); %>" width="20%"> <%=rs.getString(2) %></td>
	<td id="<%rs.getInt(1); %>" width="50%"> <%=rs.getString(3) %></td>
	<td id="<%rs.getInt(1); %>" width="20%"> <%=rs.getInt(4) %></td>
	<td id="<%rs.getInt(1); %>" width="20%"> <%=a %></td>
	</tr>
<%}%>
</table>
</div>
</div>

</body>
</html>
