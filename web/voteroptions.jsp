<%-- 
    Document   : voteroptions
    Created on : 3 Jan, 2020, 9:43:03 PM
    Author     : Shivansh
--%>
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
        <link href="stylesheet/logo.css" rel="stylesheet">
        <title>Voter Options</title>
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
        "<div class='subcandidate'>Voter Options Page</div><br><br>"+
                    "<div class='logout'><a href='login.html'>logout</a></div></div>");
            displayBlock.append("<div class='container'>");
            displayBlock.append("<div id='dv1' onclick='seecandidate()'><img src='images/show.png' height='300px' width='300px'><br><h3>See Candidate</h3></div>");
            displayBlock.append("<div id='dv2' onclick='redirectcastvotepage()'><img src='images/vote2.webp' height='300px' width='300px'><br><h3>Cast Vote</h3></div>");
            displayBlock.append("<div id='dv2' onclick='redirectseevotepage()'><img src='images/votingimage.jpg' height='300px' width='300px'><br><h3>See Vote</h3></div>");
            displayBlock.append("<div id='dv2' onclick='updateprofile()'><img src='images/update1.jpg' height='300px' width='300px'><br><h3>Update Profile</h3></div>");
            
            displayBlock.append("</div>");
            displayBlock.append("<br><br><div align='center' id='result2'></div>");
            
            out.println(displayBlock);
            %>
    </body>
</html>
