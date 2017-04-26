<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>

<%@ page import="java.sql.*"%>

<%@ page import="test.*"%>

<%
	JSONObject content = new JSONObject();

	try {
		Connection conn = DBConn.getConnection();

		//String sql = String.format("Select score_name,score_score from score");
		//String sql = String.format("Select score_name,score_score from score order by score_score desc");
		String sql = String.format("select rank() OVER (ORDER BY score_score DESC) score_rank,score_name,score_score from score");
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		JSONArray insideList = new JSONArray();
		
		while(rs.next()){
			JSONObject data = new JSONObject();
			
			data.put("score_rank", rs.getString("score_rank"));
			data.put("score_name", rs.getString("score_name"));
			data.put("score_score", rs.getString("score_score"));
			
			insideList.add(data);
		}
		
		content.put("scoreList",insideList);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBConn.close();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>asdf</title>
<body>
	<div>
		<%=content.toJSONString()%>
	</div>
</body>
</head>
</html>