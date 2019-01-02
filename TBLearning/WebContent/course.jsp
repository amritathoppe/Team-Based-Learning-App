<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Course</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/Table.css" rel="stylesheet">
  <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>            
  <script src="jquery.tabledit.min.js"></script>
  <script src="js/TableOperation.js"></script>
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
<%@include file="includes/admin_header.jsp" %>

<c:if test="${not empty sessionScope.msg1}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${sessionScope.msg1}</strong> 
    </div>
    <div class="alert alert-success alert-dismissable" >
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${request.getSession().getAttribute("msg2")}</strong> 
  </div>

</c:if>
<div class="container" align="right">
  
  <!-- Trigger the modal with a button -->
  <button type="button"  class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add Course</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
    <form data-toggle="validator" role="form" method="post" action="LoginServlet">
	
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Course</h4>
        </div>
        <div class="modal-body" align="left">
          	<div class="row">
				
					<div class="col-sm-12">
						<div class="row">
						<div class="col-sm-6 form-group">
						<label>Department</label>
						 <select name="Course_Department_ID" class="form-control" style="width:250px;">  
       <option value="none" >Select</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tblearning_db","root","");  
 Statement stmt = con.createStatement(); 
 ResultSet rs = stmt.executeQuery("Select Department_ID,Department_Desc from departments");
 while(rs.next()){
     %>
      <option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>  
      <%
 }
     %>
      </select> 
						</div>
							<div class="col-sm-6 form-group">
								<label>Course Code</label>
								<input type="text"  name="Course_code" placeholder="Enter Course Code Here.." class="form-control" min="2" required>
							</div>
							<div class="col-sm-12 form-group">
								<label>Course Title</label>
								<input type="text"  name="Course_Desc" pattern="^[a-zA-Z0-9\s]+$" placeholder="Enter Course Title Here.." class="form-control" required>
							</div>
						</div>	
                        <div class="clearfix visible-xs-block"> </div>
						
						<div class="col-sm-6  form-group">
							<label>Year</label>
							<input type="number" name="Course_year" placeholder="Enter Year  Here.." value="2017"class="form-control" maxlength=10 required>
						</div>	
						<div class="col-sm-6 form-group">
								<label>Semester</label>
								
							<select name="Course_Semester" id="Course_Semester" class="form-control col-sm-3.5" style="width:250px;" id="sel1">
                                         <option value="FS">FALL</option>
                                         <option value="SP">SPRING</option>
                                         <option value="SM">SUMMER</option>
                                          <option value="WN">WINTER</option>
                             </select>
							</div>

							<div class="col-sm-6 form-group">		
			<label >Course Time</label>
			<div class="radio">
				<label>
				<input  type="radio" name="Course_Time" value="D" required>Day</label></br>
				<label>
				<input  type="radio" name="Course_Time" value="E" required>Evening</label></br>
				<label>
				<input  type="radio" name="Course_Time" value="DE" required>Both</label></br>
			</div>
		</div>
	</div>
							
						</div>	
						
                        													
					<br/>
					<center>
					
					
	
		


        </div>
        <div class="modal-footer" align="right">
        <div class="form-group">
		<input type="hidden" id="task" name="task"/>
		<button type="submit" id="createcourse" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><div class="col-spaced">Submit</div></button> 
		<button type="cancel" class="btn btn-lg btn-warning col-sm-3.5 col-md-offset-1" data-dismiss="modal"><div class="col-spaced">Cancel</div></button> 
          
      <script>
                                    document.getElementById("createcourse").onclick = function() {
                                    document.getElementById("task").value = "courseCreation";                        
                                    };
                                   
 </script>
	</div>				
</center>				
</div></form>
     </div>
      
    </div>
  </div>
  
</div>

<form action="" name="form" method="post" id="Tab"> 

 <table id="Course"  class= "table table-stripped table-bordered table-hover instructTable InstructorTabel"> 
<thead class="ColorSetThead">
    

<tr>
							
							<td  width="10%" >Course Id</td>
							<td width="50%" >Course Title</td>
							<td width="20%">Year Offered</td>
							<td width="20%" >Semester</td>
							<td id="Edit" style="font-weight: bold;" data-orderable="false" width="30%">Edit</td>
							<td id="Delete" style="font-weight: bold;" data-orderable="false" width="30%">Delete</td>
							
					</tr>
			</thead>
			<tbody class="ColorSetTbody">
				<%ResultSet rs2=(ResultSet)request.getAttribute("resultSet");String a="null";
				while (rs2.next()) {%>
				
				
				<% ;
				
				switch(rs2.getString(5))
					{
				case "FS":a="FALL";break;
				case "SM":a="SUMMER";break;
				case "SP":a="SPRING";break;
				case "WN":a="WINTER";break;
					default:break;
					}
					
				%>
<tr>	
	<td id="<%=rs2.getString(2) %>" width="10%"> <%=rs2.getString(2) %></td>
	<td id="<%rs2.getInt(1); %>" width="50%"> <%=rs2.getString(3) %></td>
	<td id="<%rs2.getInt(1); %>" width="20%"> <%=rs2.getInt(4) %></td>
	<td id="<%rs2.getInt(1); %>" width="20%"> <%=a %></td>
	<td >
		
			<button>Edit</button>
				 
	</td >
	<td >		
	
		<input type="hidden" id="task" name="task"/>
		<button  id="<%=rs2.getInt(1)%>" value='<%=rs2.getInt(1)%>' ><a href="x=<%=rs2.getString(2)%>">Delete</a></button>
		
	</td>
	</tr>
<%}%>

</tbody>
</table>

</form>

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script>
$('#Course').dataTable();
$('#Course_wrapper .row').eq(1).find('.col-sm-12').find('table').addClass('CustomSize');
$('#Course_wrapper .row').eq(2).addClass('NavBarPos');
</script>
</body>
</html>
