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
	<c:set var="id" value="gildong" scope="page"/>
	<c:set var="income" value="2000000" scope="page"/>
	<c:out value="${id}"/>의 수입은 <c:out value="${income}"/> 입니다.<br>
	
	<c:if test="${income>=4000 }" var="rs">
		보여줄 내용
		<c:out value="${income}" /><br>
		${rs }
	</c:if>
	<br>
	<c:forEach var="i" begin="0" end="5">
		${i}
	</c:forEach>
</body>
</html>