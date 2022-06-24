<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문 적용</title>
</head>
<body>

<c:if test="${param.color==1}">
	<span style="color:red;">빨강</span>
</c:if> 

<c:if test="${param.color==2}">
	<span style="color:green;">초록</span>
</c:if>
<c:if test="${param.color==3}">
	<span style="color:blue;">파랑</span>
</c:if>


<%-- <%
String c = request.getParameter("color");
int color = Integer.parseInt(c);
if(color==1){
%>
<span style="color:red;">빨강</span>
<%}else if(color==2){%>
<span style="color:green;">초록</span>	
<%}else{%>
<span style="color:blue;">파랑</span>
<%} %>         스파게티코드 --%>


<%-- <!-- else문이 없음 -->
<c:if test="${param.userType == 'adimin'}">
${param.id}(관리자)
</c:if>
<c:if test="${param.userType == 'member'}">
${param.id}(회원)
</c:if> --%>

<!-- JSTL의 if else 역할 -->
<%-- <c:choose>
	<c:when test="${param.userType == 'adimin'}">
		${param.id}(관리자)
	</c:when>
	<c:otherwise>
		${param.id}(회원)
	</c:otherwise>
</c:choose> --%>

<!-- java switch -->
<%-- <c:choose>
<c:when test="조건1">몸체1</c:when>
<c:when test="조건2">몸체2</c:when>
<c:when test="조건3">몸체3</c:when>
<c:otherwise>몸체4</c:otherwise> 
</c:choose> --%>
<!-- otherwise 생략가능 -->

<%--
if(request.getParameter("userType").equals("admin"){
out.print(request.getParameter("id")+"(관리자)");
}else{
out.print(request.getParameter("id")+"(회원)");
}
--%>



</body>
</html>