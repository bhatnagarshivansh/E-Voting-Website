<%@page import="evoting.dto.CandidateDetails" %>
<%@page import="java.util.ArrayList" %>
<%
   String userid=(String)session.getAttribute("userid");
   if(userid==null){
     response.sendRedirect("accessdenied.html");
     return;
   }
    String result =(String)request.getAttribute("result");
    StringBuffer displayBlock = new StringBuffer("");
    if(result.equalsIgnoreCase("candidatelist")){
      ArrayList<String> candidateId=(ArrayList)request.getAttribute("candidateId");
       for(String c:candidateId)
       { displayBlock.append("<option value='"+c+"'>"+c+"</option>");}
       
       out.println(displayBlock); }
    else if(result.equalsIgnoreCase("details")){ 
    CandidateDetails candidate =(CandidateDetails)request.getAttribute("candidate");
    displayBlock.append(  "<form method='POST' enctype='multipart/form-data'id='fileUploadForm2'>"
                         +"<table>"
                         +"<tr><th> Candidate Id: </th><td><input type='text' id='cid' value='"+candidate.getCandidateId()+"'readonly></td></tr>"
                        +"<tr><th>User ID :</th><td><input type='text' id='uid' value='"+candidate.getUserid()+"'readonly></td></tr>"
                        +"<tr><th>Candidate Name :</th><td><input type='text' id='cname' value='"+candidate.getCandidateName()+"' ></td></tr>"
                        +"<tr><th>City :</th><td><input type='text' id='city' value='"+candidate.getCity()+"' ></td></tr>"
                         +"<tr><th>Party :</th><td><input type='text' id='party' value='"+candidate.getParty()+"'></td></tr>"
                          +"<tr><th>Symbol :</th><td id='image'>"+"<img src='data:image/jpg;base64,"+candidate.getSymbol()+"'"
                          +"style='width:300px;height:200px;'/></td></tr>"
                          +"<tr><td>Update Symbol :</td><td > <input type='file' name='files' id='updsymb' value='Select Image'></td></tr> "
                           +"<tr><th><input type='button' value='Update Candidate' onclick='updatecandidate()' id='updcnd'></th></tr></table></form>" );
          out.println(displayBlock);
    }


%>