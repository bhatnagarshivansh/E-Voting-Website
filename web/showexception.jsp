<%-- 
    Document   : showexception.jsp
    Created on : 20 Dec, 2019, 11:12:55 AM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <title>Show Exception Page</title>
    </head>
    <body>
        <br>
        <div class="candidate">VOTE FOR CHANGE</div>
        <br>
        <div class="subcandidate">Please Try Again Later</div>
        <%  
              Exception ex=(Exception) request.getAttribute("exception");
              System.out.println(ex);
              out.println(ex);
        %>
    </body>
</html>
