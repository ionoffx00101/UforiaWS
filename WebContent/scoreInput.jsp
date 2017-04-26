<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="test.*"%>

<%
String str = "";

try{
	Connection conn = DBConn.getConnection();
	
	request.setCharacterEncoding("UTF-8");
	
	String score_name = request.getParameter("score_name");
	String score_score = request.getParameter("score_score");
	System.out.println(score_name+" ,, "+score_score);
	
/* 			score_num number(6) PRIMARY key,
			score_name varchar2(50),
			score_score varchar2 (50) */

	//String sql = String.format("Insert into score (score_name,score_score) values ('%s','%s')",score_name,score_score);
	String sql = String.format("Insert into score (score_num,score_name,score_score) values (score_seq.NEXTVAL,'%s','%s')",score_name,score_score);
	Statement stmt = conn.createStatement();
	int count =stmt.executeUpdate(sql);
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close();
}
%>