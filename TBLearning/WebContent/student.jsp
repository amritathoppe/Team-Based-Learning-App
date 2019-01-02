<html>
<head>
<title>Student</title>
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
<%@include file="includes/student_header.jsp" %>
<div class="container">
  <h2> Group Quiz</h2>
  <div class="container-fluid text-center">    
     <div class="col-sm-2">
      <p></p>
    </div>
      <br>
     
      <div class="container col-sm-10">   <div class="row">
    
    <div class="col-sm-4">
		<div class="panel panel-primary">
		<div class="panel-heading"> Topic 1 quizze <br></div>
		<div class="panel-footer"> <button type="button" align="right" class="btn btn-info" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Enter Token</button></div>
		</div>
	</div>

	  <div class="col-sm-4">
		<div class="panel panel-primary">
		<div class="panel-heading"> Topic 2 quizze <br></div>
		<div class="panel-footer"> <button type="button" align="right" class="btn btn-info" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Enter Token</button></div>
		</div>
	</div>
	  
</div> </div> 
</div>
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <form data-toggle="validator" role="form" method="post" action="">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Quiz</h4>
        </div>
        <div class="modal-body">
                 <div class="col-sm-6 form-group">
								<label>Enter Token</label>
								<input type="text" id="token" name="token" pattern="^[a-zA-Z0-9\s]+$" placeholder="Enter your token  Here.." class="form-control" required>
							</div>    
                        
        <div class="modal-footer">
          <button type="button" id="relation" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><a href="student_individual_quiz.jsp"><div class="col-spaced">Submit</div></button> 
        </div>
      </div>
      </form>
    </div>
  </div>
  
</div>
</div>
</body>
</html>