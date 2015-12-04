<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int a = 0;
	int b = 0;
	if (request.getParameter("a") != null && request.getParameter("a") != "")
		a = Integer.parseInt( request.getParameter("a") );
	if (request.getParameter("b") != null && request.getParameter("b") != "")
		b = Integer.parseInt( request.getParameter("b") );
	int c = a * b * 100;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加法计算</title>
</head>
<body bgcolor="#<%=c%>">
	<div style="background-color: gray;">
	<% 
		out.print(a + " + " + b + "=");
		out.print(a + b);
		out.print("<br/>");
		out.print(a + " * " + b + "=");
		out.print(a * b);
	%>
	</div>
</body>
</html>