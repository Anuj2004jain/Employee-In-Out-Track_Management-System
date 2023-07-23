<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@ include file = "DateReport.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<%
String date = request.getParameter("date");
//System.out.println(date);
String[] y=date.split("-");
//System.out.println(y.length);
String dd = y[2];
String MM = y[1];
String YYYY = y[0];
String Con_date = dd+"-"+MM+"-"+YYYY;
//System.out.println(Con_date);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eiot", "root", "Root");
String query = "select Date from empl_time";
boolean flag = false;
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	if(Con_date.equals(rs.getString(1))){
		flag = true;
		break;
	}
	else{
		flag = false;
	}
}
if (flag == false){
	%>
	<h2 style ='color: Red; text-align:center; font-family:Garamond; font-size:30px '>No Record for the date <%=Con_date %></h2>
	<% 
}
else{
	String Query1 = "Select * from empl_time where Date = ?";
	PreparedStatement ps1 = con.prepareStatement(Query1);
	ps1.setString(1, Con_date);
	ResultSet rs1 = ps1.executeQuery();
	%>
	<table class = 'tar' border=1 style ="margin-left: auto; margin-right: auto;">
	<tr>
	 <th class ='tdp'>E_Id</th><th class ='tdp'>Date</th><th class ='tdp'>In_Time</th><th class ='tdp'>Out_Time</th><th class ='tdp'>Total_Time</th>
	</tr>
	<% 
	while(rs1.next())
	{
	%>
		<tr>
		<td class ='tdp'><%=rs1.getString(1) %></td>
		<td class ='tdp'><%=rs1.getString(2) %></td>
		<td class ='tdp'><%=rs1.getString(3) %></td>
		<td class ='tdp'><%=rs1.getString(4) %></td>
		<td class ='tdp'><%=rs1.getString(5) %></td>
		</tr>
		<% 
	}
}
%>
</table>
</body>
</html>