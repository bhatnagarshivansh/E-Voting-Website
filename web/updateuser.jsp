<%-- 
    Document   : updateuser
    Created on : 13 Jan, 2020, 5:01:25 PM
    Author     : Shivansh
--%>
<%@page import="evoting.dto.UserDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String userid=(String)session.getAttribute("userid");
   if(userid==null){
     response.sendRedirect("accessdenied.html");
     return;
   }
    String result =(String)request.getAttribute("result");
    StringBuffer displayBlock = new StringBuffer("");
    if(result.equalsIgnoreCase("details")){
        UserDetails user =(UserDetails)request.getAttribute("user");
    displayBlock.append(  "<form method='POST' id='fileUploadForm'>"
                         +"<table>"
                         +"<tr><th> User Id/Adhar No: </th><td><input type='text' id='uid' value='"+user.getUserid()+"'readonly></td></tr>"
                        +"<tr><th>Name :</th><td><input type='text' id='uname' value='"+user.getUsername()+"'></td></tr>"
                         +"<tr><th>Password :</th><td><input type='password' id='password' value='"+user.getPassword()+"' ></td></tr>"
                         +"<tr><th>Re-Enter Password :</th><td><input type='password' id='cpassword' value='"+user.getPassword()+"'></td></tr>"
                        +"<tr><th>Address :</th><td><input type='text' id='address' value='"+user.getAddress()+"' ></td></tr>"
                        +"<tr><th>City :</th><td><input type='text' id='city' value='"+user.getCity()+"' ></td></tr>"
                         +"<tr><th>Email :</th><td><input type='text' id='email' value='"+user.getEmail()+"'></td></tr>"
                         +"<tr><th>Mobile :</th><td><input type='text' id='mobile' value='"+user.getMobile()+"'></td></tr>" 
                           +"<tr><th><input type='button' value='Update' onclick='updateuser()' id='update'></th></tr></table></form>" );
          out.println(displayBlock);
    }
%>