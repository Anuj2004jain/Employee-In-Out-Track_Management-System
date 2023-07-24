<%@page import="java.sql.*"%>
<%@ include file = 'timeOut.jsp' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<% 
String name;
String dept;
//Class.forName("com.mysql.cj.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eiot", "root", "Root");
String id=request.getParameter("Eid");
String query1 = "select E_Name, E_Department from employee where E_Id = ?";
PreparedStatement ps1 = con.prepareStatement(query1);
ps1.setString(1, id);
ResultSet rs1 = ps1.executeQuery();
rs1.next();
name = rs1.getString(1);
dept = rs1.getString(2);
%>
<table style="width:100%; margin-top:10px;border:1px solid black">

<tr>
  <th class = 'tdp' style="border:1px solid black">E_Id</th>
  <th class = 'tdp' style="border:1px solid black">E_Name</th>
  <th class = 'tdp' style="border:1px solid black">E_dept</th>
</tr>
<tr>
<th class = 'tdp' style="border:1px solid black"><%=id%></th>
<th class = 'tdp' style="border:1px solid black"><%=name%></th>
<th class = 'tdp' style="border:1px solid black"><%=dept%></th>
<th>
<a href='setTime.jsp?Eid=<%=id%>' style ="font-family:Garamond;font-size:30px; padding: 1px 15px; color:white; background-color:082032; border-radius:5px;"> Check Out</a>
</th>
</tr>
</table>

</body>
</html>