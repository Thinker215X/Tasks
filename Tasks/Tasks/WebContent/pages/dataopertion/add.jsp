<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加数据</title>
</head>
<body>
	<form action="/Tasks/addServlet" method="post">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>CountryCode:</td>
				<td><input type="text" name="countryCode" /></td>
			</tr>
			<tr>
				<td>District:</td>
				<td><input type="text" name="district" /></td>
			</tr>
			<tr>
				<td>Population:</td>
				<td><input type="text" name="population" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加" /></td>
			</tr>

		</table>
	</form>
</body>
</html>