<%@ include file = "timeOut.jsp" %>
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
	
if(rs1.next()== false){
	%>
	
	<h2 style ='color: Red; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is Not Checked In </h2>
	<% 
}
else{
	String InTime = rs1.getString(1);
	String OutTime = rs1.getString(2);
	//System.out.println(InTime);
	//System.out.println(OutTime);
	
	if(OutTime != null){
%>
		
		<h2 style ='color: Red; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is already Checked Out </h2>
		<% 
	}
	else{
		String[] x=InTime.split(":");
		int Intotal=Integer.parseInt(x[0])*3600+Integer.parseInt(x[1])*60+Integer.parseInt(x[2]);
		String[] y=time.split(":");
		int Outtotal=Integer.parseInt(y[0])*3600+Integer.parseInt(y[1])*60+Integer.parseInt(y[2]);
		int totals=Outtotal-Intotal;
		int h=totals/3600;
		int s=totals%3600;
		int m=s/60;
		s=s%60;
		String total=h+":"+m+":"+s;
		
		String query1 = "update empl_time set  Out_Time=?, Total_Time=? where E_Id=?  and Date = ?";
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, time);
		ps1.setString(2,total);
		ps1.setString(3, id);
		ps1.setString(4, Cur_date);
		ps1.executeUpdate();
		%>
		<h2 style ='color: Green; text-align:center; font-family:Garamond; font-size:30px '>Employee <%=id%> is Checked Out </h2>
		<% 
	}
}


%>


</body>
</html>