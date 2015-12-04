package com.yh.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	//驱动程序名 
	private String driverName = "com.mysql.jdbc.Driver";
	//数据库用户名 
	private String userName = "root";
	//密码 
	private String userPasswd = "root";
	//数据库名 
	private String dbName = "world";
	//表名 
	private String tableName = "mycity";
	//联结字符串 
	private String url = "jdbc:mysql://localhost/" + dbName
			+ "?user=" + userName + "&password="
			+ userPasswd;
	
	private Connection connection = null;
	
	public Connection getConnection(){
		try {
			Class.forName(driverName);
			return connection = DriverManager.getConnection(url);
		} catch (ClassNotFoundException e) {
			System.out.println("驱动加载失败!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("数据库连接失败!");
			e.printStackTrace();
		}
		return null;
	}
	
	public void close() {
		if ( this.connection != null) {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	
}
