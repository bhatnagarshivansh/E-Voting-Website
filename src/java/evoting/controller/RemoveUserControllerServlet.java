/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.controller;

import evoting.dao.CandidateDAO;
import evoting.dao.UserDAO;
import evoting.dto.CandidateDetails;
import evoting.dto.DeleteUser;
import evoting.dto.ShowUserDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shivansh
 */
public class RemoveUserControllerServlet extends HttpServlet {

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
         RequestDispatcher rd=null;
            String data=(String) request.getParameter("data");
            String res=(String) request.getParameter("res");
            HttpSession session=request.getSession();
            String userid=(String) session.getAttribute("userid");
            System.out.println(data);
            System.out.println(res);
            if(userid==null) {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
                return;
            }
            System.out.println("IN remove user ");
            try {
                if(data!=null && data.equals("uid")) {
                    System.out.println("Inside if");
                    ArrayList<String> userId=UserDAO.getUserId();
                    request.setAttribute("userId",userId);
                    request.setAttribute("result","userList");
                    rd=request.getRequestDispatcher("deleteuser.jsp");
               
                }
                else {
                    if(res.equals("res")) {
              
                      
                        boolean ans=UserDAO.deleteUser(data);
                        if(ans)
                        {
                            UserDAO.delVoteAsDelUser(data);
                            boolean ans1 = UserDAO.delCandAsDelUser(data);
                            if(ans1)
                            {
                                String candidateid=UserDAO.getCandidateId(data);
                                System.out.println(candidateid);
                                if(candidateid!=null)
                                {
                                    UserDAO.delVoteByCid(candidateid);
                                }
                            }
                        }
                      
                        request.setAttribute("result","true");
                        
                        
                        rd=request.getRequestDispatcher("verifydelete.jsp");
                      
                    }
                    else {
                    DeleteUser user=UserDAO.getDetailsByUserId(data);
                    request.setAttribute("result","details");
                    request.setAttribute("user",user);
                    rd=request.getRequestDispatcher("deleteuser.jsp");
                    } 
                    
                }
                
                
                
            }
            catch(Exception ex) {
                request.setAttribute("exception", ex);
                rd=request.getRequestDispatcher("showexception.jsp");
                ex.printStackTrace();
            }
            finally {
                rd.forward(request, response);
            }
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
