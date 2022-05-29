<!--
	작성자 : 
	변경이력 : 
	프로그램 설명 : 
-->
<%@page import="com.dit.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	
	LoginDto dto = new LoginDto("id","name","pwd");
	pageContext.setAttribute("dto", dto);
	
	String list[] = {"moon","sum","jupiter","mars"};
	pageContext.setAttribute("list", list);
	
	Cookie cookie = new Cookie("name","jsp");
	response.addCookie(cookie);
	request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연습</title>
</head>
<body>
	쿠키 : ${cookie.name.value}<br>
	문자열 : ${"Hello world!"} <br>
	문자열 : ${'Hello world!'} <br>
	배열 : ${param.list[0]}<br>
	연산자 : ${100-45 }<br>
	연산자 : ${100<45 }<br>
	내장객체 : ${ param.id } <br>
	empty 연산자 : ${empty param.id}<br>
	삼항연산 : ${empty param.id ? "비었어요!!!" : param.id}<br>
	<br>
	id : ${ dto.id }<br>
	pwd : ${ dto.pwd }<br>
	name : ${ dto.name }<br>
	<br>
	프로토콜 : ${pageContext.request.protocol } <br>
	호스트 : ${pageContext.request.remoteHost } <br>
</body>
</html>