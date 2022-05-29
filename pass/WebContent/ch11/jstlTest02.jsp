<!--
	작성자 : 
	변경이력 : 
	프로그램 설명 : 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="score" value="${param.score}" scope="page"/>
	<c:out value="${param.score}">
	${empty score ? "매개변수값이 비어있습니다" : score}
</body>
</html>