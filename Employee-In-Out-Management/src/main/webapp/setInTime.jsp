<%@ include file = "InTime.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<%
DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
Date date = new Date();
String time = dateFormat.format(date);
DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
String Cur_date= dateformat.format(date);
String id = request.getParameter("Eid");
String query2 = "select In_Time , Out_Time from empl_time where E_Id = ? and Date = ?";
PreparedStatement ps2 = con.prepareStatement(query2);
ps2.setString(1, id);
ps2.setString(2, Cur_date);
ResultSet rs1 = ps2.executeQuery();
if(rs1.next() == false){
	//System.out.println("Empty set");
	String query1 = "Insert into empl_time(E_Id,Date,In_Time) values(?,?,?)";
	PreparedStatement ps1 = con.prepareStatement(query1);
	ps1.setString(1, id);
	ps1.setString(2,Cur_date);
	ps1.setString(3, time);
	ps1.executeUpdate();
	%>
	<h2 style ='color: Green; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is Checked In </h2>
	<% 
}
else{
	
	String InTime = rs1.getString(1);
	String OutTime = rs1.getString(2);
	//System.out.println(InTime);
	//System.out.println(OutTime);

	if(InTime != null){
		%>
		
		<h2 style ='color: Red; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is already Checked In </h2>
		<% 
	}
	else{
		String query1 = "update empl_time set E_Id =?, Date=?, In_Time=? where E_Id=? ";
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, id);
		ps1.setString(2,Cur_date );
		ps1.setString(3, time);
		ps1.setString(4, id);
		ps1.executeUpdate();
		%>
		<h2 style ='color: Green; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is Checked In </h2>
		<% 
	}
}

%>


</body>
</html>