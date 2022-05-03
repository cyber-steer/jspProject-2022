<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =	request.getParameter("id");
	request.setAttribute("id", id);

	//1. JDBC driver를 로드한다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. DB와의 연결(Connection)을 생성한다.
	String url = "jdbc:mariadb://localhost:3333/jspdb";
	String user = "jsp";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	// 3. 연결후 그 통로를 통해 SQL문을 실행한다.
	String sql = "select * from login where id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1,id);
	
	//4 SQL 실행
	ResultSet rs = pstmt.executeQuery();
	String name="";
	String pw="";
	while(rs.next()){
		name = rs.getString("name");
		pw = rs.getString("pwd");
	}

	//5. 객체 해제
	rs.close();
	pstmt.close();
	con.close();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 입력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">멤버 등록</h2>
		<hr/>
		
		<form action="updatePro.jsp" method="post">
		  <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" name="id" value="<%= id%>">
	    </div>
	    <div class="form-group">
	      <label for="name">NAME:</label>
	      <input type="text" class="form-control" id="name" name="name" value="<%= name %>">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd"value="<%= pw %>">

	    </div>
	    <br>
	    <div class="text-center">
	    	<input type="submit" value="수정">
				<a href="delete.jsp?id=<%=id%>"><button type="button">삭제</button></a>
				<button type="button" onclick="location.href='list.jsp'">돌아가기</button>
			</div>
		</form>
	
	</div>
</body>
</html>