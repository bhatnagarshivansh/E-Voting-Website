<%-- 
    Document   : showallcandidates
    Created on : 12 Jan, 2020, 11:29:40 PM
    Author     : Shivansh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="evoting.dto.CandidateDto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="stylesheet/showcandidate.css" type="text/css" rel="stylesheet">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <script src="jsscript/vote.js"></script>
        <script src="jsscript/votingoptions.js"></script>
        <script src="jsscript/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <title>Show All Candidates Page</title>
    </head>
    <body>
        <%
          String userid=(String)session.getAttribute("userid");
    if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
          System.out.println("Showing All Candidates Jsp");
          StringBuffer displayBlock=new StringBuffer("");
          displayBlock.append("<table border='2px'><tr style='background-color:black'><th>Candidate Id</th><th>Candidate Name</th><th>Party</th><th>Symbol</th></tr>");
     
          ArrayList<CandidateDto> candidate=(ArrayList)request.getAttribute("candidateList");
          
          for(CandidateDto u:candidate)
          {
                  displayBlock.append("<tr style='background-color:green'><td>"+u.getCandidateId()+"</td><td>"+u.getCandidateName()+"</td><td>"+u.getParty()+"</td><td><img src='data:image/jpg;base64,"+u.getSymbol()+"' style='width:200px;height:200px;'/></td></tr>");           
          }
          displayBlock.append("</table>");
          out.println(displayBlock);
      %>
    </body>
</html>
