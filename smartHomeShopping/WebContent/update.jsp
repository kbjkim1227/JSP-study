<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면</title>
</head>
<body>
<%
	//데이터 가져오기
	String custname, phone, address, joindate, grade, city;
	
	String custno = request.getParameter("custno");
	
	sql = "select * from member_tbl_02 where custno =" + custno;

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	
	rs.next();

	custname = rs.getString("custname");
	phone = rs.getString("phone");
	address = rs.getString("address");
	joindate = rs.getString("joindate");
		if(joindate.length() > 10)
			joindate = joindate.substring(0,10);//날짜만 추출
	grade = rs.getString("grade");
	city = rs.getString("city");
	
%>
<h2>홈쇼핑 회원 정보 수정 화면</h2>
<form action="./action.jsp" method="post">
	<input type="hidden" name="action" value="update">
	<table>
	<colgroup>
		<col width="40%">
		<col width="60%">
	</colgroup>
	<tr>
		<th align="center">회원번호(자동발생)</th>
			<td><input type="text" size="20" name="custno" value="<%=custno %>"></td></tr>
		<th align="center">회원성명</th>
			<td><input type="text" size="20" name="custname" value="<%=custname %>"></td></tr>
		<th align="center">회원전화</th>
			<td><input type="text" size="30" name="phone" value="<%=phone %>"></td></tr>
		<th align="center">회원주소</th>
			<td><input type="text" size="40" name="address" value="<%=address %>"></td></tr>
		<th align="center">가입일자</th>
			<td><input type="text" size="20" name="joindate" value="<%=joindate %>"></td></tr>
		<th align="center">고객등급(A:VIP, B:일반, C:직원)</th>
			<td><input type="text" size="20" name="grade" value="<%=grade %>"></td></tr>
		<th align="center">도시코드</th>
			<td><input type="text" size="20" name="city" value="<%=city %>"></td>
	</tr>
	</table>		

	<div class="btn_group" align="center">
	<button type="submit">회원정보수정</button>
	<button type="button" onclick="history.back();">회원정보조회</button>
	</div>
</form>
<%@ include file="buttom.jsp" %>
</body>  
</html>