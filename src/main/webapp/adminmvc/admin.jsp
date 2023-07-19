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
	String user = (String)session.getAttribute("user");
	if(user != null){
		%>
		<a href="../studentmvc/StudentView.jsp">Nhap sinh vien</a>
		<a href="../studentmvc2/StudentView.jsp">Nhap sinh vien version 2</a>
		<%
	}else{
		request.setAttribute("message", "CHUA DANG NHAP");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../loginmvc/login.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
	%>
</body>
</html>