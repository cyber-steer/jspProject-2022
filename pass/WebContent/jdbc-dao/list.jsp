<%@page import="com.dit.LoginDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dit.LoginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
	LoginDao dao = new LoginDao();
	dtos = dao.select();
	pageContext.setAttribute("dtos", dtos);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<table class="table">
	<tr>
		<td>id</td>
		<td>name</td>
		<td>pwd</td>
	</tr>
	<tr>
	<c:forEach var="dto" items="${dtos}">
		<td><a href="updateForm.jsp?id=${dto.id}">${dto.id }</a></td>
		<td>${dto.name}</td>
		<td>${dto.pwd }</td>
	</tr>
	</c:forEach>
</table>
<button type="button" onclick="location.href='index.jsp'" >돌아가기</button>

</body>
</html>