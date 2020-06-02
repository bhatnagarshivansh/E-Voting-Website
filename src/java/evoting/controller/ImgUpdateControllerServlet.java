/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.controller;

import evoting.dao.CandidateDAO;
import evoting.dto.UpdateCandidateDto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author Shivansh
 */
public class ImgUpdateControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("IMG UPDATE Servlet");
         RequestDispatcher rd= null;
       try{
       DiskFileItemFactory dif=new DiskFileItemFactory();
       ServletRequestContext srq = new ServletRequestContext(request);
       ServletFileUpload sfu = new ServletFileUpload(dif);
       List<FileItem> multiparts = sfu.parseRequest(srq);
       ArrayList<String> objValues = new ArrayList<>();
       InputStream fileContent=null;
       UpdateCandidateDto upd = new UpdateCandidateDto();
       for(FileItem item : multiparts){
         if(item.isFormField()){
         String fieldName = item.getFieldName();
         String fieldValue = item.getString();
             System.out.println(fieldName+" : "+fieldValue);
                 objValues.add(fieldValue);
         }
         else {
           String fieldName = item.getFieldName();
           String fileName = item.getName();
             System.out.println(fieldName+" : "+fileName);
             if(fileName==""){fileContent=null; }
             else   fileContent = item.getInputStream();
             System.out.println("content:"+fileContent);
             System.out.println(fileName);
                }
          }
           System.out.println(objValues);
           System.out.println("Ahead Tostring");
             upd.setCid(objValues.get(0));
              upd.setCity(objValues.get(4));
              upd.setCname(objValues.get(2));
              upd.setParty(objValues.get(3));
           
           if(fileContent==null) 
           {  System.out.println("NO FILE CHOOSEN");  
             boolean result = CandidateDAO.updateCandidate(upd, objValues.get(1));
              if(result)
              request.setAttribute("result", result);
           }
        
           else 
           {    System.out.println("File Choosen "+fileContent);
                 boolean result = CandidateDAO.updateCandidate(upd, objValues.get(1));
                  boolean result2 = CandidateDAO.updateSymbol(fileContent, objValues.get(0));
                  request.setAttribute("result", result&&result2);
                   
           }
             rd=request.getRequestDispatcher("verifyupdate.jsp");          
       }
       catch(Exception e){
        rd=request.getRequestDispatcher("showexception.jsp");
        e.printStackTrace();
       }
       finally {rd.forward(request, response); }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
