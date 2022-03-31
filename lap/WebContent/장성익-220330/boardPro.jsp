<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String nickName = request.getParameter("nickName");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    제목 : <%= title %> <br>
    닉네임 : <%= nickName %> <br>
    암호 :  <%= pwd %> <br> <br>
    내용 : <%= content %>
</body>
</html>