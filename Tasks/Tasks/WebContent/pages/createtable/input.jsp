<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>输入行列等信息</title>
</head>
<body>
	<form action="showtable.jsp" method="post">
		<table>
		<tr><td>行数：</td>
			<td><input type="text" name="n"/> </td>
		</tr>
		<tr><td>列数：</td>
			<td><input type="text" name="m"/> </td>
		</tr>
		<tr><td>显示行间隔色：</td>
			<td><input type="radio" name="differ" value="0">否</input>
			<input type="radio" name="differ" value="1" checked="checked">是</input></td>
		</tr>
		<tr><td>显示列间隔色：</td>
			<td><input type="radio" name="differ1" value="0" checked="checked">否</input>
			<input type="radio" name="differ1" value="1">是</input></td>
		</tr>
		<tr><td>边界宽度：</td>
			<td><input type="text" name="width"/> </td>
		</tr>
		<tr>
			<td>合并起点：</td>
			<td>
				x1:<input style="background-color: gray;" type="text" name="x1"/>
				y1:<input style="background-color: gray;" type="text" name="y1"/>
			</td>
		</tr>
		<tr>
			<td>合并终点：</td>
			<td>
				x2:<input style="background-color: pink;" type="text" name="x2"/>
				y2:<input style="background-color: pink;" type="text" name="y2"/>
			</td>
		</tr>
		
		<tr><td colspan="2"><button type="submit">提交</button></td></tr>
		</table>
	
	</form>
</body>
</html>