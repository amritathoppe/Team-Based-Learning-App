<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Instructor:Student Details</title>
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
<%@include file="includes/header.jsp" %>
<c:if test="${not empty sessionScope.msg1}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${sessionScope.msg1}</strong> 
    </div>
</c:if>
<div class="container" align="right" style="padding-right:50px">
 
  <!-- Trigger the modal with a button -->
  <button type="button"   class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add Student</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     <form action="LoginServlet" method="post">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Student</h4>
        </div>
        <div class="modal-body" align="left">
          	<div class="row">
	 
				
					<div class="col-sm-12">
						<div class="row">
						
							<div class="col-sm-6 form-group">
								<label for="firstname" class="control-label" >First Name</label>
			<input id="firstname" type="text" placeholder="Enter First Name Here.." class="form-control" name="firstName" minlength="2" required />
			</div>
							<div class="col-sm-6 form-group">
								<label for="lastname" class="control-label">Last Name</label>
			<input id="lastname" type="text" placeholder="Enter Last Name Here.." class="form-control" name="lastName" minlength="2" required />
		</div>
						</div>	
                        <div class="clearfix visible-xs-block"> </div>
						
						<div class="col-sm-6  form-group">
							<label  >SSO ID</label>
			<input id="ssoid" name="ssoId" type="text" pattern="^[a-zA-Z0-9]+$" placeholder="Enter SSO ID.." class="form-control help-block with-errors" minlength="6" maxlength="10" data-error="Enter only numbers" required/>
		
							</div>	
						<div class="col-sm-6 form-group">
								<label>Student number</label>
							<input type="number" name="stdno" placeholder="Enter Student Number Here.." class="form-control" maxlength=10 required>
	</div>
	<input type="hidden"  name="optradio" value="stud"/>
							<div class="col-sm-8 form-group">		
			<label for="courseId">Courses</label>
							<select id="courseId" name="course" value="CourseId" class="form-control col-sm-3.5" style="width:350px;">
						<option selected value="">Select</option>
						<%
							try {
								String Query = "select * from course";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tblearning_db", "root", "");
								Statement stm = conn.createStatement();
								ResultSet res = stm.executeQuery(Query);

								while (res.next()) {
						%>

						<option value=<%=res.getString("Course_code")%>>
							<%=res.getString("Course_Desc")%>
							</option>
						<%
							}
								res.close();

							} catch (Exception e) {
								e.printStackTrace();
							}
						%>

				</select>
		</div>
	</div>
							
						</div>	
						
                        													
					<br/>
				
					
					
	
		


        </div>
        <div class="modal-footer">
        <div class="form-group">
         
		<input type="hidden" id="task" name="task"/>
		<button  type=button id="createStudent" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><div class="col-spaced">Add </div></button> 
		  <script>
                                    document.getElementById("createStudent").onclick = function() {
                                    document.getElementById("task").value = "userCreation"; //make relation also..  
                                    
                                    }
                                  
 </script>
		<button  class="btn btn-lg btn-warning col-sm-3.5 col-md-offset-1" data-dismiss="modal"><div class="col-spaced">Cancel</div></button> 
        
    
 
	</div>				
				
</div>
     </form> </div>
      
    </div>
  </div>
  
</div>
<form action="" name="form" method="post" id="Tab"> 

 <table id="Course"  class= "table table-stripped table-bordered table-hover instructTable InstructorTabel"> 
<thead class="ColorSetThead">
    

<tr>
							
							<td  width="10%" >SSO Id</td>
							<td width="40%" >First Name</td>
							<td width="40%">Last Name</td>
							<td width="20%" >Student Number</td>
							<td id="Edit" style="font-weight: bold;" data-orderable="false" width="30%">Edit</td>
							<td id="Delete" style="font-weight: bold;" data-orderable="false" width="30%">Delete</td>
							
							
					</tr>
			</thead>
			<tbody class="ColorSetTbody">
				<%ResultSet rs=(ResultSet)request.getAttribute("resultSet");String a="null";
				while (rs.next()) {
				/*if(rs.getInt(8)!=0)
				{
					;
				}*/
				%>
				
				
<tr>	
	<td id="<%rs.getString(1); %>" width="10%"> <%=rs.getString(1) %></td>
	<td id="<%rs.getString(1); %>" width="40%"> <%=rs.getString(3) %></td>
	<td id="<%rs.getString(1); %>" width="40%"> <%=rs.getString(4) %></td>
	<td id="<%rs.getString(1); %>" width="20%"> <%=rs.getInt(7) %></td>
	<td >
		
			<button>Edit</button>
				 
	</td >
	<td >		
	
		<input type="hidden" id="task" name="task"/>
<%-- 		<button  id="<%=rs.getInt(1)%>" value='<%=rs.getInt(1)%>' ><a href="LoginServlet?task=deleteUserType&deleteUser=<%=rs.getString(2)%>">Delete</a></button> --%>
		
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
