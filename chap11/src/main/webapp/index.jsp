<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.sendRedirect("http://localhost:8090/chap11/BoardServlet?command=board_list");
%>
</body>
</html>