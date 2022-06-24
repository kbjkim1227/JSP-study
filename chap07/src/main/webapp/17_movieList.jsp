<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--1~10까지 반복 ( 조건:현재루프가 마지막이아니면 , 추가 ) -->
<c:forEach var="cnt" begin="1" end="10" varStatus="status">
	${cnt}<c:if test="${not status.last }">,</c:if>
</c:forEach>
<br><br>
<hr>
<table border="1" style="width:100%;text-align:center;">
<tr>
<th>index</th>
<th>count</th>
<th>cnt</th>
</tr>
<!--java for문 : for(int cnt=7;cnt<=10;cnt++) -->
<c:forEach var="cnt" begin="7" end="10" varStatus="status">
<tr>
<td>${status.index}</td>
<td>${status.count}</td>
<td>${cnt}</td>
</tr>
</c:forEach>
</table>
<hr>
<br><br>


<table border="1" style="width:100%;text-align:center;">
<tr>
<th>index</th>
<th>count</th>
<th>cnt</th>
</tr>
<!-- for(int cnt=7;cnt<=10;cnt+2)  step의값은 음수를 줄수없다.-->
<c:forEach var="cnt" begin="1" end="10" varStatus="status" step="2">
<tr>
<td>${status.index}</td>
<td>${status.count}</td>
<td>${cnt}</td>
</tr>
</c:forEach>
</table>
<hr>
<br><br>


<table border="1" style="width:100%;text-align:center;">
<tr>
<th>index</th>
<th>count</th>
<th>cnt</th>
</tr>
<!-- for(int cnt=10;cnt<=1;cnt--)  step의값은 음수를 줄수없다.
	 for문 증감 값을 설정하고싶다면 set을 이용한다 -->
<c:set var="cntTest" value="10"/>
<c:forEach var="cnt" begin="1" end="10" varStatus="status" step="1">

<tr>
<td>${status.index}</td>
<td>${status.count}</td>
<td>${cntTest-cnt}</td> <!-- set을 이용해 변수하나를만들고 증가값을빼준다 -->
</tr>
</c:forEach>
</table>
<hr>
<br><br>

</body>
</html>