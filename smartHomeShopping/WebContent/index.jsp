<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 등록 화면</title>
</head>
<%
	//nextVal() 가져오기
	sql = "select custno from member_tbl_02 where rownum <=1 order by custno desc";	
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	
	int custno = 10001;	
	if(rs.next())
		custno = rs.getInt(1) + 1;
%>

	<h2>홈쇼핑 회원 등록 화면</h2>
<form action="./action.jsp" method="post">
	<input type="hidden" name="action" value="insert">
	<table>
	<colgroup>
		<col width="40%">
		<col width="60%">
	</colgroup>
	<tr>
		<th align="center">회원번호(자동발생)</th>
			<td><input type="text" size="20" value="<%=custno %>"></td></tr>
		<th align="center">회원성명</th>
			<td><input type="text" size="20" name="custname"></td></tr>
		<th align="center">회원전화</th>
			<td><input type="text" size="30" name="phone"></td></tr>
		<th align="center">회원주소</th>
			<td><input type="text" size="40" name="address"></td></tr>
		<th align="center">가입일자</th>
			<td><input type="text" size="20" name="joindate"></td></tr>
		<th align="center">고객등급(A:VIP, B:일반, C:직원)</th>
			<td><input type="text" size="20" name="grade"></td></tr>
		<th align="center">도시코드</th>
			<td><input type="text" size="20" name="city"></td>
	</tr>
	</table>		

	<div class="btn_group" align="center">
	<button type="submit">등록</button>
	<button type="button" onclick="history.back();">조회</button>
	</div>
</form>
<%@ include file="buttom.jsp" %>  
</html>