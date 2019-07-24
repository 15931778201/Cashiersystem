package com.sxdx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sxdx.vo.FoodInfo;

public class FoodInfoDAO {
	//根据编号查询食物信息
	public FoodInfo selectFoodById(String foodid)
	{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		FoodInfo food=null;
		try
		{
			conn=BaseDAO.getConn();
			ps=conn.prepareStatement("select * from foodInfo where foodID="+foodid+"");
			//ps.setString(1, foodid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				food=new FoodInfo();
				food.setFoodID(rs.getString(1));
				food.setFoodName(rs.getString(2));
				food.setRemark(rs.getString(3));
				food.setFoodPrice(rs.getDouble(4));
				food.setDescription(rs.getString(5));
				food.setFoodImage(rs.getString(6));
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			BaseDAO.closeAll(conn, ps, rs);
		}
		return food;
	}
	//查询所有食物信息
	public ArrayList<FoodInfo> selectAllFood()
	{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<FoodInfo> foodlist=new ArrayList<FoodInfo>();
		try
		{
			conn=BaseDAO.getConn();
			ps=conn.prepareStatement("select * from foodinfo");
			rs=ps.executeQuery();
			while(rs.next())
			{
				FoodInfo food=new FoodInfo();
				food.setFoodID(rs.getString(1));
				food.setFoodName(rs.getString(2));
				food.setRemark(rs.getString(3));
				food.setFoodPrice(rs.getDouble(4));
				food.setDescription(rs.getString(5));
				food.setFoodImage(rs.getString(6));
				foodlist.add(food);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			BaseDAO.closeAll(conn, ps, rs);
		}
		return foodlist;
	}
}
