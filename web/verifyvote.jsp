<%-- 
    Document   : verifyvote
    Created on : 28 Dec, 2019, 7:15:45 PM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid=(String) session.getAttribute("userid");
    boolean result=(boolean) request.getAttribute("result");
    if(userid!=null && result==true) 
        out.println("success");
    else
        out.println("failed");

%>