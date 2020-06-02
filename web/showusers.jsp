<%-- 
    Document   : showvoters
    Created on : 4 Jan, 2020, 5:37:16 PM
    Author     : Shivansh
--%>

<%@page import="java.util.Iterator"%>
<%@page import="evoting.dto.ShowUserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid=(String) session.getAttribute("userid");
    
    if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
     System.out.println("show Voters jsp");
     StringBuffer displayBlock=new StringBuffer();
     displayBlock.append("<table border='2px'><tr><th>User Id</th><th>Username</th><th>Address</th><th>City</th><th>Email</th><th><Mobile No/th></tr>");
     ArrayList<ShowUserDto> user=(ArrayList) request.getAttribute("ShowUsers");
//     ShowUserDto show=new ShowUserDto();
//     Iterator it=user.iterator();
//     while(it.hasNext()) {
//System.out.println(user);
        for(ShowUserDto c:user) {
//         show=(ShowUserDto)it.next();
//         System.out.println(c);
         displayBlock.append("<tr><th>"+c.getUserid()+"</th><th>"+c.getUsername()+"</th><th>"+c.getAddress()+"</th><th>"+c.getCity()+"</th><th>"+c.getEmail()+"</th><th>"+c.getMobile()+"</th></tr>");
     }
     
     out.println(displayBlock);
     
%>