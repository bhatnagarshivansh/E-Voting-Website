<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jsscript/adminoptions.js"></script>
        
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <title>Manage Users</title>
    </head>
    <body>
        
        <%
             
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            StringBuffer displayBlock=new StringBuffer("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>"+
        "<div class='subcandidate'>Manage Users Page</div><br><br>"+
                    "<div class='logout'><a href='login.html'>logout</a></div></div>");
            displayBlock.append("<div class='container'>");
            displayBlock.append("<div id='dv1' onclick='showusers()'><img src='images/show.png' height='300px' width='300px'><br><h3>Show Users</h3></div>");
            displayBlock.append("<div id='dv2' onclick='removeuser()'><img src='images/update3.jpg' height='300px' width='300px'><br><h3>Remove Users</h3></div>");
            displayBlock.append("</div>");
            displayBlock.append("<br><br><div align='center' id='result'></div>");
//            displayBlock.append("<br><div align='center' id='addmsg'></div>");
            out.println(displayBlock);
            %>
    </body>
</html>
