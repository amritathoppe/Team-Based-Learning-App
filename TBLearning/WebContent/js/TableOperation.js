function delThisProblem(v) {
	console.log("Entered into JS");
	console.log(v);
    
    document.location.href = "LoginServlet?task=deleteDepartment";
//document.location.href = "LoginServlet?task=deleteDepartment&Department_ID=" + v;
}

function editThisProblemAjax(v) {
    $("#editbtn" + v).html("<span class=\"glyphicon glyphicon-save\"></span>");
    $("#editbtn" + v).attr("class", "btn btn-success btn-md");
    $("#editbtn" + v).attr("onclick", "updateThisProblemAjax(" + v + ")");

    $.get("getprob", {
        pid : v
    }, function(data, status) {
        $("#probcont" + v).html(data);
    });
}

function updateThisProblemAjax(v) {
    var prob = $("#probarea" + v).val();

    $("#probcont" + v).html(prob);

    var math = document.getElementById("probcont" + v);
    MathJax.Hub.Queue([ "Typeset", MathJax.Hub, math ]);

    $("#editbtn" + v).html("<span class=\"glyphicon glyphicon-edit\"></span>");
    $("#editbtn" + v).attr("class", "btn btn-default btn-md");
    $("#editbtn" + v).attr("onclick", "editThisProblemAjax(" + v + ")");

    $.get("saveprob", {
        pid : v,
        prob : prob
    }, function(data, status) {
    });
}