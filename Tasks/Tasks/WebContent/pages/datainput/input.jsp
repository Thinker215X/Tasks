<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据录入</title>
</head>
<body>
	<form action="show.jsp" method="post">
		<table>
		<tr>
			<td>姓名：</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>身份证号：</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>籍贯：</td>
			<td>
				<select name="nativeplace">
					<option value="北京" style="width: 50px;">北京</option>
					<option value="上海" style="width: 50px;">上海</option>
					<option value="天津" style="width: 50px;">天津</option>
					<option value="重庆" style="width: 50px;">重庆</option>
					<option value="四川" style="width: 50px;">四川</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="2">
			<input type="submit" value="submit"/>
		</td></tr>
		</table>
	</form>
</body>
</html>