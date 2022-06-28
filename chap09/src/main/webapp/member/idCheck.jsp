<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../chap09/script/member.js"></script>
<body>
<h2>아이디 중복 확인</h2>
<form action="idCheck.do" method="get" name="frm">
아이디<input type="text" name="userid" value="${userid }">
 <!-- 	<input type="submit" value="중복체크">  --><br>
	<c:if test="${result == 1 }">
	
	<script type="text/javascript" src='../chap09/script/member.js'>
	//스크립트명령어를 써주기위해서 감싸준다.
    
	//opener 객체는 자기자신을 오픈한 기존 창의window 객체를 참조한다
	opener.document.frm.userid.value="";
	//opener : 사용중인 창
	</script>
	
	${userid} 는 이미 사용 중인 아이디 입니다.
	
	</c:if>
	
	<c:if test="${result == -1 }">
	${userid} 는 사용 가능한 아이디 입니다.
	<input type="button" value="사용" class="cancel" onclick="idOk()">    
	</c:if>
</form>
</body>
</html>