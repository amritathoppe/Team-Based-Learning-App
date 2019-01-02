<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Instructor:Topics</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/Table.css" rel="stylesheet">
  <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>            
  <script src="jquery.tabledit.min.js"></script>
  <script src="js/TableOperation.js"></script>
 <script language="javascript" type="text/javascript">  
      var xmlHttp ;
      var xmlHttp;
      function showSemester(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="Semester.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      
      
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("Offered").innerHTML=xmlHttp.responseText; 
      
      }   
      }

      function showCourses(str){
      if (typeof XMLHttpRequest != "undefined"){
        xmlHttp= new XMLHttpRequest();
        }
      else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var count = document.getElementById("Year").value;
      var url="Dropdown_Course.jsp";
      url +="?count="+count+"&count1="+str;
      xmlHttp.onreadystatechange = stateChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function stateChange1(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("Courses").innerHTML=xmlHttp.responseText   
      }   
      }
      </script>  
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
<div class="optionsDiv" style="position: relative;left: 650px;top: 57px;">
        To view your topics
        <select id="selectField">
            <option value="All" selected>All</option>
            <option value="<%= session.getAttribute( "userName" ) %>">My Topics</option>
            

        </select>
   
    </div>
<c:if test="${not empty sessionScope.msg1}">
 <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${sessionScope.msg1}</strong> 
    </div>
</c:if>
<div class="container" align="right" style="padding-right:50px">
 
  <!-- Trigger the modal with a button -->
  <button type="button"   class="btn btn-info btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span>Add Topic</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     <form action="LoginServlet" method="post">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Topics</h4>
        </div>
        <div class="modal-body" align="left">
          
          <table >
      <tr><th class=" form-control col-sm-3.5 col-md-offset-0.5">Year</th><td>
      <select id="Year" name='Year' onchange="showSemester(this.value)" class="form-control col-sm-3.5 col-md-offset-0.5" style="width:250px;">  
       <option value="none">Select</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tblearning_db","root","");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select distinct(Course_year) from course");
 while(rs.next()){
     %>
      <option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%></option>  
      <%
 }
     %>
      </select> 
      </td></tr>
      <tr><th class=" form-control col-sm-6 col-md-offset-0.5">Offered</th><td id='Offered'><select name='Offered' >  
      <option value='-1'></option>  
      </select>
      </td></tr>
      <tr><th class=" form-control col-sm-6 col-md-offset-0.5">Courses</th>
         
       <td id='Courses'> <select name='Courses' >  
      <option value='-1'></option>  
      </select>   
      </td>
      </tr>
      </table>
     <div class="col-sm-8 form-group">
								<label>Topic Title</label>
								<input type="text"  name="Tobics_Desc" pattern="^[a-zA-Z\s]+$" placeholder="Enter Topic Title Here.." class="form-control" required>
	  </div>
	  </div>
	  
        <div class="modal-footer">
        <div class="form-group">
         
		<input type="hidden" id="task" name="task"/>
		<button  type=button id="createCourse" class="btn btn-lg btn-info col-sm-3.5 col-md-offset-0.5"><div class="col-spaced">Submit</div></button> 
		  <script>
                                    document.getElementById("createCourse").onclick = function() {
                                    document.getElementById("task").value = "topicCreation";   
                                    
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

 <table id="Topics"  class= "table table-stripped table-bordered table-hover instructTable InstructorTabel" style="width: 637px;position: relative;left: 318px;"> 
<thead class="ColorSetThead">
    

<tr>
							
							<td  width="40%" >Topic Description</td>
							<td width="30%" >Course Code</td>
							<td width="40%">Course Title</td>
							
							
					</tr>
			</thead>
			<tbody class="ColorSetTbody">
				<%ResultSet res=(ResultSet)request.getAttribute("resultSet");//String a1="null",a2="null";
				//ResultSet rs2=(ResultSet)request.getAttribute("resultSet_course");
				while (res.next()) {%>
				
				
<tr position="<%=res.getString(4) %>">	
	<td id="<%=res.getInt(1) %>" width="40%"> <%=res.getString(2) %></td>
	<td id="<%=res.getInt(1) %>" width="30%"> <%=res.getString(9) %></td>
	<td id="<%=res.getInt(1) %>" width="40%"> <%=res.getString(10) %></td>
</tr>
<%}%>
</tbody>
</table>

</form>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script>
$('#Topics').dataTable();
$('#Topics_wrapper .row').eq(1).find('.col-sm-12').find('table').addClass('CustomSize');
$('#Topics_wrapper .row').eq(0).addClass('rm1');
var BNav1 = $('.rm1');
$( BNav1).insertBefore( $('#Topics_wrapper .row').eq(1).find('.col-sm-12').find('table'));
$('#Topics_wrapper .row').eq(2).addClass('rm');
var BNav = $('.rm');
$( BNav).insertAfter( $('#Topics_wrapper .row').eq(0).find('.col-sm-12').find('table'));
$('.rm').find('.col-sm-5').addClass('NavBarPosTopics1');
$('.rm').find('.col-sm-7').addClass('NavBarPosTopics2');

</script>

<script type="text/javascript">
$(document).ready(function() {

//     function addRemoveClass(theRows) {

//         theRows.removeClass("odd even");
//         theRows.filter(":odd").addClass("odd");
//         theRows.filter(":even").addClass("even");
//     }

    var rows = $("table#Topics tr:not(:first-child)");

    //addRemoveClass(rows);


    $("#selectField").on("change", function() {

        var selected = this.value;
        console.log(selected);

        if (selected != "All") {

            rows.filter("[position=" + selected + "]").show();
            rows.not("[position=" + selected + "]").hide();
            var visibleRows = rows.filter("[position=" + selected + "]");
            addRemoveClass(visibleRows);
        } else {

            rows.show();
            addRemoveClass(rows);

        }

    });
});
</script>

</body>
</html>
