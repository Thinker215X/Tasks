<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yh.model.City"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.yh.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DBUtil dbUtil = new DBUtil();
	String tableName = "mycity";
	dbUtil.setTableName(tableName);
	Connection connection = new DBUtil().getConnection();
	Statement statement = connection.createStatement();

	int id = Integer.parseInt(request.getParameter("id"));
	City city = null;
	String sql = "SELECT * FROM " + tableName
			+ " where id= " + id;
	ResultSet rs = statement.executeQuery(sql);
	while (rs.next()) {
		city = new City();
		city.setId(rs.getInt("id"));
		city.setName(rs.getString("name"));
		city.setCountryCode(
				rs.getString("countrycode"));
		city.setDistrict(rs.getString("district"));
		city.setPopulation(rs.getInt("population"));
	}
	if (city == null) {
		request.getRequestDispatcher(
				"/pages/dataopertion/list.jsp")
				.forward(request, response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改数据</title>
</head>
<body>
	<form action="/Tasks/updateServlet" method="post">
		<input type="hidden" name="id" value="<%=city.getId()%>" />
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" value="<%=city.getName()%>" /></td>
			</tr>
			<tr>
				<td>CountryCode:</td>
				<td><input type="text" name="countryCode"
					value="<%=city.getCountryCode()%>" /></td>
			</tr>
			<tr>
				<td>District:</td>
				<td><input type="text" name="district"
					value="<%=city.getDistrict()%>" /></td>
			</tr>
			<tr>
				<td>Population:</td>
				<td><input type="text" name="population"
					value="<%=city.getPopulation()%>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="修改" /></td>
			</tr>

		</table>
	</form>
	<%
		rs.close();
		statement.close();
		connection.close();
	%>
</body>
</html>