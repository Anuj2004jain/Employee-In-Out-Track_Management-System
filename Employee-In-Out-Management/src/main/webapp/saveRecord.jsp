<%@page import="java.sql.*"%>
<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<div style ='text-align : center; margin-top: 10px'>
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eiot", "root", "Root");
String id=request.getParameter("Eid");
String name=request.getParameter("Ename");
String dept=request.getParameter("Edept");
boolean flag = false;
String query1 = "select E_Id from employee";
PreparedStatement ps1 = con.prepareStatement(query1);
ResultSet rs = ps1.executeQuery();
while(rs.next()){
	if(rs.getString(1).equals(id)){
		flag = true;
		%>
		<h1 style='color:Red; font-size:30px; font-family: Garamond'> Employee Id is Already Exists</h1>
		<% 
		break;
	}
		
}
if(flag == false){
	String query="insert into employee(E_Id, E_Name,E_Department) values(?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,dept);
	ps.executeUpdate();
	%>
	<h2 style='color:green; font-size:30px; font-family: Garamond'> Record is Saved Successfully</h2>
	<% 
}
%>
</div>
</body>
</html>