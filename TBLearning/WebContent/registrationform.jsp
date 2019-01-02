<html>
<head>
<title>registration</title>
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
}</style>
</head>
<body>
<%@include file="includes/admin_header.jsp" %>

<div class="container" align="right">
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add User</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      <form data-toggle="validator" role="form" method="post" action="LoginServlet">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Register User</h4>
        </div>
        <div class="modal-body" align="left">
          	<div class="row">
          	<div class="container" style="width: 504px;" >

<div class="row">
<div class="col-lg-12 well">

  <div class="form-group">
	<div class="row">
		<div class="col-sm-6 form-group">
			<label for="firstName" class="control-label" >First Name</label>
			<input id="firstName" type="text" placeholder="Enter First Name Here.." class="form-control" name="firstName" minlength="2" required />
		</div>
		<div class="col-sm-6 form-group">
			<label for="lastName" class="control-label">Last Name</label>
			<input id="lastName" type="text" placeholder="Enter Last Name Here.." class="form-control" name="lastName" minlength="2" required />
		</div>	
  
	</div>
	<div class="row">
		<div class="col-sm-6  form-group">
			<label for ="ssoId" class="control-label" >SSO ID</label>
			<input id="ssoId" name="ssoId" type="text" pattern="^[a-zA-Z0-9]+$" placeholder="Enter SSO ID  Here which is number only.." class="form-control help-block with-errors" min="6" maxlength="10" data-error="Enter only numbers" required/>
		</div>	
		<div class="col-sm-6 form-group">
			<label for="department" class="control-label" >Department</label>
			<input id="department" name="department" type="text" placeholder="Enter Department Name Here.." class="form-control" min="2" required />
		</div>	
	</div>
	
	<div class="col-sm-6 form-group">
								<label>Email ID</label>
								<input type="text" id="email" name="email" placeholder="Enter registered email id Here.." class="form-control" min="7" required>
							</div>
<div class="col-sm-6 form-group">
								<label>User ID</label>
								<input type="number" id="userId" name="userId" placeholder="Enter User ID Here.." class="form-control" min="7" required>
							</div>
	<div class="col-sm-6 form-group">
								
			<label for="userrole">User Role</label>
			<div class="radio">
				<label>	<input id="userrole" type="radio" name="optradio" value="INS" required>Instructor</label>
				<label>	<input id="userrole" type="radio" name="optradio" value="ADM" required> Admin</label>
				<label>	<input id="userrole" type="radio" name="optradio" value="INAD" required>Both</label>
			</div>
			
		</div>
		
						</div>	
						
                        													
					<br/>
					
					
					
	
		
</div>
</div>
</div>
        </div>
        <div class="modal-footer" align="center">
      
	<div class="form-group">
		<input type="hidden" id="task" name="task"/>
		
		<button type="submit" id="register"  class="btn btn-lg btn-info col-sm-4.5 col-md-offset-3">Submit</button>
		<script>
                                    document.getElementById("register").onclick = function() {
                                    document.getElementById("task").value = "userCreation";                        
                                    };
                                   
 </script>
  
<button  class="btn btn-lg btn-warning col-sm-3.5 col-md-offset-1" data-dismiss="modal"><div class="col-spaced">Cancel</div></button> 
        
	</div>
  </div>
  				
		
</div>
</form>
</div>
</div>
</div>
</div>

<form action="" name="form" method="post" id="Tab"> 

 <table id="Instructor"  class= "table table-stripped table-bordered table-hover instructTable InstructorTabel"> 
<thead class="ColorSetThead">
    

    

<tr>
							
							<td  width="10%" >SSO Id</td>
							<td width="40%" >First Name</td>
							<td width="40%">Last Name</td>
							<td width="20%" >User Role</td>
							<td width="20%" >Department</td>
							<td width="20%" >User Number</td>
							<td width="30%" >Email ID</td>
							<td id="Edit" style="font-weight: bold;" data-orderable="false" width="30%">Edit</td>
							<td id="Delete" style="font-weight: bold;" data-orderable="false" width="30%">Delete</td>
							
					</tr>
			</thead>
			<tbody class="ColorSetTbody">
				<%ResultSet rs=(ResultSet)request.getAttribute("resultSet");String a="null";
				while (rs.next()) {%>
				
				
				<% ;
				
				switch(rs.getString(5))
					{
				case "ADM":a="Admin";break;
				case "INS":a="Instructor";break;
				case "BOT":a="Both";break;
				
					default:break;
					}
					
				%>
<tr>	
	<td id="<%=rs.getString(1) %>" width="10%"> <%=rs.getString(1) %></td>
	<td id="<%rs.getString(1); %>" width="50%"> <%=rs.getString(3) %></td>
	<td id="<%rs.getString(1); %>" width="20%"> <%=rs.getString(4) %></td>
	<td id="<%rs.getString(1); %>" width="20%"> <%=a %></td>
	<td id="<%rs.getString(1); %>" width="20%"> <%=rs.getString(13) %></td>
	<td id="<%=rs.getString(1) %>" width="20%"> <%=rs.getInt(7) %></td>
	<td id="<%rs.getString(1); %>" width="20%"> <%=rs.getString(10) %></td>
	<td >
		
			<button>Edit</button>
				 
	</td >
	<td >		
	
		<input type="hidden" id="task" name="task"/>
		<button  id="Department_ID" value='rs.getString(1)' ><a href="LoginServlet?task=deleteUser&TblUsers_SSO=<%=rs.getString(1)%>">Delete</a></button>  
		
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
$('#Instructor').dataTable();
$('#Instructor_wrapper .row').eq(1).find('.col-sm-12').find('table').addClass('CustomSize');
$('#Instructor_wrapper .row').eq(2).addClass('NavBarPos');

</script>
</body>
</html>