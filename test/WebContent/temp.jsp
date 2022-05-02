<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String txt1 = request.getParameter("txt1");
	String txt2 =request.getParameter("txt2");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= txt1 %><br>
	<%= txt2 %>
</body>
</html>