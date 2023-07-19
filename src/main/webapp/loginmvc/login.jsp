<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	String msg = (String) request.getAttribute("message");
	if(msg != null){
		out.print(msg);
	}
	%>
<form action="LoginController.jsp" method="POST">
		Username: <input type="text" name="username"><br>
		Password: <input type="password" name="password"><br>
		<input type="submit" value="LOGIN">
	</form>
</body>
</html>