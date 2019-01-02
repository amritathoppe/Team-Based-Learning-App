<!DOCTYPE html>
<html>
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

    <head>
        <title>Transfer Rows Between Two HTML Table</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <style>
            
            .container{overflow: hidden}
            .tab{float: left}
            .tab-btn{margin: 50px;}
            button{display:block;margin-bottom: 20px;}
            tr{transition:all .25s ease-in-out}
            tr:hover{background-color: #ddd;}
            
        </style>    
    </head>
    <body>
    
 
  

      <%@include file="includes/header.jsp" %>  
	      <div class="optionsDiv" style="position: relative;left: 125px;">
        	Courses
        <select id="selectField"class="form-control col-sm-3.5" style="width:300px;">
            <option value="All" selected>All</option>
            <option value="A1" >Enterprise Web Development</option>
			<option value="A2" >Advanced Web Development with Java</option>
			<option value="A3" >Programming Languages</option>
			<option value="A4" >Computer Systems</option>
			<option value="A5" >Advances in Evolutionary Computation</option>
			<option value="A6" >Introduction to Evolutionary Computation</option>
			<option value="A6" >Software Engineering</option>

        </select>
   
    </div>	
    <div class="optionsDiv" style="position: relative;position: relative;left: 525px;bottom: 54px;">
        	Choose a Group
        <select id="selectField"class="form-control col-sm-3.5" style="width:300px;">
            <option value="All" selected>Select one...</option>
            <option value="A1" >Group 1</option>
			<option value="A2" >Group 2</option>
			<option value="A3" >Group 3</option>
			<option value="A4" >Group 4</option>
			<option value="A5" >Group 5</option>
			
        </select>
   
    </div>
        <div class="container" Style= "position: relative;    top: -10px;">
            <div class="tab">
                <table id="table1" class= "table table-stripped Course table-bordered table-hover instructTable InstructorTabel">
                    <tr style="background-color: black !important;color: white!important;">
                        <th>SSO ID</th>
                        <th>First Name</th>
                        <th>Student No</th>
                        <th>Select</th>
                    </tr>
                    <tr position="A1">
                        <td>sa4xd</td>
                        <td>Sri</td>
                        <td>181777</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A1">
                        <td>sa4dg</td>
                        <td>amri</td>
                        <td>515215</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                    <tr position="A2">
                        <td>jsld6d</td>
                        <td>josha</td>
                        <td>215145</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A1">
                        <td>dsj7d</td>
                        <td>jshai</td>
                        <td>32412</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A5">
                        <td>mn85sd</td>
                        <td>kohli</td>
                        <td>32542</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A1">
                        <td>k8hys</td>
                        <td>ram</td>
                        <td>95463</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A2">
                        <td>dy7sd</td>
                        <td>krish</td>
                        <td>65742</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A1">
                        <td>l3d6h</td>
                        <td>lovat</td>
                        <td>35426</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A6">
                        <td>ok7sht</td>
                        <td>rect</td>
                        <td>45258</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                     <tr position="A6">
                        <td>k86df</td>
                        <td>mano</td>
                        <td>369547</td>
                        <td><input type="checkbox" name="check-tab1"></td>
                    </tr>
                </table>
            </div>
            
            <div class="tab tab-btn">
                <button onclick="tab1_To_tab2();">>>>>></button>
                <button onclick="tab2_To_tab1();"><<<<<</button>
            </div>
            
            <div class="tab">
                <table id="table2" class= "table table-stripped table-bordered table-hover instructTable InstructorTabel">
                    <tr style="background-color: black !important;color: white!important;">
                        <th>SSO ID</th>
                        <th>First Name</th>
                        <th>Student No</th>
                        <th>Select</th>
                    </tr>
                </table>   
            </div>
        </div>
        <script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap.min.js"></script>
		<script>
		$('#Course').dataTable();
		</script>
        <script>
            
            function tab1_To_tab2()
            {
                var table1 = document.getElementById("table1"),
                    table2 = document.getElementById("table2"),
                    checkboxes = document.getElementsByName("check-tab1");
            console.log("Val1 = " + checkboxes.length);
                 for(var i = 0; i < checkboxes.length; i++)
                     if(checkboxes[i].checked)
                        {
                            // create new row and cells
                            var newRow = table2.insertRow(table2.length),
                                cell1 = newRow.insertCell(0),
                                cell2 = newRow.insertCell(1),
                                cell3 = newRow.insertCell(2),
                                cell4 = newRow.insertCell(3);
                            // add values to the cells
                            cell1.innerHTML = table1.rows[i+1].cells[0].innerHTML;
                            cell2.innerHTML = table1.rows[i+1].cells[1].innerHTML;
                            cell3.innerHTML = table1.rows[i+1].cells[2].innerHTML;
                            cell4.innerHTML = "<input type='checkbox' name='check-tab2'>";
                           
                            // remove the transfered rows from the first table [table1]
                            var index = table1.rows[i+1].rowIndex;
                            table1.deleteRow(index);
                            // we have deleted some rows so the checkboxes.length have changed
                            // so we have to decrement the value of i
                            i--;
                           console.log(checkboxes.length);
                        }
            }
            
            
            function tab2_To_tab1()
            {
                var table1 = document.getElementById("table1"),
                    table2 = document.getElementById("table2"),
                    checkboxes = document.getElementsByName("check-tab2");
            console.log("Val1 = " + checkboxes.length);
                 for(var i = 0; i < checkboxes.length; i++)
                     if(checkboxes[i].checked)
                        {
                            // create new row and cells
                            var newRow = table1.insertRow(table1.length),
                                cell1 = newRow.insertCell(0),
                                cell2 = newRow.insertCell(1),
                                cell3 = newRow.insertCell(2),
                                cell4 = newRow.insertCell(3);
                            // add values to the cells
                            cell1.innerHTML = table2.rows[i+1].cells[0].innerHTML;
                            cell2.innerHTML = table2.rows[i+1].cells[1].innerHTML;
                            cell3.innerHTML = table2.rows[i+1].cells[2].innerHTML;
                            cell4.innerHTML = "<input type='checkbox' name='check-tab1'>";
                           
                            // remove the transfered rows from the second table [table2]
                            var index = table2.rows[i+1].rowIndex;
                            table2.deleteRow(index);
                            // we have deleted some rows so the checkboxes.length have changed
                            // so we have to decrement the value of i
                            i--;
                           console.log(checkboxes.length);
                        }
            }
            
        </script>    
        <button id="opener" Style="position: relative;left: 800px;background-color: black;color: white;height: 35px;width: 70px;
    border-radius: 8px;" data-toggle="modal" data-target="#myModal">Submit</button>
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Group Creation</h4>
        </div>
        <div class="modal-body">
          <p>Group is successfully created</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <script type="text/javascript">
$(document).ready(function() {
	function addRemoveClass(theRows) {

      theRows.removeClass("odd even");
      theRows.filter(":odd").addClass("odd");
      theRows.filter(":even").addClass("even");
  }
    var rows = $("table#table1 tr:not(:first-child)");

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