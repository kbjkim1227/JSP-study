<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<h2>홈쇼핑 회원 등록</h2>
<table>
	<colgroup>
		<col width="11%">
		<col width="11%">
		<col width="17%">
		<col width="24%">
		<col width="15%">
		<col width="11%">
		<col width="11%">
	</colgroup>
	<thead>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
	</thead>
	<tbody>
		<%					 
			/* 회원정보 list 가져오기 */
			sql = "SELECT * from member_tbl_02 order by custno asc";
			ResultSet res = conn.prepareStatement(sql).executeQuery();
			String custno, custname, phone, address, joindate, grade, city;
			while (res.next()) {
				custno = res.getString("custno");
				custname = res.getString("custname");
				phone = res.getString("phone");
				address = res.getString("address");
				grade = res.getString("grade");
				city = res.getString("city");
				
				
				//  input  : 2018-07-29 00:00:00
				//  output : 2018-07-29
				 
				joindate = res.getString("joindate");
				
				if(joindate.length() > 10) 
					joindate = joindate.substring(0,10);
				
				
				switch (grade) {
					case "A" : grade = "VIP"; break;
					case "B" : grade = "일반"; break;
					case "C" : grade = "7직원"; break;
				}
		%>
		<tr style="text-align:center;">
			<td><a href="./update.jsp?custno=<%=custno%>"><%= custno %></a></td>
			<td><%= custname %></td>
			<td><%= phone %></td>
			<td><%= address %></td>
			<td><%= joindate %></td>
			<td><%= grade %></td>
			<td><%= city %></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%@ include file="buttom.jsp" %>

