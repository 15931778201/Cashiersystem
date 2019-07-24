package com.sxdx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.Cookie;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxdx.dao.UserInfoDAO;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		String username=request.getParameter("username");
		String userpass=request.getParameter("userpass");
		UserInfoDAO userDAO=new UserInfoDAO();
		int result=userDAO.checkLogin(username, userpass);
		if(result!=0)
		{
			 Cookie cookie_username = new Cookie("username", java.net.URLEncoder.encode(username, "utf-8"));
		     cookie_username.setMaxAge(60*60);
		     cookie_username.setPath("/");
		     response.addCookie(cookie_username);
		if(result==1)
		{
			request.getRequestDispatcher("/foodinfoservlet").forward(request,response);
		}
		if(result==2)
		{
			response.sendRedirect("guanli.jsp");
		}
		}
		else
		{
			 PrintWriter out = response.getWriter();
			 out.print("<script>" + "alert('ƒ˙ ‰»Îµƒ’À∫≈√‹¬Î”–ŒÛ');"+ "document.location.href='index.jsp';"+"</script>");
			 out.close();
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
