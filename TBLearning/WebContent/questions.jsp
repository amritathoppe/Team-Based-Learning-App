<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <div class="alert alert-success alert-dismissable" >
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${request.getSession().getAttribute("msg2")}</strong> 
  </div>

</c:if>
<div class="container" align="right" style="padding-right:50px">
  <h2>Create Question</h2>
  <!-- Trigger the modal with a button -->
  <button type="button"   class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add Question</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Question</h4>
        </div>
        <div class="modal-body" align="left">
          	<div class="row">
	<form data-toggle="validator" role="form" method="post" action="LoginServlet">
				<div class="panel-body">
						<div class="well">
							<label>Add Image</label>
							<form id="fileForm">
								<label class="btn btn-default btn-file"> Browse<input
									type="file" name="file" id="file_selector"
									style="display: none;" />
								</label>
								<button class="btn btn-default" id="btnClear" type="button">Clear</button>
							</form>
							<br> <img class="img-responsive"
								style="display: block; max-width: 100%; height: auto;"
								id="image_display">
						</div>
						
							<fieldset>
								<div class="input-group">
									<span class="input-group-addon">Content</span>
									<textarea class="form-control" name="Question_Desc" rows="6"
										cols="50" ></textarea>
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">Option A</span> <input
										type="text" class="form-control input-sm" name="option_a" />
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">Option B</span> <input
										type="text" class="form-control input-sm" name="option_b" />
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">Option C</span> <input
										type="text" class="form-control input-sm" name="option_c" />
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">Option D</span> <input
										type="text" class="form-control input-sm" name="option_d" />
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">Answer</span> <select
										name="Question_Correct_Answer" class="form-control">
										<option disabled selected value="" style="display: none">
										-- Select Correct Option --
										</option>
										<option value="a">A</option>
										<option value="b">B</option>
										<option value="c">C</option>
										<option value="d">D</option>
									</select>
								</div>
								<br>
								<div>
									<div class="input-group">
										<span class="input-group-addon">Keywords</span> <input
											type="text" class="form-control input-sm" name="keywords"
											placeholder="Keywords separated by commas..." />
									</div>
								</div>
								<br>
								<div>
									<div class="input-group">
									<span class="input-group-addon">Courses</span> <select
										name="Question_Course_ID" class="form-control">
										<option disabled selected value="" style="display: none">
										-- Select Correct Option --
										</option>
										<option value="a">Enterprise Web Development</option>
										<option value="b">Advanced Web Development with Java</option>
										<option value="c">Programming Languages</option>
										<option value="d">Computer Systems</option>
									</select>
								</div>
								</div>
								<br>
								<div>
									<div class="input-group">
									<span class="input-group-addon">Topics</span> <select
										name="Question_Tobics_ID" class="form-control">
										<option disabled selected value="" style="display: none">
										-- Select Correct Option --
										</option>
										<option value="a">Ajax</option>
										<option value="b">Beans</option>
										<option value="c">C++</option>
										<option value="d">Introduction</option>
									</select>
								</div>
								</div>
								<br>
							
							</fieldset>
						</div></form>
					</div>
				
					
					        <div class="modal-footer">
        <div class="form-group">
		<input type="hidden" id="task" name="task"/>
		<button type="submit" id="createquestion" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><div class="col-spaced">Submit</div></button> 
		<button type="cancel" class="btn btn-lg btn-warning col-sm-3.5 col-md-offset-1" data-dismiss="modal"><div class="col-spaced">Cancel</div></button> 
          
      <script>
                                    document.getElementById("createquestion").onclick = function() {
                                    document.getElementById("task").value = "questionCreation";                        
                                    };
                                   
 </script>
	</div>				
			
</div>
     </div>
      
    </div>
   </div>
   </div>
   </div>
  <!-- Start of Display Content -->
  <div class ="panel-body" align="center" id="panelbox">
<div id="panelwithtable"  align="center" class = "panel panel-default" style="width:70%">
   
 <table align="center" width="50%"  cellspacing="6" id="display" style="width: 90%;">
    
      <thead>
    

<tr>
							
							<td  width="70%" >Question Description</td>
							<td width="10%" >Option A</td>
							<td width="10%" >Option B</td>
							<td width="10%" >Option C</td>
							<td width="10%" >Option D</td>
							<td width="10%" >Correct Answer ID</td>
							<td width="10%">Course ID</td>
							<td width="10%" >Topic ID</td>
							
					</tr>
			</thead>
				<%ResultSet rs=(ResultSet)request.getAttribute("questions");String a="null";
				while (rs.next()) {%>
				
				
<tr>	
	<td id="<%rs.getInt(1); %>" width="10%"> <%=rs.getString(2) %></td>
	<%
	int qi = rs.getInt(1);
	do {%>
		
		<td id="<%rs.getInt(1); %>" width="50%"> <%=rs.getString(10) %></td>

	<%rs.next();} while(rs.getInt(1) == qi);rs.previous();%>
	
	<td id="<%rs.getInt(1); %>" width="50%"> <%=rs.getString(9) %></td>
	<td id="<%rs.getInt(1); %>" width="20%"> <%=rs.getInt(3) %></td>
	<td id="<%rs.getInt(1); %>" width="20%"> <%=rs.getInt(4) %></td>
	</tr>
<%}%>
</table>
</div>
</div>
<!-- end of display content -->



</body>
</html>
