<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	//1. JDBC driver를 로드한다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. DB와의 연결(Connection)을 생성한다.
	String url = "jdbc:mariadb://localhost:3306/jaeyongdb";
	String user = "jaeyong";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	String sql = "update login set title=?, content=? where name=?;";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("Boardlist.jsp");
%>