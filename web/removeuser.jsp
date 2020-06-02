<%-- 
    Document   : removeuser
    Created on : 5 Jan, 2020, 1:19:18 PM
    Author     : Shivansh
--%>

<%@page import="evoting.dto.ShowUserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String userid=(String) session.getAttribute("userid");
  if(userid==null) {
      response.sendRedirect("accessdenied.html");
      return;
  }
  System.out.println("In Remove User Page");
  String result=(String) request.getAttribute("result");
  StringBuffer displayBlock=new StringBuffer("");
  if(result.equals("candidateList")) {
      ArrayList<String> userId=(ArrayList) request.getAttribute("UserId");
      System.out.println(userId);
      for(String c:userId) {
          displayBlock.append("<option value='"+c+"'>"+c+"</option>");
          
      }
  
      out.println(displayBlock);
  }
  else if(result.equals("details")) {
      ShowUserDto user=(ShowUserDto) request.getAttribute("user");
      
       displayBlock.append("<table>"
      +"<tr><th>User Id:</th><td>"+user.getUserid()+"</td></tr>"
      +"<tr><th>Username:</th><td>"+user.getUsername()+"</td></tr>"
      +"<tr><th>Address:</th><td>"+user.getAddress()+"</td></tr>"
      +"<tr><th>City</th><td>"+user.getCity()+"</td></tr>"
      +"<tr><th>E-mail:</th><td>"+user.getEmail()+"</td></tr>"
      +"<tr><th>Mobile:</th><td>"+user.getMobile()+"</td></tr>"
      +"<tr><td><input type='button' value='Remove User' id='dltuser' onclick='dltuser()' ></td></tr>"        
      +"</table>");
      
      out.println(displayBlock);
  }
  %>