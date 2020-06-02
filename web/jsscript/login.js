/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var userid,password;
function connectUser() {
    userid=$("#username").val();
    password=$("#password").val();
    if(validate()===false) {
        swal("Access Denied","Please Enter userid/password","error");
        return;
    }
    var data={
        userid:userid,
        password:password
    };
    $.post("LoginControllerServlet",data,processResponse);
//    qxhr.error(handleError);
}
function processResponse(responseText) {
    responseText=responseText.trim();
    if(responseText==="error") {
        swal("Access Denied!","please Enter valid userid/password","error");
    }
    else if(responseText.indexOf("jsessionid")!==-1) {
        swal("success!","Login Accepted!","success");
        setTimeout(function() {
            window.location=responseText;
            
        },3000);
    }
    else {
        swal("Access Denied!","Some Problem Occured, Please Try Again Later","error");
    }
}
function validate() {
    if(userid===""||password==="")
        return false;
    return true;
}
function disableback() {
    window.onload=window.history.forward();
}

