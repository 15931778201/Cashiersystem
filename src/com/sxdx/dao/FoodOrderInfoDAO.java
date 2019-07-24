package com.sxdx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sxdx.vo.FoodOrderInfo;

public class FoodOrderInfoDAO {
	//ÌîÐ´¶©²ÍÐÅÏ¢
	public boolean regUserInfo(FoodOrderInfo foodOrderinfo)
	{
		Connection conn=null;
		PreparedStatement ps=null;
		boolean flag=false;
		try
		{
			conn=BaseDAO.getConn();
			ps=conn.prepareStatement("insert into foodOrderInfo (customerName,address,telephone,totalPrice,state) values(?,?,?,?,?);");
			ps.setString(1, foodOrderinfo.getCustomerName());
			ps.setString(2, foodOrderinfo.getAddress());
			ps.setString(3, foodOrderinfo.getTelephone());
			ps.setDouble(4, foodOrderinfo.getTotalPrice());
			ps.setString(5, "pending");
			int sult=ps.executeUpdate();
			if(sult>0)
			{
				flag=true;
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			BaseDAO.closeAll(conn, ps, null);
		}
		return flag;
	}
}
