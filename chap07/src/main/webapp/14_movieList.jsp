<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSTL</title>
</head>
<body>
<%
String[] movieList={"타이타닉","시네마 천국","혹성 탈출","킹콩"};
pageContext.setAttribute("movieList",movieList);//접점
%>
<c:forEach var="movie" items="${movieList}"> <!-- items="<%=movieList%>"로 접점가능-->
	${movie}<br>
</c:forEach>

</body>
</html>
<%-- java의 반복문(향상된for문)
<c:forEach var="변수이름" items="배열과 같은 집합체" begin="시작 인덱스" end="종료 인덱스" >
	몸체
</c:forEach>
--%>