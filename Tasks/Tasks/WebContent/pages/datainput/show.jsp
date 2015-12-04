<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="../head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");//设置请求域编码方式
	String id = new String("000000000000000000");
	if (request.getParameter("id") != null) {
		if (request.getParameter("id").length() != 18 || request.getParameter("id").equals("")) {
			out.print("<script>alert('请输入18位身份证号');location.href='input.jsp';</script>");
			return ;
		}
		id = request.getParameter("id");
	}
	String year = id.substring(6, 10);
	String [] sex = {"女", "男"};
	int date = Calendar.getInstance().get(Calendar.YEAR);//获取当前年份
	int age = date - Integer.parseInt(year);//计算年龄

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据录入--显示</title>
</head>
<body>
	<table>
		<tr>
			<td>姓名：</td>
			<td><%= request.getParameter("name")%></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><%= sex[(id.charAt(16) - 48) % 2] %></td>
		</tr>
		<tr>
			<td>出生日期：</td>
			<td>
			<% 
				out.print(year + "-" + id.substring(10, 12) + "-" + id.substring(12, 14)); 
			%>
			</td>
		</tr>
		<tr>
			<td>年龄：</td>
			<td><%= age %></td>
		</tr>
		<tr>
			<td>籍贯：</td>
			<td><%= request.getParameter("nativeplace")%></td>
		</tr>
		
	</table>
</body>
</html>