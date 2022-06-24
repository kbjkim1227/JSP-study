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

<table border="1" style="width:100;text-align:center">
<tr>
<th>index</th>
<th>count</th>
<th>title</th>
</tr>

<!-- varStatus: 배열과 같은 집합체에서 항목의 인덱스 값을 사용해야할 경우 -->
<c:forEach var="movie" items="${movieList}" varStatus="status">
<tr>
<td>${status.index}</td> <!-- index는 0~시작 : 반복중인 항목의 index-->
<td>${status.count}</td> <!-- count는 1~시작 : 반복할때 현재 몇번째 반복인지-->
<td>${movie}</td>
</tr>
</c:forEach>
</table>
</body>
</html>