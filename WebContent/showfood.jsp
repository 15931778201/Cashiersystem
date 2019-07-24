<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'showfood.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#fooder{width:100%;height:100%;list-style-type:none;}
		#fooder li{width:250px; height:175px; margin-top:2px;margin-right:25px; float:left;position:relative;}
		#fooder li div{ height:160px; margin:0px 0px;float:left;}
		.imagecss{width:90px; height:100px;}
		.info{width:150px;text-align: left; padding-left:10px;position:relative;}
	</style>
  </head>
  
  <body style="width:760px; height:700px; text-align: center;">
   <%-- 截取食物描述信息字符串 --%>
   <%! public String subDescription(String description)
   		{
   			return description.length()>18?description.substring(0,18)+"...":description;
   		}

    %>
    <div style="width:760px; height:600px;  align="center">
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
		   	<a href="/buyEat/showcart.jsp" Style="display: block; width:90px; height:30px; float:right;">
		   	<img src="images/lcart_cn.gif" style="border:none;" /></a>
		   	</div>
		   	<%-- 食物信息 --%>
		   	<div>
			   	<ul id="fooder" style="  margin-left:10px;">
			   		<c:forEach var="food" items="${requestScope.foodlist}">
			   		<li>
			   		<div class="imagecss">
			   		<img src="images/${food.foodImage }" width="90" height="110" /><br/><br/>
			   		编号：${food.foodID }
			   		</div>
			   		<div class="info">
			   			<span style="font-weight:bold;">${food.foodName }</span><br/>
			   			<span style="color:red; font-size:12px;">现价：人民币${food.foodPrice }元</span><br/>
			   			<span style="font-size:12px;">
			   				${food.description }
			   			</span><br/><br/><br/>
			   			<a href="/buyEat/foodinfoservlet?op=details&foodid=${food.foodID }" style="position:absolute;bottom:10px;">
			   			<img style="border:none;" src="images/detail_cn.gif" /></a>
			   		</div>
			   		</li>
			   		</c:forEach>
			   	</ul>
		   	</div>
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>
  </body>
</html>
