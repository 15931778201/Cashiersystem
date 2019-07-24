<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'fooddetails.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="width:760px;  text-align: center;">

   <div style="width:760px;  align="center">
	   <div style="height:141px;">
	   	<%@ include file="top.jsp" %>
	   </div>
	   <div id="centent" style="width:760px; position:relative;">
		   <div style=" width:160px; height:240px; position:absolute; left:0px;top:0px; float:left;">
		   <%@ include file="left.jsp" %>
		   </div>
		   <div style="width:600px;height:111px;float:right;">
		   <%@ include file="right_top.jsp" %>
		   </div>
		   <div style="width:600px; height:400px;float:right;">
		   	<div style="height:20px; background-color:#AAB9BD">
		   	邬必芬在线点餐系统餐品详细信息
		   	</div>
		   	<div style="height:150px;font-size:12px;text-align:left; padding-left:20px;padding-top:20px;">
		   		<div style="float:left; width:100px; height:150px;">
		   		<img src="images/${requestScope.food.foodImage }"  width="100" height="110"/>
		   		<br/>编号：${requestScope.food.foodID }
		   		</div>
		   		<div style="margin-left:10px;float:left; width:120px; height:150px;position:relative;">
		   		<span style="font-weight:bold;">${requestScope.food.foodName }</span><br/>
		   		<span>原价：<img src="images/old.png"/></span><br/>
		   		<span style="color:red;">现价：人民币${requestScope.food.foodPrice }元</span><br/>
		   		<span>${requestScope.food.description }</span><br/>
		   		<a href="/buyEat/addcarservlet?foodid=${requestScope.food.foodID }" style="position:absolute;bottom:10px;">
		   		<img src="images/buy_cn.gif" style="border:none;" /></a>
		   		</div>
		   	</div>
		   	<br/>
		   	<div>
		   	<h2>详细资料</h2>
		   	<hr></hr>
		   	<img src="images/${requestScope.food.foodImage }"  width="200" height="200"/>
		   	</div>
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>
 
  </body>
</html>
