<%-- 
    Document   : adminactions
    Created on : 23 Dec, 2019, 10:07:19 AM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jsscript/adminoptions.js"></script>
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <title>Admin Actions</title>
    </head>
    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            out.println("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>"+
        "<div class='subcandidate'>Admin Actions Page</div><br><br>"+
                    "<div class='logout'><a href='login.html'>logout</a></div></div>"+"<div class='container'>"+
                    "<div id='dv1' onclick='manageuser()'><img src='images/muser.png' height='255px' width='250px'><br><h3>Manage Users</h3></div>"+
                    "<div id='dv2' onclick='managecandidate()'><img src='images/ManageCandLists.jpg' height='250px' width='250px'><br><h3>Manage Candidates</h3></div>"+
                    "<div id='dv2' onclick='electionresult()'><img src='images/resultgraph.jpg' height='250px' width='250px'><br><h3>Show Results</h3></div>"+
                    "<br><br><br><div align='center' id='result'></div>");
           
        %>
    </body>
</html>