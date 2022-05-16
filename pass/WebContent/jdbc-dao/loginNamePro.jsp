<!--
	작성자 : 
	변경이력 : 
	프로그램 설명 : 
-->
<%@page import="com.dit.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	LoginDao dao = new LoginDao();
	if(dao.checkUser(id, pwd)){
		response.sendRedirect("welcome.jsp");
	}else{
		response.sendRedirect("insertForm.jsp");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이쪽으로 넘어옵니다...
</body>
</html>