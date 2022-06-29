<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty loginUser}">
<jsp:forward page = 'login.do'/>
</c:if>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../chap09/script/member.js"></script>
</head>
<body>
<h2>회원 전용 페이지</h2>
<form action="logout.do">
<table>
<tr>
	<td>안녕하세요.${loginUser.name }(${loginUser.userid }님)</td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="로그아웃">&nbsp;&nbsp;
	
	<!-- 회원정보수정 : userid를 들고 memberUpdateServlet의 doGet메소드로 이동 -->
	<input type="button" value="회원 정보 변경" onclick="location.href='MemberUpdate.do?userid=${loginUser.userid}'" >
	 <input type="button" value="삭제" onclick="deleteCheck('${loginUser.userid}')">
	</td>
</tr>	
<tr>
<td colspan="2">${message}</td>
</tr>
</table>
</form>
</body>
</html>