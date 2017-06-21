package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             String name = request.getParameter("user");
             String passwd = request.getParameter("password");
             System.out.print(name);
             if(name.equals("admin") && passwd.equals("admin")){
                // response.sendRedirect(request.getContextPath()+"/success.jsp");
               request.getRequestDispatcher("../success.jsp").forward(request,response);
             }
             else{
               //  response.sendRedirect(request.getContextPath()+"/fauiler.jsp");
                 request.getRequestDispatcher("/fauiler.jsp").forward(request,response);
             }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
