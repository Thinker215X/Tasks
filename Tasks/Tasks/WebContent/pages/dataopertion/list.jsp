<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.yh.util.*"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DBUtil dbUtil = new DBUtil();
	String tableName = "mycity";
	dbUtil.setTableName(tableName);
	Connection connection = new DBUtil().getConnection();
	Statement statement = connection.createStatement();

	ResultSet rs = statement.executeQuery("select count(id) from " + tableName);
	rs.next();
	int len = 5;//分页工具栏一次显示的页码数
	int pageSize = 5;//定义每页记录数
	int rowCount = rs.getInt(1);//获得总记录数
	int pageCount = (rowCount - 1) / pageSize + 1;//计算总页数
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		int temp = Integer.parseInt(request.getParameter("currentPage"));
		//防止当前页码超出正确范围（1--pageCount）
		if (temp > 1) {
			currentPage = temp;
		}
		if (temp > pageCount) {
			currentPage = pageCount;
		}
	}
	String sql = "SELECT * FROM " + tableName + " limit " + (currentPage - 1) * pageSize + " , " + pageSize;//分页查询的sql语句
	rs = statement.executeQuery(sql);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Tasks/js/jquery.js"></script>
<title>数据库数据分页显示与操作</title>
<script type="text/javascript">
	$(function(){
		$("#del").click(function(){
			var checkBox = $(":checkbox");
			var idList =  "";
			$(checkBox).each(function(){
				if ($(this).attr("checked")){
					idList += $(this).val() + ",";
				}
			});
			if (idList == "") {
				return;
			}
			if (confirmDel()){
				$.post("/Tasks/deleteServlet", {idList : idList}, function(){
					window.location.reload();
				});
			}
		});
	});
	
	function confirmDel() {
		if (confirm("此操作不可恢复，您确定要删除吗？")) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<table border="1px" cellspacing="0px" style="text-align: center;">
		<tr>
			<td><input type="button" value="del" id="del" /></td>
			<td>ID</td>
			<td>Name</td>
			<td>ContryCode</td>
			<td>District</td>
			<td>Population</td>
			<td>Delete</td>
			<td>Update</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><input type="checkbox" value="<%=rs.getInt(1)%>"/></td>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getInt(5)%></td>
			<td><a href="/Tasks/deleteServlet.do?idList=<%=rs.getInt(1)%>"
				onclick="return confirmDel()">delete</a></td>
			<td><a href="update.jsp?id=<%=rs.getInt(1)%>">update</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		int startPage = ((currentPage - 1) / pageSize)
				* pageSize;
		for (int i = 1; i <= len; i++) {
			if (startPage + i > pageCount)
				break;
	%>
	<a href="list.jsp?currentPage=<%=startPage + i%>"><%=startPage + i%></a>

	<%
		}
	%>
	<a href="add.jsp">添加数据</a>
	<br />
	<br />
	<%
		if (currentPage != 1) {
	%>

	<a href="list.jsp?currentPage=<%=currentPage - len%>"><<</a>
	<a href="list.jsp?currentPage=<%=currentPage - 1%>">上一页</a>
	<%
		}
	%>
	<%
		if (currentPage != pageCount) {
	%>
	<a href="list.jsp?currentPage=<%=currentPage + 1%>">下一页</a>
	<a href="list.jsp?currentPage=<%=currentPage + len%>">>></a>
	<%
		}
	%>
	当前第<%=currentPage%>页/共<%=pageCount%>页/共<%=rowCount%>条数据
	<%
		rs.close();
		statement.close();
		connection.close();
	%>
</body>
</html>