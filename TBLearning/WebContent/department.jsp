<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Department</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/Table.css" rel="stylesheet">
  <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>            
  <script src="jquery.tabledit.min.js"></script>
  <script src="js/TableOperation.js"></script>
  <style>
 
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
		<input type="hidden" id="task" name="task"/>

<%@include file="includes/admin_header.jsp" %>
<c:if test="${not empty sessionScope.msg1}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${sessionScope.msg1}</strong> 
    </div>
</c:if>
<div class="container" align="right" style="padding-right:50px">
 
  <!-- Trigger the modal with a button -->
  <button type="button"   class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add Department</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     <form action="LoginServlet?" method="post">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Department</h4>
        </div>
        <div class="modal-body" align="left">
          	<div class="row">
	 
				
					<div class="col-sm-12">
							<div class="col-sm-6 form-group">
								<label>Department Code </label>
								<input type="text"  name="departmentCode" placeholder="Enter Department Code Here.." class="form-control" min="2" required>
							</div>
							<div class="col-sm-6 form-group">
								<label>Department Title</label>
								<input type="text"  name="departmentDesc" pattern="^[a-zA-Z0-9\s]+$" placeholder="Enter Department Title Here.." class="form-control" required>
							</div>
					
                       </div>
                       </div>
                       </div>
        <div class="modal-footer">
        <div class="form-group">
         
		<button  id="departmentCreate" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><div class="col-spaced">Submit</div></button> 
		  <script>
                                    document.getElementById("departmentCreate").onclick = function() {
                                    document.getElementById("task").value = "departmentCreation";   
                                    
                                    }
                                  
 </script>
		<button  class="btn btn-lg btn-warning col-sm-3.5 col-md-offset-1" data-dismiss="modal"><div class="col-spaced">Cancel</div></button> 
        
    
 
	</div>				
				
</div>
     </form> </div>
      
    </div>
  </div>
  
</div>
<div class="container">  

<form action="LoginServlet" name="form" method="post" id="Tab"> 

 <table id="Department"  class= "table table-stripped table-bordered table-hover instructTable"> 
<thead class="ColorSetThead">
    
<tr>
							
							<td  width="30%" style="font-weight: bold;">Department Code</td>
							<td width="70%" style="font-weight: bold;">Department Title</td>
							<td id="Edit" style="font-weight: bold;" data-orderable="false" width="30%">Edit</td>
							<td id="Delete" style="font-weight: bold;" data-orderable="false" width="30%">Delete</td>
							
					</tr>
			</thead>

			<tbody class="ColorSetTbody">
				<%ResultSet rs=(ResultSet)request.getAttribute("resultSet");String a="null";
				while (rs.next()) {%>
				
<tr id="row_<%=rs.getInt(1)%>">	
	<td id="code<%=rs.getInt(1)%>" width="30%"><%=rs.getString(2)%></td>
	<td id="desc<%=rs.getInt(1)%>" width="70%"><%=rs.getString(3)%></td>
	<td>
	
			<button onclick="setEdit(<%=rs.getInt(1)%>)" id="EditBtn<%=rs.getInt(1)%>" value=<%=rs.getInt(1)%> type="button"
				style="height: 2.4em" class="btn btn-default btn-md">
			<span class="glyphicon glyphicon-edit"></span></button>
			
	</td>
	<td >		
	
		<button  id="Department_ID" value='<%=rs.getInt(1)%>' ><a href="LoginServlet?task=deleteDepartment&Department_ID=<%=rs.getInt(1)%>">Delete</a></button> 
			
		
	</td>
	</tr>
<%}%>
</tbody>
</table>
</form>
</div>

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script>

	function setEdit(Department_ID) {
		var e = document.getElementById("code" + Department_ID);
		var d = document.getElementById("desc" + Department_ID);
		console.log(e.getAttribute("contenteditable"));
		console.log("Column Name is:" + Department_ID + document.getElementById("desc" + Department_ID).innerHTML + " " + document.getElementById("desc" + Department_ID).outerHTML);
		console.log("Column Name is:" + Department_ID + " " + document.getElementById("code" + Department_ID).innerHTML + " " + document.getElementById("code" + Department_ID).outerHTML);
		var str = "LoginServlet?task=updateDepartment&Department_ID="+Department_ID+"&Department_Code="+e.innerHTML+"&Department_Desc="+ d.innerHTML+"";

		if (!e.getAttribute("contenteditable")) {
			e.setAttribute("contenteditable", "true");
			d.setAttribute("contenteditable", "true");
		}
		else {
			e.removeAttribute("contenteditable");
			d.removeAttribute("contenteditable");
			console.log(str.split(' ').join('+'));
 			location.href = str;
 		}
		console.log(str);

		console.log(e.getAttribute("contenteditable"));
		
	}


$('#Department').dataTable();
$("#Department").appendTo("#Tab");
$('#Department_wrapper .row').eq(2).find('.col-sm-5').addClass('PageNumberTitle');
$('#Department_wrapper .row').eq(2).find('.col-sm-7').addClass('PageNumberBody');
$("#Edit").removeClass('sorting');
$("#Delete").removeClass('sorting');
$('.editbtn').click(function () {
	var id= $(this).val();
	alert(id);
	var contents = $(this).parents().find('td[contenteditable=true]');
	console.log(contents);
    var contentArray = [];
    for (i = 0; i < contents.length; i++) {
        contentArray[i] = contents[i].innerHTML;
        console.log(contentArray[i]);
    }
	//alert(id);
	});

//$("#Department").addClass("TabTopics");

</script> 
</body>
</html>
