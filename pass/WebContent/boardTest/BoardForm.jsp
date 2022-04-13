<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title =	request.getParameter("title");
	String name="";
	String pw="";
	String content="";
	//1. JDBC driver를 로드한다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. DB와의 연결(Connection)을 생성한다.
	String url = "jdbc:mariadb://localhost:3306/jaeyongdb";
	String user = "jaeyong";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	// 3. 연결후 그 통로를 통해 SQL문을 실행한다.
	String sql = "select * from board where title=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1,title);
	
	//4 SQL 실행
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		name = rs.getString("name");
		pw = rs.getString("pwd");
		content=rs.getString("content");
		
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
<title>게시판 폼 만들기</title>
</head>
<body>
<form action="BoardPro.jsp" method="post">
	<table>
	  <tr>
	   <td>
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
	      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
	      <td>수정 삭제 용</td>
	      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
	     </tr>
	    </table>
	   <table>
	     <tr>
	      <td>
	      </td>
	      <td align="center">제목</td>
	      <td><input name="title" size="50" maxlength="100" name="title"><%=title %></td>
	      <td>
		</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td> </td>
	      <td align="center">이름</td>
	      <td><input name="name" size="50" maxlength="50" name="name"><%=name %></td>
	      <td> </td>
	     </tr>
	      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td> </td>
	      <td align="center">비밀번호</td>
	      <td><input name="pwd" size="50" maxlength="50" name="pwd"></td>
	      <td> </td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr>
	      <td> </td>
	      <td align="center">내용</td>
	      <td><textarea name="content" cols="50" rows="13"><%=content %></textarea></td>
	      <td> </td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
	     <tr align="center">
	      <td> </td>
	      <td colspan="5"><input type="submit" value="등록">
	      <td> </td>
	     </tr>
	    </table>
	   </td>
	  </tr>
	 </table>
 </form>
          <button type="button" onclick="location.href='BoardUpdate.jsp?id=<%=title %>'">수정</button>
          <button type="button" onclick="location.href='BoardDeletePro.jsp?id=<%=title %>'">삭제</button>
		  <button type="button" onclick="location.href='Boardlist.jsp'">목록</button>
</body>
</html>
