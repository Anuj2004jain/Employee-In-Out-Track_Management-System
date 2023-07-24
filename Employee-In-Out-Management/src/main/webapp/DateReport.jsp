<%@ include file = 'Home.jsp' %>
<html>
<head>
<meta charset="UTF-8">
<title>EIOT Technologies</title>
</head>
<body>
<form action="showDateWise.jsp" method = "post">
<table style=' border: 3px solid black;margin:auto; margin-top:10px'>
<tr>
<td class = "tdp" > Select Date </td>
<td class = "tdp">
<input class = "tdp" type="date" id="date" name="date" required >
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