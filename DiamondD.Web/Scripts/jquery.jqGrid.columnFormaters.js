$.dateFormater = function (cellvalue, options, rowObject) {
    console.log(cellvalue);
    var fullDate;
    if (cellvalue.substr(0, 6) == "/Date(") {
        fullDate = new Date(parseInt(cellvalue.substr(6)));
    }
    else {
        fullDate = new Date(cellvalue);
    }
    
    var date = fullDate.getDate();
    var month = fullDate.getMonth() + 1;
    var fullYear = fullDate.getFullYear();
    if (date == "1" && month == "1" && fullYear == "1") {
        return " ";
    }
    return date + "-" + month + "-" + fullYear;
};

$.EditFormater = function (cellvalue, options, rowObject) {
    var first = "<a href='";
    var second = "";
    console.log(options.gid);
    if (options.gid == "surveys") {
        second = "CreateSurvey";
    }
    else if (options.gid == "questionsGroup") {
        second = "http://"+window.location.host + "/Survey.mvc/QuestionsGroup/Create";
    }
    var third = "?id=";
    return first + second + third + cellvalue + "'" + ">Edit</a>"
}

$.EnrollmentIdHiddenFormatter = function (cellvalue, options, rowObject) {
    return "<input type='hidden' value='" + cellvalue + "' />"
    console.log(cellvalue);
}

$.BooleanFormater = function (cellvalue, options, rowObject) {    
    if (cellvalue==true||cellvalue=='Yes'||cellvalue=='Y') {
        return 'true';
    }
    else if (cellvalue==false||cellvalue=='No'||cellvalue=='N') {
        return 'false';
    }
    console.log(cellvalue);
}