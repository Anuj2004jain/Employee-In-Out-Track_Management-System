<%@page import="java.sql.*"%>
<%@ include file = 'Home.jsp' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<form action='showEmplWise.jsp' method = 'post'>
<table style=' border: 3px solid black;margin:auto; margin-top:10px'>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eiot", "root", "Root");
String query = "select E_Id from employee";
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = ps.executeQuery();
%>
<tr>
<td class = "tdp" > Select Employee Id</td>
<td class = "tdp">
<select class = "tp" style='font-size:22px' name='Eid'>
<%
while(rs.next()){
	%>
	<option><%=rs.getString(1)%></option>
	<% 
}
%>
</select>
</td>
</tr>
<tr>
	<td colspan="2" align="center" style = "padding: 10px ">
	<button style ="font-family:Garamond;font-size:30px; padding: 1px 15px; color:white; background-color:082032; border-radius:5px">Show</button>
	</td>
	</tr>
</table>
</form>
</body>
</html>