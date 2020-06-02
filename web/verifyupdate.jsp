<%-- 
    Document   : verifyupdate
    Created on : 12 Jan, 2020, 10:41:24 PM
    Author     : Shivansh
--%>

<%
  String userid = (String)session.getAttribute("userid");
  if(userid==null)
  {  response.sendRedirect("accessdenied.html");
  return;
  }
  boolean result = (boolean)request.getAttribute("result");
  if(result) out.println("SUCCESS");
  else out.println("ERROR");

%>