package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("用get方式请求servlet");// 控制台打印输出
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=utf-8;");
        response.setCharacterEncoding("UTF-8");
        out.println("<strong>get 的 servlet</strong><hr>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("用post方式请求servlet");//控制台打印输出
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        out.println("<strong>postservlet</strong><hr>");
    }

}
