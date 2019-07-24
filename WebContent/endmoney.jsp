<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'endmoney.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	td{border:1px solid #999999; text-align:left}
	td input{width:250px;}
	</style>
  </head>
  
  <body style="width:760px; height:700px; text-align: center;">
  <% double moneys=Double.parseDouble(request.getParameter("total")) ; %>
   <%!String username=""; %>
    <div style="width:760px; height:600px;text-align:center; ">
	   <div style="height:141px;">
	   	<%@ include file="top.jsp" %>
	   </div>
	   <div id="centent" style="width:760px;  position:relative;">
		   <div style=" width:160px; height:240px; position:absolute; left:0px;top:0px; float:left;">
		   <%@ include file="left.jsp" %>
		   </div>
		   <div style="width:600px;height:111px;float:right;">
		   <%@ include file="right_top.jsp" %>
		   </div>

		    <%
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
  }else{
      out.println("<h2>没有发现 Cookie</h2>");
  }
%>
		   <div style="width:600px; height:200px;float:right;">
		   	<div style="height:20px; background-color:#AAB9BD">
		   	请确认配送和支付信息
		   	</div>
		   	<form action="/buyEat/foodinfoservlet?op=reg" method="post" style="border:1px solid red;">
		   		<table >
		   		<tr><td style="text-align:right;">顾客：</td><td><input type="text" name="customerName" value="<%=username %>"/></td></tr>
		   		<tr><td style="text-align:right;">顾客地址：</td><td><input type="text" name="address"/></td></tr>
		   		<tr><td style="text-align:right;">顾客电话：</td><td><input type="text" name="telephone"/></td></tr>
		   		<tr><td style="text-align:right;">总计：</td><td ><input type="text" name="totalPrice" value="<%=moneys %>" />元</td></tr>
		   		</table>
		   		<input type="submit"value="提交订单"/>
		   	</form>
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>

  </body>
</html>
