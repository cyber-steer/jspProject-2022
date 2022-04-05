<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");

	//웹 브라우저에서 전달된 정보
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 1. 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. Connection 연결
	String url = "jdbc:mariadb://localhost:3333/jspdb";
	String user = "jsp";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	// 3. sql문 준비
	//String sql = "INSERT INTO login(id,pwd) VALUES('"+id+"', '"+pw+"');";
	//Statement stmt = con.createStatement();
	String sql = 	"INSERT INTO login(id,pwd) VALUES(?, ?);";
	
	// 4. sql문 실행
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	//int i = stmt.executeUpdate(sql);
	int i = pstmt.executeUpdate();
	
	// 5. 객체 해제
	//stmt.close();
	pstmt.close();
	con.close();
	
	response.sendRedirect("dbcon.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	당신의 아이디는 <%=id %>입니다 <br>
	당신의 암호는는 <%=pw %>입니다 <br>
	입력된 데이터는 <%= i %> 입니다.
	<form action="dbcon.jsp" method="post"><input type="submit" value="목록"></form>
	
</body>
</html>