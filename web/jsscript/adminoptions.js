/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function disableback() {
    window.onload=window.history.forward();
}
function redirectlogin() {
   
    setTimeout(function() { window.location="login.html"; },100);
}
function redirectvotingpage() {
    setTimeout(function(){ window.location="voteroptions.jsp";},1000);
}
function seecandidate()
{
    var data={data:"result"};
    $.post("ShowAllCandidateServlet",data,function(responseText)
    {
       alert(responseText);
        $("#result2").html("");
        $("#result2").append(responseText);
    });
}
function redirectadministratorpage() {
    swal("Admin!","Redirecting to Admin Page!","success");
    setTimeout(function() { window.location="adminactions.jsp"; },3000);
}
function showusers() {
//    removecandidateForm();
    $("#result").html("");
   var newdiv=document.createElement("div");
   newdiv.setAttribute("id","candidateForm");
   newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    
    newdiv.innerHTML="<h3>Users</h3>";
    var data={data:"data"};
    $.post("ShowUserControllerServlet",data,function(responseText){
//        alert(responseText);
        newdiv.innerHTML=newdiv.innerHTML+responseText;
    });
    newdiv.innerHTML=newdiv.innerHTML+"</table>";
    $("#result").append(newdiv);
    
    
}

function dltuser() {
    data={data:userid,res:"res"};
    $.post("RemoveUserControllerServlet",data,function(responseText) {
        responseText=responseText.trim();
        alert(responseText);
       if(responseText==="success") {
           swal("Admin!","User Deleted Successfully","success");
           setTimeout(function() { window.location="adminoptions.jsp"; },3000);
       }
           
       else
           swal("Admin!","Can't Delete User which is already given vote! According to Practical Rule","success");
        });
    
}
function managecandidate() {
    swal("Admin!","Redirection to Candidate Management!","success");
    setTimeout(function() { window.location="managecandidate.jsp";},3000);
}
//function redirectvotingpage() {
//        swal("Admin!","Redirecting to Voting page","success");
//        setTimeout(function(){window.location='VotingControllerServlet';},2000);
//        
//    
//}
function manageuser() {
    swal("Admin!","Redirecting to Manage Users Page","success");
    setTimeout(function(){window.location="manageusers.jsp";},2000);
}
function showaddcandidateform() {
//     removecandidateForm();
    $("#result").html("");
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","candidateform");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    newdiv.innerHTML="<h3>Add New Candidate</h3>";
    newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'>\n\
    <table><tr><th>Candidate ID:</th><td><input type='text' id='cid'></td></tr>\n\
    <tr><th>User ID:</th><td><input type='text' id='uid' onkeypress='return getdetails(event)'></td></tr>\n\
    <tr><th>Candidate Name:</th><td><input type='text' id='cname'></td></tr> \n\
    <tr><th>City:</th><td><select id='city'></select></td></tr> \n\
    <tr><th>Party:</th><td><input type='text' id='party'></td></tr> \n\
    <tr><td colspan='2'><input type='file' name='files' value='Select Image'></td></tr> \n\
    <tr><th><input type='button' value='Add Candidate' onclick='addcandidate()' id='addcnd'></th>\n\
    <th><input type='reset' value='Clear' onclick='clearText()'></th></tr></table></form>";
    
    newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
    var addcnd=$("#result");
    addcnd.append(newdiv);
    data={id:"getid"};
    $.post("AddCandidateControllerServlet",data,function(responseText) {$("#cid").val(responseText); 
    $("#cid").prop("disabled",true);});   
}
function getdetails(e) {
    if(e.keyCode===13) {
        data={uid:$("#uid").val()};
        $.post("AddCandidateControllerServlet",data,function(responseText){
        responseText=responseText.trim();
        var i=responseText.lastIndexOf(",");
        $("#city").empty();
        $("#city").append(responseText.substring(0,i));
        var uname=responseText.substring(i+1,responseText.length);
        if(uname==="wrong")
            swal("Wrong Adhar!","Adhar No. not found in DB","error");
        else {
            $("#cname").val(uname);
            $("#cname").prop("disabled",true);
        }
        });
    }
}
function addcandidate() {
    var form=$('#fileUploadForm')[0];
    var data=new FormData(form);
    var cid=$("#cid").val();
    var cname=$("#cname").val();
    var city=$("#city").val();
    var party=$("#party").val();
    var uid=$("#uid").val();
    data.append("cid",cid);
    data.append("uid",uid);
    data.append("cname",cname);
    data.append("party",party);
    data.append("city",city);
    $.ajax({
        type:"POST",
        enctype:'multipart/form-data',
        url: 'AddNewCandidateControllerServlet',
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(data) {
            str=data+"....";
            swal("Admin!",str,"success");
            setTimeout(function(){ showaddcandidateform();},3000);
        },
        error: function(e) {
            swal("Admin!",e,"error");
        }
    });
}
function removecandidateForm() {
    var contdiv=document.getElementById("result");
    var formdiv=document.getElementById("candidateform");
    if(formdiv!==null) {
        $("#candidateform").fadeOut("3500");
        contdiv.removeChild(formdiv);
        
    }
}
function removevoterform() {
    var contdiv=document.getElementById("result2");
    var formdiv=document.getElementById("candidateform");
    if(formdiv!==null) {
        $("#candidateform").fadeOut("3500");
        contdiv.removeChild(formdiv);
        
    }
}
function clearText() {
    $("#addresp").html("");
}
function showcandidate() {
//   removecandidateForm();
    $("#result").html("");
   var newdiv=document.createElement("div");
   newdiv.setAttribute("id","candidateForm");
   newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    
    newdiv.innerHTML="<h3>Show Candidate</h3>";
    newdiv.innerHTML=newdiv.innerHTML+"<div style='color:white; font-weight:bold'>Candidate Id:</div><div><select id='cid'></select></div>";
    newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
    var addPrd=$("#result")[0];
    addPrd.appendChild(newdiv);
    data={data:"cid"};
    
    $.post("ShowCandidateControllerServlet",data,function(responseText){
       $("#cid").append(responseText); 
    });
    
    $("#cid").on('change',function(){
        var cid=$(this).children("option:selected").val();
        data={data:cid};
        $.post("ShowCandidateControllerServlet",data,function(responseText){
            clearText();
            $("#addresp").append(responseText);
        });
    });
}
function electionresult() {
    $("#result").html("");
    var data={data:"result"};
    $.post("ElectionResultControllerServlet",data,function(responseText){
//       swal("success",responseText.trim(),"success");
//       $("#result").html("");
       
       $("#result").html(responseText);
       
    });
                
}
function deletecandidate() {
//    removecandidateForm();
    $("#result").html("");
   var newdiv=document.createElement("div");
   newdiv.setAttribute("id","candidateForm");
   newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    
    newdiv.innerHTML="<h3>Delete Candidate</h3>";
    newdiv.innerHTML=newdiv.innerHTML+"<div style='color:white; font-weight:bold'>Candidate Id:</div><div><select id='cid'></select></div>";
    newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
    var addPrd=$("#result")[0];
    addPrd.appendChild(newdiv);
    data={data:"cid"};
    
    $.post("DeleteCandidateControllerServlet",data,function(responseText){
       $("#cid").append(responseText); 
    });
    
    $("#cid").on('change',function(){
        cid=$(this).children("option:selected").val();
        data={data:cid,res:"result"};
        $.post("DeleteCandidateControllerServlet",data,function(responseText){
            clearText();
            $("#result").append(responseText);
        });
  
    });
    
}
function dltcand() {
    data={data:cid,res:"res"};
    $.post("DeleteCandidateControllerServlet",data,function(responseText) {
        responseText=responseText.trim();
        alert(responseText);
       if(responseText==="success") {
           swal("Admin!","Candidate Deleted Successfully","success");
           setTimeout(function() { window.location="managecandidate.jsp"; },3000);
       }
           
       else
            window.location="accessdenied.html";
        });
    
}

function redirectcastvotepage() {
    removevoterform();
    clearText2();
    var data={data:"castvote"};
    $.post("VotingControllerServlet",data,function(responseText){
        $("#result2").append(responseText);
    });
}
function redirectseevotepage() {
    removevoterform();
    clearText2();
    var data={data:"seevote"};
    $.post("VotingControllerServlet",data,function(responseText){
        $("#result2").append(responseText);
    });
        
    }
    function clearText2() {
        $("#result2").html("");
    }
    function  showupdatecandidateform(){
     
//        removecandidateForm();
           $("#result").html("");
          var newdiv = document.createElement("div");
          newdiv.setAttribute("id","candidateform");
          newdiv.setAttribute("float","left");
          newdiv.setAttribute("padding-left","12px");
          newdiv.setAttribute("border","solid 2px red");
          newdiv.innerHTML="<h3>Update Candidate</h3>";
          newdiv.innerHTML=newdiv.innerHTML+"<div style='color:white;font-weight:bold'>Candidate Id :</div><div><select id='cid'></select></div>";
          newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
          var addPrd=$("#result")[0];
          addPrd.append(newdiv);
          data={data:"cid"};
          $.post("UpdateCandidateControllerServlet",data,function(responseText){
              
              $("#cid").append(responseText);
          });
       $("#cid").change(function(){
           var cid=$(this).children("option:selected").val();
         
           data={data:cid};
           $.post("UpdateCandidateControllerServlet",data,function(responseText){
              clearText();
             
              $("#addresp").append(responseText);
           });
           
       }); 
   }
   
   function updatecandidate(){
  
    var form =$("#fileUploadForm2")[0];
     var data = new FormData(form);
     var cid = $("#cid").val();
     var cname= $("#cname").val();
     var city = $("#city").val();     alert("city :"+city);
     var party=$("#party").val();
     var uid = $("#uid").val();    alert("user Id :"+uid);
     data.append("cid",cid);
     data.append("uid",uid);
     data.append("cname",cname);
     data.append("party",party);   alert("party :"+party);
     data.append("city",city);
     if(city===null||party==="")
     {  swal("ERROR!","Kindly Fill All Fields.","error"); 
         return;}
     $.ajax({
         type:"POST",
         enctype:'multipart/form-data',
         url:"ImgUpdateControllerServlet",
         data:data,
         processData: false,
         contentType:false,
         cache:false,
         timeout:600000,
         success: function(data){
             
              str="Candidate Updated Successfully!"; 
             
               swal("Admin!",str,"success");
               setTimeout(function(){window.location="managecandidate.jsp";},800);
         },
     error:function(e){swal("Admin!",e,"error");} });
  
}
function removeuser()
{
//    removevoterForm();
        $("#result").html("");
//    $("#result2").html("");
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","voterForm");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    
    newdiv.innerHTML="<h3>Delete User</h3>";
    newdiv.innerHTML=newdiv.innerHTML+"<div style='color:white; font-weight:bold'>User Id:</div><div><select id='uid'></select></div>";
    newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
    var addPrd=$("#result")[0];
    addPrd.appendChild(newdiv);
    data={data:"uid"};
    
    $.post("RemoveUserControllerServlet",data,function(responseText){
       $("#uid").append(responseText); 
    });
    
    $("#uid").on('change',function(){
        uid=$(this).children("option:selected").val();
        alert(uid);
        data={data:uid,res:"result"};
        $.post("RemoveUserControllerServlet",data,function(responseText){
            clearText();
            $("#result").append(responseText);
        });
  
    });
}
function dltuser() {
    data={data:uid,res:"res"};
    $.post("RemoveUserControllerServlet",data,function(responseText) {
        responseText=responseText.trim();
        alert(responseText);
       if(responseText==="success") {
           swal("Admin!","User Deleted Successfully","success");
           setTimeout(function() { window.location="manageusers.jsp"; },3000);
       }
           
       else
            window.location="accessdenied.html";
        });
    
}
function updateprofile(){
    
         $("#result2").html("");
    var newdiv = document.createElement("div");
    newdiv.setAttribute("id","voterform");
    newdiv.setAttribute("float", "left");
    newdiv.setAttribute("padding-left", "12px");
    newdiv.setAttribute("border", "solid 2px red");
    newdiv.innerHTML="<h3>Update Profile</h3>";
    newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
    var addPrd=$("#result2")[0];
    addPrd.append(newdiv);
    data={data:"details"};
    $.post("UpdateVoterControllerServlet",data,function(responseText){
        $("#result2").append(responseText);
    });
}

function updateuser(){
   
    var form =$("#fileUploadForm")[0];
     var data = new FormData(form);
     var uid = $("#uid").val();
     var uname= $("#uname").val();
     var pass =$("#password").val();    alert("pass :"+pass);
     var cpass =$("#cpassword").val();
     var city = $("#city").val();     alert("city :"+city);
     var address=$("#address").val();   alert("address :"+address);
     var email = $("#email").val();   alert("email :"+email);
     var mobile = $("#mobile").val();    alert("mobile :"+mobile);
     if(!(uname===""||pass===""||cpass===""||city===""||address===""||email===""||mobile==="")){
        if(pass !== cpass){
            swal("Error!", "password does not match", "error");
            return;
        }
        else{
            if(checkEmail(email)===false)
                return;
           
            var data= {uname:uname,
                pass:pass,
                city:city,
                address:address,
                email:email,
                mobile:mobile};
    
                $.post("UpdateVoterControllerServlet",data,function(responseText){
                    responseText = responseText.trim();
    if(responseText==="SUCCESS") {
        swal("success!","Profile updated successfully", "success");
        setTimeout(function(){window.location="voteroptions.jsp";}, 3000);
    }
    else{
        swal("Error!","Cannot Update profile", "error");
        setTimeout(function(){window.location="voteroptions.jsp";}, 3000);
    }
                });     
         
    }
    }
    else{
    swal("Error!", "please fill all the fields", "error");
            return;
}
}

function checkEmail(email){
    var atposition=email.indexOf("@");
    var dotposition=email.lastIndexOf(".");
    if(atposition<1||dotposition<atposition+2||dotposition+2>=email.length){
        swal("Error!","please enter valid email", "error");
        return false;
    }
    return true;
}
//function removevoterForm(){
//        var contdiv=document.getElementById("result");
//        var formdiv = document.getElementById("voterform");
//        if(formdiv!=null){
//            $("#voterform").fadeOut("2500");
//            contdiv.removeChile(formdiv);
//        }
//    }

