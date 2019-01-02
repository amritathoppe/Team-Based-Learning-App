<html>
<head>
<meta charset="UTF-8">	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div#test{ border:#000 1px solid; padding:10px 40px 40px 40px;}
 .modal-header {
  color: #fff;
    background-image: linear-gradient(255deg, #f9b25e, #f17b30);
}
.modelBtn{
color: #fff;
    background-color: black;
    order-color: #255625;
    height: 45px;
    position: relative;
    left: 270px;
    top: 13px;
    border-radius: 7px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var pos = 0, test, test_status, question, choices, choice, chA, chB, chC, correct = 0;
var questions =[
	[ "What is the range of short data type in Java?", "-128 to 127", "-32768 to 32767", "-2147483648 to 2147483647", "B" ],
	[ "Which of these packages contains all the classes and methods required for even handling in Java?", "java.applet" , "java.awt ", "java.awt.event", "C" ],
	[ "What is Collection in Java?", "A group of objects", "A group of classes", "A group of interfaces", "A" ],
	[ "Which of these operators is used to allocate memory for an object?", "malloc", "alloc", "new", "C" ]
];

function _(x){
	return document.getElementById(x);
}

function renderQuestion(){
	test = _("test");
	if(pos >= questions.length){
		test.innerHTML = "<h2>You got "+correct+" of "+questions.length+" Questions correct</h2>";
		_("test_status").innerHTML = "Test Completed";
		pos = 0;
		correct = 0;
		
		document.getElementById("status").style.display = 'none';
		var element = document.getElementById('status_done');
		element.innerHTML = '<br><br><h1 style="color:red;font-family:arial;">!! Test Completed !!</h1>';
		element.innerHTML += 'Your Test Succesfully submitted !!';
		return false;
	}
	_("test_status").innerHTML = "Question "+(pos+1)+" of "+questions.length;
	question = questions[pos][0];
	chA = questions[pos][1];
	chB = questions[pos][2];
	chC = questions[pos][3];
	test.innerHTML = "<h3>"+question+"</h3>";
	test.innerHTML += "<input type='radio' name='choices' value='A'>"+chA+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='B'>"+chB+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='C'>"+chC+"<br>";
	test.innerHTML += "<button id='submitBtn' class='modelBtn' onclick='checkAnswer()'>Submit Answer</button>";
}
function checkAnswer(){
	choices = document.getElementsByName("choices");
	for(var i=0; i<choices.length;i++){
		if(choices[i].checked){
			choice = choices[i].value;
		}
	}
	if(choice == questions[pos][4]){
		correct++;
	}
	pos++;
	renderQuestion();
}
window.addEventListener("load", renderQuestion, false);
</script>
</head>
<body>
<%@include file="includes/student_header.jsp" %>
<div class="container">
  <h2> Individual Quiz</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" align="right" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Start Quiz</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Quiz</h4>
        </div>
        <div class="modal-body">
                      <div class="timecounter">
                               <script type="text/javascript">
                               function countDown(secs, elem){
	                           var element = document.getElementById(elem);
	                           element.innerHTML = "Time-Left: "+secs+"s";
	                           if(secs < 1)
	                            {
		                        clearTimeout(timer);
		
		                       element.innerHTML = '<br><br><h1 style="color:red;font-family:arial;">!! Test Completed !!</h1>';
		                       element.innerHTML += 'Your Test Succesfully submitted !!';
		                       $("#submitBtn").attr("disabled","disabled");
	                           }
	                           secs-- ;
	                           var timer = setTimeout('countDown('+secs+',"'+elem+'")',1000);
                                 }

                                </script>
                            <div id="status"></div>
                            <div id="status_done"></div>
                            <script type="text/javascript">countDown(20,"status");</script>
                             </div>
                            <h2 id="test_status"></h2>
                        <div id="test"></div>
                          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-lg btn-danger col-sm-3.5 col-md-offset-1" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>
