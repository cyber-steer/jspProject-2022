<%@page import="com.dit.LoginDto"%>
<%@page import="com.dit.LoginDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =	request.getParameter("id");
  LoginDao dao = new LoginDao();
  LoginDto dto = dao.select(id);
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
	      <input type="text" class="form-control" id="name" name="name" value="<%= dto.getName() %>">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd"value="<%= dto.getPwd() %>">

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