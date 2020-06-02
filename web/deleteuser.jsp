<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="evoting.dao.UserDAO"%>
<%@page import="evoting.dto.DeleteUser"%>
<%@page import="java.util.ArrayList"%>
<%
    String userid=(String) session.getAttribute("userid");
  if(userid==null) {
      response.sendRedirect("accessdenied.html");
      return;
  }
  System.out.println("Inside delete user jsp");
  String result=(String) request.getAttribute("result");
  StringBuffer displayBlock=new StringBuffer("");
  if(result.equals("userList")) {
      ArrayList<String> userIdList=(ArrayList) request.getAttribute("userId");
      for(String c:userIdList) {
          displayBlock.append("<option value='"+c+"'>"+c+"</option>");
          
      }
      out.println(displayBlock);
  }
  else if(result.equals("details")) {
      DeleteUser user=(DeleteUser) request.getAttribute("user");
      
       displayBlock.append("<table>"
      +"<tr><th>Username:</th><td>"+user.getUsername()+"</td></tr>"
      +"<tr><th>Email:</th><td>"+user.getEmail()+"</td></tr>"
      +"<tr><th>Mobile</th><td>"+user.getMobile()+"</td></tr>"
      +"<tr><th>Address</th><td>"+user.getAddress()+"</td></tr>"
      +"<tr><th>City</th><td>"+user.getCity()+"</td></tr>"
      +"<tr><td><input type='button' value='Delete User' id='dltmsg' onclick='dltuser()' ></td></tr>"        
      +"</table>");
      
      out.println(displayBlock);
  }
%>