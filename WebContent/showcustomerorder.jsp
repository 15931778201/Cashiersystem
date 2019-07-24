<%@ page language="java" import="java.util.*,com.sxdx.vo.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'showcart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	table,tr,th,td{border:none;}
	th,td{width:100px;text-align:center;}
	</style>
	
  </head>
  
  <body style="width:760px; height:700px; text-align: center;">

    <div style="width:760px; height:600px; text-align:center; ">
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
		   <div style="width:600px; height:200px;float:right;">
		   	<div style="height:30px; background-color:#AAB9BD">
		   	<a href="" Style="display: block; width:90px; height:30px; float:right;"><img src="images/lcart_cn.gif" style="border:none;" /></a>
		   	</div>
<% 

  		ArrayList<FoodOrderInfo> orderlist = (ArrayList<FoodOrderInfo>)request.getAttribute("order");

  	%>

  	<!-- 声明一个表格,这是表头 -->

  	<h2 align = "center">订单列表</h2>

  	<table bgcolor="9999dd" border="1" align = "center">

  		<tr>

  			<td>顾客姓名</td>

  			<td>送餐地址</td>

  			<td>电话</td>

  			<td>订单价格</td>
  			
  			<td>订单状态</td>

  		</tr>

  		<!-- 继续使用jsp语句 循环放入存放于list中的Book实体类中的数据 -->

  		<%
  			for(int i = 0;i<orderlist.size();i++){

  				FoodOrderInfo order =orderlist.get(i);%>

  				<tr>

  				<th><%=order.getCustomerName()  %></th>

  				<th><%=order.getAddress()  %></th>

  				<th><%=order.getTelephone()%></th>

  				<th><%=order.getTotalPrice()%></th>
  				
  				<th><%=order.getstate()%></th>
  				<br>

  		<% }
  		 %>
  		 </table>
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>
  </body>
</html>
