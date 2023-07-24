<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body background="ebg.jpg">
<form action= 'saveRecord.jsp' method = 'post'>
<table style=' border: 3px solid black;margin:auto; margin-top:10px'>
<tr>
<td class = "tdp"> Enter Employee Id</td>
<td class = "tdp"><input type = "text" name = Eid class = "tp" required></td>
</tr>
<tr>
<td class = "tdp"> Enter Employee Name  </td>
<td class = "tdp"><input type = "text" name = Ename class = "tp"  required></td>
</tr>
<tr>
<td class = "tdp"> Select Employee Department</td>
<td class = "tdp">
<select class = "tp" style='font-size:22px' name='Edept'>
     	 <option>Data Analyst</option>
     	 <option>User Interface</option>
     	 <option>Research</option>
     	 <option>Sales</option>
     	 <option>Security</option>
     	 <option>Technical desk</option>
     	 <option>Project Management</option>
     	 <option>Testing</option>
     	 <option>OPerations</option>
     	 <option>Development</option>
     	</select>
</td>
</tr>
<tr>
	<td colspan="2" align="center" style = "padding: 10px ">
	<button style ="font-family:Garamond;font-size:30px; padding: 1px 15px; color:white; background-color:082032; border-radius:5px">Save</button>
	</td>
	</tr>
</table>
</form>
</body>
</html>