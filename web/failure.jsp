<%-- 
    Document   : failure
    Created on : 24 Dec, 2019, 8:30:49 PM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String userid=(String)session.getAttribute("userid");
  if(userid==null) {
      response.sendRedirect("accessdenied.html");
      return;
  }
  out.println("failed");
%>