package com.sxdx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.Cookie;


public class UserInfoDAO {
	//验证用户是否成功登录
	public int checkLogin(String username,String userpass)
	{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		try
		{
			conn=BaseDAO.getConn();
			ps=conn.prepareStatement("select * from userinfo where loginname=? and loginpass=?");
			ps.setString(1, username);
			ps.setString(2, userpass);
			rs=ps.executeQuery();
			if(rs.next())
			{
				String str1="customer";
				String str2="business";
				if(str1.equals(rs.getString("Permission")))
				result=1;
				else if(str2.equals(rs.getString("Permission")))
				result=2;
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			BaseDAO.closeAll(conn, ps, rs);
		}
		return result;
	}
	public boolean insertUser(String username,String userpass) {
		Connection conn=null;
		PreparedStatement ps=null;
		int rs=0;
		boolean flag=false;
		try {
		conn=BaseDAO.getConn();
		ps=conn.prepareStatement( "insert into userInfo (loginName,loginPass,Permission) values(?,?,?)");
		ps.setString(1, username);
		ps.setString(2, userpass);
		ps.setString(3, "customer");
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
