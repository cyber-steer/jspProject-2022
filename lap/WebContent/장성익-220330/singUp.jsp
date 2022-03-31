<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nickName = request.getParameter("nickName");
	String gender = request.getParameter("gender");
	String[] language = request.getParameterValues("language");
	String locate = request.getParameter("locate");
	String memo = request.getParameter("memo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	닉네임 : <%= nickName %> <br>
	아이디  : <%= id %> <br>
	비밀번호 : <%= pw %> <br>
	성별 : <%= gender %> <br>
	언어 : <%= language %> <br>
	
	지역 : <%= locate %> <br>
	메모 : <br><%= memo %> <br>
</body>
</html>