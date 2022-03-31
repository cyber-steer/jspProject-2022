<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String[] languages = request.getParameterValues("language");
	String hobby = request.getParameter("hobby");
	
	out.println("관심 언어 : ");
	try{
		for(String str : languages){
			out.println(str);
		}
	}catch(Exception e){
		
	}
	
	out.println("<br>취미 : "+hobby);
%>
</body>
</html>