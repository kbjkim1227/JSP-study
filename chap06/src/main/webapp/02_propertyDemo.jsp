<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 빈 프로퍼티 값 얻고 변경</title>
</head>
<body>
<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"/>
<hr>
◎ 자바 빈 객체 생성 후 저장된 정보 출력하기 <br><br>
이름 : <jsp:getProperty property="name" name="member"/><br>
아이디 : <jsp:getProperty property="userid" name="member"/>
<hr>
◎정보 변경한 후 변경된 정보 출력하기 <br><br>
<jsp:setProperty property="name" name="member" value="전수빈"/>
<jsp:setProperty property="userid" name="member" value="pinksubin"/>
이름 : <jsp:getProperty property="name" name="member"/><br>
아이디 : <jsp:getProperty property="userid" name="member"/>
</body>
</html>