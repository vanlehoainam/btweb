<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String dbServer = application.getInitParameter("dbServer");
	String dbAddress = application.getInitParameter("dbAddress");
	String dbPort = application.getInitParameter("dbPort");
	String database = application.getInitParameter("database");
	out.print("jdbc: Mysql:// " + dbAddress + ":" + dbPort + "/" + database + "/" + dbServer);
	String username = application.getInitParameter("username");
	String password = application.getInitParameter("password");
	out.println(username);
	out.println(password);
	String dbDriver = application.getInitParameter("dbDriver");
	out.print(dbDriver);
	%>
</body>
</html>