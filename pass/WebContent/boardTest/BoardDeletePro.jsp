<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import = "java.sql.*"%>
    
    <%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	
	//1. DB ���� ����̹� �ε�
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. ���� ��ü ����
	String url = "jdbc:mariadb://localhost:3306/jaeyongdb";
	String user = "jaeyong";
	String pwd= "1111";
	Connection con = DriverManager.getConnection(url, user, pwd);
	
	
	//3. ������ ������ ���� SQL�� ���� �Ƿ� �غ�
	String sql = "DELETE FROM board WHERE title=?;";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	int i = pstmt.executeUpdate();
	pstmt.close();
	con.close();
	
	response.sendRedirect("Boardlist.jsp");
%>
    