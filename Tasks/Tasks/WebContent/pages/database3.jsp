<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.yh.util.*"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DBUtil dbUtil = new DBUtil();
	String tableName = "city";
	Connection connection = new DBUtil().getConnection();
	Statement statement = connection.createStatement();
	String colum = " id ";
	String sort = " asc ";
	
	ResultSet rs = statement.executeQuery(
			"select count(id) from " + tableName);
	rs.next();
	int len = 5;//分页工具栏一次显示的页码数
	int pageSize = 5;//定义每页记录数
	int rowCount = rs.getInt(1);//获得总记录数
	int pageCount = (rowCount - 1) / pageSize + 1;//计算总页数
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		int temp = Integer.parseInt(request
				.getParameter("currentPage"));
		if (temp > 1) {
			currentPage = temp;
		}
		if (temp > pageCount) {
			currentPage = pageCount;
		}
	}
	
	
	
	
	if (request.getParameter("colum") != null) {
		colum = request.getParameter("colum");
	}
	if (request.getParameter("sort") != null) {
		sort = request.getParameter("sort").equals("1") ? " desc " : " asc ";
	}
	//获得每列的排序方式
	int h_v[] = new int[5];
	if (request.getParameter("sorts") != null) {
		String [] hv = request.getParameter("sorts").split(",");
		for(int i=0; i<h_v.length; i++) {
			h_v[i] = Integer.parseInt( hv[i].trim() );
		}
	} else {
		for(int i=0; i<h_v.length; i++) {
			h_v[i] = 0;
		}
	}
	//改变被点击列的排序方式
	if ("id".equals(colum.trim())) {
		h_v[0] = h_v[0] ^ 1;
	} else if ("name".equals(colum.trim())){
		h_v[1] = h_v[1] ^ 1;
	} else if ("countryCode".equals(colum.trim())){
		h_v[2] = h_v[2] ^ 1;
	} else if ("district".equals(colum.trim())){
		h_v[3] = h_v[3] ^ 1;
	} else if ("population".equals(colum.trim())){
		h_v[4] = h_v[4] ^ 1;
	}
	
	
	String sql = "select * from " + tableName + " order by " + colum + sort + " limit "
			+ (currentPage - 1) * pageSize + " , "
			+ pageSize; ;
	
	rs = statement.executeQuery(sql);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Tasks/js/jquery.js"></script>
<title>数据库数据排序</title>
<script type="text/javascript">
	$(function() {
		$("#id").click(abc);
		$("#name").click(abc);
		$("#countryCode").click(abc);
		$("#district").click(abc);
		$("#population").click(abc);
	});
	function abc() {
		var colum = $(this).attr("id");
		var h_id = "#h_" + colum;
		var sort = $(h_id).val();//获取该列排序方式
		//获取所有列的排序方式
		var sorts = "";
		$("input:hidden").each(function(){
			sorts += $(this).val() + ",";
		});
		var url = "database3.jsp?colum=" + colum + "&sort=" + sort + "&sorts=" + sorts;
		location.href = url;
	}
</script>


</head>
<body>
	<p style="color: green;">点击表头，按该列排序</p>
	<table border="1px" cellspacing="0px" style="text-align: center;">
		<tr>
			<td id="id">ID<input type="hidden"  id="h_id" value="<%= h_v[0]%>" /></td>
			<td id="name">Name<input type="hidden" id="h_name" value="<%= h_v[1]%>" /></td>
			<td id="countryCode">CountryCode<input type="hidden"
				id="h_countryCode" value="<%= h_v[2]%>" /></td>
			<td id="district">District<input type="hidden" id="h_district"
				value="<%= h_v[3]%>" /></td>
			<td id="population">Population<input type="hidden"
				id="h_population" value="<%= h_v[4]%>" /></td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getInt(5)%></td>
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
	<a href="database2.jsp?currentPage=<%=startPage + i%>"><%=startPage + i%></a>

	<%
		}
	%>
	<br />
	<br />
	<%
		if (currentPage != 1) {
	%>

	<a href="database2.jsp?currentPage=<%=currentPage - len%>"><<</a>
	<a href="database2.jsp?currentPage=<%=currentPage - 1%>">上一页</a>
	<%
		}
	%>
	<%
		if (currentPage != pageCount) {
	%>
	<a href="database2.jsp?currentPage=<%=currentPage + 1%>">下一页</a>
	<a href="database2.jsp?currentPage=<%=currentPage + len%>">>></a>
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