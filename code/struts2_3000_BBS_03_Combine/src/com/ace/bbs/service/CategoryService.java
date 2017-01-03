package com.ace.bbs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ace.bbs.model.Category;
import com.ace.bbs.util.DBHelper;

public class CategoryService
{
	public void add(Category c)
	{
		Connection conn = DBHelper.getConnection();
		String sql = "insert into _category values(null, ?, ?)";
		PreparedStatement p = DBHelper.preparedStatement(conn, sql);
		
		try
		{
			p.setString(1, c.getName());
			p.setString(2, c.getDescription());
			p.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		DBHelper.close(p);
		DBHelper.close(conn);
		
	}
	
	public List<Category> list()
	{
		Connection conn = DBHelper.getConnection();
		String sql = "select * from _category";
		PreparedStatement p = DBHelper.preparedStatement(conn, sql);
		List<Category> categories = new ArrayList<Category>();
		
		ResultSet rs = null;
		try
		{
			rs = p.executeQuery();
			while(rs.next())
			{
				Category c = new Category();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setDescription(rs.getString(3));
				categories.add(c);
			}	
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		DBHelper.close(rs);
		DBHelper.close(conn);
			
		return categories;
	}
	
	public void update(Category c)
	{
		Connection conn = DBHelper.getConnection();
		String sql = "update _category set name = ?, description = ? where id = ?";
		PreparedStatement preparedStatement = DBHelper.preparedStatement(conn, sql);
		
		try
		{
			preparedStatement.setString(1, c.getName());
			preparedStatement.setString(2, c.getDescription());
			preparedStatement.setInt(3, c.getId());
			preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		DBHelper.close(preparedStatement);
		DBHelper.close(conn);
	}
	
	public void delete(Category c)
	{
		deleteById(c.getId());
	}
	
	public void deleteById(int id)
	{
		Connection conn = DBHelper.getConnection();
		String sql = "delete from _category where id = ?";
		PreparedStatement preparedStatement = DBHelper.preparedStatement(conn, sql);
		
		try
		{
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		DBHelper.close(preparedStatement);
		DBHelper.close(conn);
	}

	public Category loadById(int id)
	{
		Category c = null;
		Connection conn = DBHelper.getConnection();
		String sql = "select * from _category where id = ?";
		PreparedStatement p = DBHelper.preparedStatement(conn, sql);
		
		ResultSet rs = null;
		try
		{
			p.setInt(1, id);
			rs = p.executeQuery();
			if(rs.next())
			{
				c = new Category();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setDescription(rs.getString(3));
			}	
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		DBHelper.close(rs);
		DBHelper.close(conn);
		
		return c;
	}
}
