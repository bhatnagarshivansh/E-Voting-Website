<%-- 
    Document   : electionresult
    Created on : 29 Dec, 2019, 11:51:02 AM
    Author     : Shivansh
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="evoting.dto.CandidateDetails"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="evoting.dao.VoteDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="stylesheet/backgroundimage.css" type="text/css" rel="stylesheet">
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <title>Voting Result Response</title>
    </head>
    <body>
        <%
          String userid =(String) session.getAttribute("userid");
          System.out.println("Entered in election result");
          if(userid==null) {
              session.invalidate();
              response.sendRedirect("accessdenied.html");
              return;
          }
          StringBuffer displayBlock=new StringBuffer();
           
                    displayBlock.append("<div class='candidateprofile'>Election Result Page</div>");
                 
                    displayBlock.append("<table border='2px'><tr style='background-color:black'><th>Candidate Id</th><th>Candidate Name</th><th>Party</th><th>Symbol</th><th>Voting Count</th><th>Vote %</th></tr>");
                   
          String cid=VoteDao.getCandidateId(userid);
              System.out.println("Entered in validate vote");
          LinkedHashMap<CandidateDetails,Integer> hs=(LinkedHashMap)request.getAttribute("result");
          Integer votecount=(Integer) request.getAttribute("votecount");
          System.out.println(votecount);
         Set s=hs.entrySet();
            Iterator it=s.iterator();
                while(it.hasNext()) {
                    Map.Entry<CandidateDetails,Integer> e=(Map.Entry) it.next();
                    CandidateDetails cd=e.getKey();
                    int vc=e.getValue();
                    double voteper=(vc*100.0/votecount);
                    
                    if(e==s.iterator().next()) {
           displayBlock.append("<tr style='background-color:green'><td>"+cd.getCandidateId()+"</td><td>"+cd.getCandidateName()+"</td><td>"+cd.getParty()+"</td><td><img src='data:image/jpg;base64,"
                 +cd.getSymbol()+"' style='width:100px;height:100px;'/><br/></td><td>"+vc+"</td><td>"+voteper+"</td></tr>");
                    }  
                    else {
                        displayBlock.append("<tr style='background-color:red'><td>"+cd.getCandidateId()+"</td><td>"+cd.getCandidateName()+"</td><td>"+cd.getParty()+"</td><td><img src='data:image/jpg;base64,"
                 +cd.getSymbol()+"' style='width:100px;height:100px;'/><br/></td><td>"+vc+"</td><td>"+voteper+"</td></tr>");
                    }  
         }
                 displayBlock.append("</table>");
                 out.println(displayBlock);
            
        %>
       
    </body>
</html>