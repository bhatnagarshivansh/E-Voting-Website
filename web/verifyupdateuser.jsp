<%-- 
    Document   : verifyupdateuser
    Created on : 13 Jan, 2020, 5:00:42 PM
    Author     : Shivansh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
  String userid = (String)session.getAttribute("userid");
  if(userid==null)
  {  response.sendRedirect("accessdenied.html");
  return;
  }
  boolean result = (boolean)request.getAttribute("result");
  if(result) 
      out.println("SUCCESS");
  else 
      out.println("ERROR");

%>