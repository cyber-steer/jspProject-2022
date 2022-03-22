<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	국어 : <%= kor %> <br>
	영어 : <%= eng %> <br>
	수학 : <%= math %> <br> <br>
	총점 : <%= kor+eng+math %> <br>
	평균 : <%= (kor+eng+math)/3 %> <br>
</body>
</html>