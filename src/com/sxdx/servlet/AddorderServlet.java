package com.sxdx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sxdx.dao.OrderInfoDAO;

import com.sxdx.vo.Item;

public class AddorderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddorderServlet() {
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
        	 username=URLDecoder.decode(cookie.getValue(),"utf-8");
         }
      }
		HttpSession session=request.getSession();
		HashMap<String,Item> map=(HashMap<String,Item>)session.getAttribute("cart");
		int a=0,b=0;
		for (String foodid : map.keySet()) {
		      Item item=map.get(foodid);
		      String foodname=item.getFoodInfo().getFoodName();
		      int count=item.getCount();
			  OrderInfoDAO orderDAO=new OrderInfoDAO();
			  boolean flag=orderDAO.insertorder(username, foodname, count);
			  if(flag)
				  b++;
			  a++;
		   }
		if(a==b)
		{
			request.getRequestDispatcher("/end.jsp").forward(request,response);
		}else
		{
			request.setAttribute("fail", "失败");
			request.getRequestDispatcher("/end.jsp").forward(request, response);
		}
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