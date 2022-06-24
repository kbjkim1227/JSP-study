<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 매출 조회</title>
</head>
<body>
<table>
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>

	<thead>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th> 매 출   </th>
		</tr>
	</thead>
	<tbody>
	<%
		//매출 정보 리스트 가져오기
		String custno, custname, grade, total;
	
		sql = "SELECT mb.custno, mb.custname, mb.grade, sum(mn.price) as total ";
		sql+=	"FROM member_tbl_02 mb "; 
		sql+=	"JOIN money_tbl_02 mn on mb.custno = mn.custno "; 
		sql+=	"group by (mb.custno, mb.custname, mb.grade) "; 
		sql+=	"order by total desc";
				
		ResultSet rs = conn.prepareStatement(sql).executeQuery();
		
		while(rs.next()){
			custno = rs.getString("custno"); 
			custname = rs.getString("custname"); 
			grade = rs.getString("grade"); 
			total = rs.getString("total");
			
		switch(grade){
		case "A" : grade = "VIP"; break; 
		case "B" : grade = "일반"; break;
		case "C" : grade = "7직원"; break;		
		}
	%>
	
	<tr style="text-align:center;">
		<td><%=custno %></a></td>
		<td><%=custname %></td>
		<td><%=grade %></td>
		<td><%=total %></td>
	</tr>
	<%
		}
	%>
</tbody>
</table>
<%@ include file="buttom.jsp" %>
</body>
</html>