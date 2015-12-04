<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ page import="com.yh.util.MyJudge" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int n = 3;//默认行数
	int m = 3;//默认列数
	int width = 1;//默认边界宽
	int x1 = 1;
	int y1 = 1;
	int x2 = 1;
	int y2 = 1;
	if(request.getParameter("n") != null && request.getParameter("n") != ""){
		n = Integer.parseInt( request.getParameter("n") );
	}
	if(request.getParameter("m") != null && request.getParameter("m") != ""){
		m = Integer.parseInt( request.getParameter("m") );
	}
	if(request.getParameter("width") != null && request.getParameter("width") != ""){
		width = Integer.parseInt( request.getParameter("width") );
	}
	if(request.getParameter("x1") != null && request.getParameter("x1") != ""){
		x1 = Integer.parseInt( request.getParameter("x1") );
	}
	if(request.getParameter("x2") != null && request.getParameter("x2") != ""){
		x2 = Integer.parseInt( request.getParameter("x2") );
	}
	if(request.getParameter("y1") != null && request.getParameter("y1") != ""){
		y1 = Integer.parseInt( request.getParameter("y1") );
	}
	if(request.getParameter("y2") != null && request.getParameter("y2") != ""){
		y2 = Integer.parseInt( request.getParameter("y2") );
	}
	MyJudge myJudge = new MyJudge(x1, y1, x2, y2);
	String [] color = {"gray", "yellow"};
	int flag_h = Integer.parseInt(request.getParameter("differ"));//隔行变色标记
	int flag_l = Integer.parseInt(request.getParameter("differ1"));//隔列变色标记
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示表格</title>
</head>
<body>
	<table border="<%= width%>px" cellspacing="0px">
		<%
		for(int i=0; i<n; i++) {
		%>
			<tr>
		<%	for(int j=0; j<m; j++) { 
				if (myJudge.judge(i, j)){
					if (myJudge.isFirst(i, j)) {
		%>
						<td width="60px" height="20px" bgcolor="<%= color[(i*flag_h+j*flag_l)%2]%>"
						colspan="<%=y2-y1+1 %>" rowspan="<%=x2-x1+1 %>"> 2</td>
		<%
					}
				} else {
		%>
					<td width="60px" height="20px" bgcolor="<%= color[(i*flag_h+j*flag_l)%2]%>">2</td>
		<%			
				}
		%>
		<%	} %>
			</tr>
	<%}%>
	</table>
</body>
</html>