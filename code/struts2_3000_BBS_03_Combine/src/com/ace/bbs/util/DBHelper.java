package com.ace.bbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper
{
	public static Connection getConnection()
	{
		Connection conn = null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager
					.getConnection("jdbc:mysql://localhost:3306/bbs?user=root&password=1111");
		}
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}

		return conn;
	}

	public static PreparedStatement preparedStatement(Connection conn,
			String sql)
	{
		PreparedStatement p = null;

		try
		{
			p = conn.prepareStatement(sql);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return p;
	}

	public static void close(Connection conn)
	{

		try
		{
			conn.close();
			conn = null;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt)
	{
		try
		{
			stmt.close();
			stmt = null;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs)
	{
		try
		{
			rs.close();
			rs = null;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
