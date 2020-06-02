<%-- 
    Document   : showcastvote
    Created on : 5 Jan, 2020, 8:41:18 PM
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
        <title>manage candidate</title>
    </head>
    <body>
     <br>
       
        <%  
            System.out.println("In Show Cast vote");
               String userid=(String) session.getAttribute("userid");
                   if(userid==null) {
                        response.sendRedirect("accessdenied.html");
                        return;
                    }
               
                 out.println("<br><br><center><h3>Please Cast Vote First!!<br></h3></center");
        %>
    </body>
</html>