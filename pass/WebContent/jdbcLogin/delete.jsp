
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	System.out.println(id);
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3333/jspdb";
	String user = "jsp";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	Statement stmt = con.createStatement();
	//stmt.executeUpdate(query);
	
	stmt.close();
	con.close();
	
	response.sendRedirect("list.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>