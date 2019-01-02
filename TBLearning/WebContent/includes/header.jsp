<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@page import="java.util.*" %> 
<html>
<head>
<title>Instructor</title>
  
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
<script>
    /* When the user clicks on the button, 
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
        }

        // Close the dropdown if the user clicks outside of it
        window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {

        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
        }
    }
    </script>
    
<style>body {
    background-color: white;
}

.dropbtn {
       position: relative;
   top: 13px;
   border: none;
   box-shadow: none;
   background-color: transparent;
   color: #9d9d9d ;
}
.logoutbtn{
       position: relative;
   top: 13px;
   border: none;
   box-shadow: none;
   background-color: transparent;
   color: #9d9d9d ;
}




.dropdown {
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
   background-color: #f9f9f9 ;
   min-width: 160px;
   overflow: auto;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   z-index: 1;
    right: 35px;
}

.dropdown-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
}

.dropdown-content a:hover {color: #23527c !important;
   text-decoration: underline !important;}

.show {display:block;}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
   <div class="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>                        
     </button>
     <a class="navbar-brand" href="instructor.jsp">TB Learning Application</a>
   </div>
   <ul class="nav navbar-nav">
       <li><a href="LoginServlet?task=toInstructorCourse">Courses</a></li><!--LoginServlet?task=toInstructorCourse  did display the resultset-->
       <li><a href="LoginServlet?task=toStudent">Student</a></li><!-- modal+display+submit?-->
       <li><a href="LoginServlet?task=toCreateTopic">Topics</a></li><!--  need reln -->
       <li><a href="LoginServlet?task=toCreateQuestion">Questions</a></li><!-- uploading &submit +reln to get ans +plus only 4 options servlet accordingly -->
       <li><a href="LoginServlet?task=toCreateQuiz">Quiz</a></li><!-- done min alone parsing issue -->
       <li><a href="LoginServlet?task=toGroupQuiz">Group Quiz</a></li><!-- frm scratch-->
     </ul>
   <ul class="nav navbar-nav navbar-right" >
  
     <li class="active">
     <div class="none">
<button onclick="myFunction()" class="dropbtn"> <span class="glyphicon glyphicon-user"></span>MyAccount</button>
          
            <div id="myDropdown" class="dropdown-content" style="color:black;font-color:white">
                <a href="change_password.jsp">Change Password</a>
                <a href="#">Edit Details</a>
             </div>
             </div></li>
             <li class="active">            
              <a href="LoginServlet?task=logout">
			<span class="glyphicon glyphicon-off"></span>Logout</a>
			
			</li></ul>

   </div>
 </div>
</nav>
</body>
</html>