package com.yh.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yh.util.DBUtil;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/addServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		// 获得浏览器传递过来的参数
		String name = request.getParameter("name").trim();
		String countryCode = request.getParameter("countryCode").trim();
		String district = request.getParameter("district").trim();
		int population = Integer
				.parseInt(request.getParameter("population"));
		// 获得数据库连接，执行修改操作
		DBUtil dbUtil = new DBUtil();
		String tableName = "mycity";
		Connection conn = dbUtil.getConnection();
		String sql = "insert into " + tableName
				+ " (name, countryCode, district, population ) values (?, ?, ?, ?)";
		PreparedStatement pst = null;

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, countryCode);
			pst.setString(3, district);
			pst.setInt(4, population);
			pst.executeUpdate();
			response.sendRedirect(
					"/Tasks/pages/dataopertion/list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

}
