<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 数据库入门--引包 -->
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.yh.util.*" %>
<%@ include file="head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DBUtil dbUtil = new DBUtil();
	String tableName = "city";
	Connection connection = new DBUtil().getConnection();
	Statement statement = connection.createStatement();
	String sql = "SELECT * FROM " + tableName;
	ResultSet rs = statement.executeQuery(sql);
	rs.next();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库入门</title>
</head>
<body>
	<table border="1px" cellspacing="0px">
		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>ContryCode</td>
			<td>District</td>
			<td>Population</td>
		</tr>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getInt(5)%></td>
		</tr>

	</table>
	<%
		rs.close();
		statement.close();
		connection.close();
	%>
</body>
</html>