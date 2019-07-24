package com.sxdx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sxdx.dao.OrderInfoDAO;
import com.sxdx.dao.BaseDAO;
import com.sxdx.vo.FoodOrderInfo;


public class orderServlet extends HttpServlet{
	public orderServlet() {
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
		String username="";
		 Cookie cookie = null;
	        Cookie[] cookies = null;
	         // 获取cookies的数据,是一个数组
	        cookies = request.getCookies();
	        if( cookies != null ){
	        for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];
	         String str1="username";
	         if(str1.equals(cookie.getName()))
	         {
	              username=cookie.getValue();
	         }
	      }
	        }
		OrderInfoDAO orderDAO=new OrderInfoDAO();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean flag=false;
		conn=BaseDAO.getConn();
		try {
			ps=conn.prepareStatement( "select * from foodOrderInfo where customerName=?;");
			ps.setString(1, username);
			rs = ps.executeQuery();
			ArrayList<FoodOrderInfo> order =new ArrayList<FoodOrderInfo>();
			while(rs.next())
			{
				FoodOrderInfo order0=new FoodOrderInfo(rs.getString("customerName"),
						rs.getString("address"),rs.getString("telephone"),
						rs.getDouble("totalPrice"),rs.getString("state"));
				order.add(order0);
			}
			request.setAttribute("order",order);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("showcustomerorder.jsp").forward(request, response);
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
