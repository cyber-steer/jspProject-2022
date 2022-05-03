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
    
<%
	ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
	LoginDao dao = new LoginDao();
	dtos = dao.select();
	
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
<%
	// 5. 반환된 데이터 출력
	for(int i=0; i<dtos.size();i++){
		LoginDto dto = dtos.get(i);
		String name = dto.getName();
		String id = dto.getId();
		String pw = dto.getPwd();
%>
		<td><a href="updateForm.jsp?id=<%=id%>"><%= id %></a></td>
		<td><%= name %></td>
		<td><%= pw %></td>
	</tr>
<% } %>
</table>
<button type="button" onclick="location.href='index.jsp'" >돌아가기</button>

</body>
</html>