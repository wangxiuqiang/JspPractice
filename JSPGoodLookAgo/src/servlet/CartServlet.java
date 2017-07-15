package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsDao;
import entity.Cart;
import entity.Items;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action;
	ItemsDao idao = new ItemsDao();

	public CartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;character= utf-8");
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("add")) {
				if(addToCart(request, response)){
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				}
				else{
					request.getRequestDispatcher("/failure.jsp").forward(request, response);
				}
			}
			if (action.equals("show")) {
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}
			if(action.equals("delete")){
				if(deleteFromCart(request,response)){
					request.getRequestDispatcher("/cart.jsp").forward(request, response);
				}
				else{
					request.getRequestDispatcher("/cart.jsp").forward(request, response);
				}
				
			}
		}
	}

	private boolean deleteFromCart(HttpServletRequest request, HttpServletResponse response)
	{
		String id = request.getParameter("id");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
	    Items item = idao.getItemsById(Integer.parseInt(id));
	    if(cart.removeGoodsFromCart(item))
	    {
	    	return true;
	    }
	    else
	    {
	    	return false;
	    }
	}
	public boolean addToCart(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String number = request.getParameter("num");
		Items item = idao.getItemsById(Integer.parseInt(id));
		if (request.getSession().getAttribute("cart") == null) {
			Cart cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart.addGoodsInCart(item, Integer.parseInt(number))) {
			return true;
		} else {
			return false;
		}
	}

}
