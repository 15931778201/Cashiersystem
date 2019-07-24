package com.sxdx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderInfoDAO {
	public boolean insertorder(String username,String foodname,int count) {
		Connection conn=null;
		PreparedStatement ps=null;
		int rs=0;
		boolean flag=false;
		try {
		conn=BaseDAO.getConn();
		ps=conn.prepareStatement( "insert into orderInfo (loginName,foodName,foodcount) values(?,?,?)");
		ps.setString(1, username);
		ps.setString(2, foodname);
		ps.setInt(3, count);
		rs = ps.executeUpdate();
		if(rs==1)
		{
			flag=true;
		}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}
}
