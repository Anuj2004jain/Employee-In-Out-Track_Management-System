<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@ include file = "EmplReport.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<%
String Id = request.getParameter("Eid");
String query2 = "Select E_Name from employee where E_Id =?";
PreparedStatement ps2 = con.prepareStatement(query2);
ps2.setString(1, Id);
ResultSet rs2 = ps2.executeQuery();
rs2.next();
String Query1 = "Select * from empl_time where E_Id = ?";
PreparedStatement ps1 = con.prepareStatement(Query1);
ps1.setString(1, Id);
ResultSet rs1 = ps1.executeQuery();
	%>
	<table class = 'tar' border=1 style ="margin-left: auto; margin-right: auto;">
	<tr>
	 <th class ='tdp'>E_Id</th><th class ='tdp'>E_Name</th><th class ='tdp'>Date</th><th class ='tdp'>In_Time</th><th class ='tdp'>Out_Time</th><th class ='tdp'>Total_Time</th>
	</tr>
	<% 
	while(rs1.next())
	{
	%>
		<tr>
		<td class ='tdp'><%=rs1.getString(1) %></td>
		<td class ='tdp'><%=rs2.getString(1) %></td>
		<td class ='tdp'><%=rs1.getString(2) %></td>
		<td class ='tdp'><%=rs1.getString(3) %></td>
		<td class ='tdp'><%=rs1.getString(4) %></td>
		<td class ='tdp'><%=rs1.getString(5) %></td>
		</tr>
		<%
		}
		%>
</table>
</body>
</html>