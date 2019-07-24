package com.sxdx.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxdx.dao.FoodInfoDAO;
import com.sxdx.dao.FoodOrderInfoDAO;
import com.sxdx.vo.FoodInfo;
import com.sxdx.vo.FoodOrderInfo;

public class FoodInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FoodInfoServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		FoodInfoDAO foodDAO = new FoodInfoDAO();
		String op=request.getParameter("op");
		if(op.equals("reg"))
		{
			String customerName=request.getParameter("customerName") ;
			String address=request.getParameter("address");
			 String telephone=request.getParameter("telephone");
			 double totalPrice=Double.parseDouble(request.getParameter("totalPrice"));
			 String state="pending";
			 FoodOrderInfo foodOrderinfo=new FoodOrderInfo(customerName,  address,
						 telephone,  totalPrice, state);
			 FoodOrderInfoDAO forDAO =new FoodOrderInfoDAO();
			 if(forDAO.regUserInfo(foodOrderinfo))
			 {
				 request.getRequestDispatcher("/AddorderServlet").forward(request, response);
			 }else
			 {
				 request.setAttribute("fail", "Ê§°Ü");
				 request.getRequestDispatcher("/end.jsp").forward(request, response);
			 }
		}
		if(op.equals("details"))
		{
			String foodid=request.getParameter("foodid");
			FoodInfo food= foodDAO.selectFoodById(foodid);
			request.setAttribute("food", food);
			request.getRequestDispatcher("/fooddetails.jsp").forward(request, response);
		}
		if(op.equals("login"))
		{
			ArrayList<FoodInfo> foodlist = foodDAO.selectAllFood();
			request.setAttribute("foodlist", foodlist);
			request.getRequestDispatcher("/showfood.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
