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
<!-- url로부터 읽어온 결과를 화면에 출력 -->
<c:import url="http://localhost:8090/chap07/01_el.jsp"></c:import>
<!-- 변수를 선언하면 읽어온 결과를 변수에 담아 출력 [var="변수"] [scope["범위"][charEncoding="인코딩"]-->
<c:import url="http://localhost:8090/chap07/01_el.jsp" var="data"></c:import>
${data}
</body>
</html>