/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhaniarora
 */
public class addToCart1 extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addToCart1</title>");            
            out.println("</head>");
            out.println("<body>");
          int id=parseInt(request.getParameter("id"));
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/SUHANI","suhani","suhani");
                PreparedStatement stmt=con.prepareStatement("select * from cart where id=?");
                stmt.setInt(1,id);
                ResultSet rs=stmt.executeQuery();
                if(rs.next()){
                    int q=rs.getInt(2);
                    stmt=con.prepareStatement("update cart set quantity=? where id=?");
                    stmt.setInt(1,q+1);//1 specifies the first parameter in the query i.e. name
                    stmt.setInt(2,id);
                    int i=stmt.executeUpdate();
                }
                else{
                    stmt=con.prepareStatement("insert into cart values(?,1)");
                    stmt.setInt(1,id);
                    int i=stmt.executeUpdate();
                }
                con.close();
                response.sendRedirect("index.jsp");
            }
            catch(Exception e){
                System.out.println(e);
            }
            out.println("</body>");
            out.println("</html>");
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
