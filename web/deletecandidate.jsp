<%-- 
    Document   : deletecandidate
    Created on : 31 Dec, 2019, 4:29:48 PM
    Author     : Shivansh
--%>

<%@page import="evoting.dao.CandidateDAO"%>
<%@page import="evoting.dto.CandidateDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String userid=(String) session.getAttribute("userid");
  if(userid==null) {
      response.sendRedirect("accessdenied.html");
      return;
  }
  String result=(String) request.getAttribute("result");
  StringBuffer displayBlock=new StringBuffer("");
  if(result.equals("candidateList")) {
      ArrayList<String> candidateId=(ArrayList) request.getAttribute("candidateId");
      for(String c:candidateId) {
          displayBlock.append("<option value='"+c+"'>"+c+"</option>");
          
      }
      out.println(displayBlock);
  }
  else if(result.equals("details")) {
      CandidateDetails candidate=(CandidateDetails) request.getAttribute("candidate");
      
       displayBlock.append("<table>"
      +"<tr><th>User Id:</th><td>"+candidate.getUserid()+"</td></tr>"
      +"<tr><th>Candidate Name:</th><td>"+candidate.getCandidateName()+"</td></tr>"
      +"<tr><th>City:</th><td>"+candidate.getCity()+"</td></tr>"
      +"<tr><th>Party</th><td>"+candidate.getParty()+"</td></tr>"
      +"<tr><th>Symbol:</th><td id='image'>"
      +"<img src='data:image/jpg;base64,"+candidate.getSymbol()+"'style='width:300px;height=200px;'/></td></tr>"
      +"<tr><td><input type='button' value='Delete Candidate' id='dltmsg' onclick='dltcand()' ></td></tr>"        
      +"</table>");
      
      out.println(displayBlock);
  }
%>