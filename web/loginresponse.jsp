<%-- 
    Document   : loginresponse
    Created on : 21 Dec, 2019, 7:22:18 PM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String userid=(String)request.getAttribute("userid");
  String result=(String)request.getAttribute("result");
  if(userid!=null && result!=null) {
      HttpSession sess=request.getSession();
      sess.setAttribute("userid",userid);
      if(result.equalsIgnoreCase("Admin")) {
          String url="AdminControllerServlet;jsessionid="+session.getId();
          out.println(url);
      }
      else {
          String url="VotingOptionsControllerServlet;jsessionid="+session.getId();
          out.println(url);
      }
  }
  else {
      out.println("error");
  }
  

%>