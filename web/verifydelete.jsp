<%-- 
    Document   : verifydelete
    Created on : 2 Jan, 2020, 7:02:49 PM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("in verify delete");
    String userid=(String) session.getAttribute("userid");
    String result=(String) request.getAttribute("result");
    if(userid!=null && result=="true") 
        out.println("success");
    else
        out.println("failed");

%>
