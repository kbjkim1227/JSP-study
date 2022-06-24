<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 및 정보 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String action = request.getParameter("action");
	String moveURL = "./";
	
	PreparedStatement pstmt = null;

	switch(action){
	case "insert" : 
		sql = "insert into member_tbl_02 values(member_seq.nextval, ?,?,?,?,?,?)";
	
		pstmt = conn.prepareStatement(sql);
	
		//request 영역에 저장된 데이터를 가져옵니다.
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		 moveURL = "./list.jsp";
		break;
		
	case "update" :
		sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		
		pstmt = conn.prepareStatement(sql);
		
		//request 영역에 저장된 데이터를 가져옵니다.
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setInt(7, Integer.parseInt(request.getParameter("custno")));
		 moveURL = "./list.jsp";
		break;
		
	}
	
	pstmt.executeUpdate();//insert, update, delete
%>
	<script>
		alert("성공적으로 완료되었습니다.");
		location.href=("<%=moveURL %>");
	</script>

</body>
</html>