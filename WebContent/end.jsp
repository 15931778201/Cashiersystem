<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'end.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="width:760px; height:700px; text-align: center;">
  <% 
  if(request.getParameter("total")!=null){
  double moneys=Double.parseDouble(request.getParameter("total")) ; 
  }
  if(request.getParameter("total")==null)
  {
  	 double moneys=0;
  }
  %>

    <div style="width:760px; height:600px; text-align:center; ">
	   <div style="height:141px;">
	   	<%@ include file="top.jsp" %>
	   </div>
	   <div id="centent" style="width:760px; height:350px;  position:relative;">
		   <div style=" width:160px; height:240px; position:absolute; left:0px;top:0px; float:left;">
		   <%@ include file="left.jsp" %>
		   </div>
		   <div style="width:600px;height:111px;float:right;">
		   <%@ include file="right_top.jsp" %>
		   </div>
		   <div style="width:600px; height:200px;float:right;">
		   	<div style="height:20px; background-color:#AAB9BD">
		   	邬必芬在线点餐系统欢迎您的再次光临
		   	</div>
		   	<c:if test="${requestScope.fail==null}">
		   	<h2 style="text-align:center;">感谢您的惠顾祝您</h2>
		   	<h2  style="text-align:center;">用餐愉快</h2>
		   	<a href = "orderServlet">查看订单状态</a>
		   	</c:if>
		   	<c:if test="${requestScope.fail!=null}">
		   	<h1>${requestScope.fail}</h1>
		   	</c:if>
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>

  </body>
</html>
