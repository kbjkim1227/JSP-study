<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	/* 한글 깨짐 방지 */
	request.setCharacterEncoding("UTF-8");

	/* DB 접속 */
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
	String user = "hyun"; // oracle 계정
	String pw = "oraclejava";   // oracle 비밀번호	
	String sql = "";
	
	Connection conn = DriverManager.getConnection(url, user, pw);
	//out.println("DataBase 접속에 성공하였습니다.");
%>