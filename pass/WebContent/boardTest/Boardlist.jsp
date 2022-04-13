<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. JDBC driver를 로드한다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. DB와의 연결(Connection)을 생성한다.
	String url = "jdbc:mariadb://localhost:3306/jaeyongdb";
	String user = "jaeyong";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	// 3. 연결후 그 통로를 통해 SQL문을 실행한다.
	String sql = "select * from board";
	Statement stmt = con.createStatement();
	
	//4 SQL 실행
	ResultSet rs = stmt.executeQuery(sql);
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
		<td>title</td>
		<td>name</td>
		<td>pwd</td>
		<td>content</td>
	</tr>
	<tr>
<%
	// 5. 반환된 데이터 출력
	while(rs.next()){
		String title = rs.getString("title");
		String name = rs.getString("name");
		String pwd2 = rs.getString("pwd");
		String content = rs.getString("content");
%>
		
		<td><a href="BoardForm.jsp?title=<%=title%>"><%= title %></a></td>
		
		<td><%=name %></td>
		<td><%=pwd2 %></td>
		<td><%=content %></td>
		
	</tr>
<% } %>
</table>
<button onclick="location.href='BoardInsert.jsp'">글쓰기</button>

<%
	
	// 6. 객체 해지
	rs.close();
	stmt.close();
	con.close();
%>
</body>
</html>