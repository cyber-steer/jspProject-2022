<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String txt = request.getParameter("txt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Protocol : <%=request.getProtocol() %><br>
	ServerName : <%=request.getServerName() %><br>
	Method : <%=request.getMethod() %><br>
	QueryString : <%=request.getQueryString() %><br>
	RequestURI : <%=request.getRequestURI() %><br>
	RemoteHost : <%=request.getRemoteHost() %><br>
	RemoteAddr : <%=request.getRemoteAddr() %><br>
	ServerPort : <%=request.getServerPort() %><br>
	ContextPath : <%=request.getContextPath() %><br>
	Header : <%=request.getHeader("name") %><br>
	HeaderNames : <%=request.getHeaderNames() %><br>>
	Header : <%=request.getHeader("name") %><br>
	RequestURL : <%=request.getRequestURL() %> <br>
	ParameterNames : <%=request.getParameterNames() %>
	
	<%
		response.sendRedirect("temp.jsp");
	%>
</body>
</html>