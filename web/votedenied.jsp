<%-- 
    Document   : votedenied
    Created on : 27 Dec, 2019, 8:06:41 PM
    Author     : Shivansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="evoting.dto.CandidateDto"%>
<html>
    <head>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vote Denied</title>
    </head>
    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            System.out.println("Vote Denied Jsp");
            if(userid==null)
            { 
                session.invalidate();
                response.sendRedirect("accessdenied.html");
                return;
            }
            CandidateDto candidate=(CandidateDto)request.getAttribute("candidate");
            StringBuffer displayBlock=new StringBuffer();
           
            displayBlock.append("<br/><br/><div class='candidateprofile'>You are voted For:</div>");
            displayBlock.append("<br/><div class='candidateprofile'><table align='center' style='color:white; font-size:25px;'><tr><td align='right'>Candidate Id:</td><td align='left'><strong>"
                 +candidate.getCandidateId()+"</strong></td></tr>"
                 +"<tr><td align='right'>Candidate Name:</td><td align='left'><strong>"+candidate.getCandidateName()+"</strong></td></tr>"
                 + "<tr><td align='right'> Party:</td><td align='left'><strong>"+candidate.getParty()+"</strong></td></tr></table></div>");
            displayBlock.append("<div class='candidateprofile' for='"+candidate.getCandidateId()+"'><br>Symbol:<br><br><img src='data:image/jpg;base64,"
                 +candidate.getSymbol()+"' style='width:200px;height:200px;'/></div>");
//            displayBlock.append("<div align='center'><h2 id='logout'><a href='login.html'>Logout</a></h2><div>");
            out.println(displayBlock);    
        %>
    </body>
</html>
