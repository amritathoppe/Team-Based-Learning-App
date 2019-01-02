<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>New Question</title>
  <link rel="stylesheet"
	href="css/navbar.css">
<link rel="stylesheet"
	href="css/general.css">
</head>
</head>
<body>
	<%@include file="includes/header.jsp" %>

	<div class="container-fluid outer">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>New Question</h4>
						<span id="error" class="error"></span>
					</div>
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
						<form name="questionForm" method="post"
							action="${pageContext.request.contextPath}/js/new_question.js"
							onsubmit="return validateForm()">
							<input id="filename" name="filename" type="hidden" />
							<fieldset>
								<div class="input-group">
									<span class="input-group-addon">Content</span>
									<textarea class="form-control" name="content" rows="6"
										cols="50"></textarea>
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
										name="answer" class="form-control">
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
										name="Course" class="form-control">
										<option disabled selected value="" style="display: none">
										-- Select Correct Option --
										</option>
										<option value="a">A</option>
										<option value="b">B</option>
										<option value="c">C</option>
										<option value="d">D</option>
									</select>
								</div>
								</div>
								<br>
								<div>
									<div class="input-group">
									<span class="input-group-addon">Topics</span> <select
										name="Topics" class="form-control">
										<option disabled selected value="" style="display: none">
										-- Select Correct Option --
										</option>
										<option value="a">A</option>
										<option value="b">B</option>
										<option value="c">C</option>
										<option value="d">D</option>
									</select>
								</div>
								</div>
								<br>
								<div class="pull-right">
									<button class="btn btn-default btn-md" id="cancel_btn"
										type="button" onClick="javascript:window.location='list_questions.jsp'">Cancel</button>
									<input class="btn btn-default btn-md" type="submit"
										value="Create" />
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		var tmpPath = "${initParam['tmp_root']}";
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/new_question.js"></script>
</body>
</html>
</body>
</html>