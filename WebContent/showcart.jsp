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
        	 
         out.println("********************************<br>");
         
         out.println( URLDecoder.decode(cookie.getValue(), "utf-8")+"用户:"  +"欢迎您使用本系统 <br>");
         
         out.println("********************************");
         }
      }
  }else{
      out.println("<h2>没有发现 Cookie</h2>");
  }
%>
		   	<div>
		   		<table >
		   		<tr style="background-color:#b6aeae;"><th>商品编号</th><th>商品名称</th><th>商品单价</th><th>商品数量</th><th>商品金额</th></tr>
		   		<% double total=0;  pageContext.setAttribute("total",total);
		   		%>
		   		<c:forEach var="food"  items="${sessionScope.cart}"  >
		   		<tr>
		   		<td>${food.key }</td>
		   		<td>${food.value.foodInfo.foodName }</td>
		   		<td>${food.value.foodInfo.foodPrice }</td>
		   		<td>${food.value.count }</td>
		   		<td>${food.value.foodInfo.foodPrice * food.value.count }</td>
		   		</tr>
		   		</c:forEach>
		   		
		   		<%	HashMap map=(HashMap)session.getAttribute("cart"); 
		   		 if(map!=null){
   					Set keys=map.keySet(); 
   					Object[] kes = keys.toArray(); 
   					for(int i=0;i<keys.size();i++)
			   			{
				   			Item item=(Item)map.get(kes[i]);
				   			total=total+item.getFoodInfo().getFoodPrice()*item.getCount();
				   		 	pageContext.setAttribute("total",total);
			   			}
   					}  
		   		%>
		   		 
		   		<tr style="background-color:#b6aeae;"><td>合计：</td><td>~</td><td>~</td><td>~</td>
		   			<td>${pageScope.total }</td>
		   			</tr>
		   		
		   		</table>
		   		<div style="border:1px solid green; padding-top:20px; width:200px; height:50px;">
		   			<input type="button" value="继续添加购物车" onclick="shoping()" />
		   			<script type="text/javascript">
						   function shoping()
						   {
						   	window.location="/buyEat/foodinfoservlet?op=login";
						   }
					</script>
		   			<input type="button" value="确认订单结账" style="margin-left:20px;" onclick="endmoney()" />
		   			<script type="text/javascript">
						   function endmoney()
						   {
						   	window.location="/buyEat/endmoney.jsp?total=${pageScope.total }";
						   }
					</script>
		   		</div>
		   	</div>
		   	
		   	
		   </div>
	   </div>
	   <div>
	   <%@ include file="bottom.jsp" %>
	   </div>
   </div>
  </body>
</html>
