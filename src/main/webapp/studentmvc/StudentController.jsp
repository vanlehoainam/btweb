<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pxu.edu.vn.bt6.Student"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8" import="pxu.edu.vn.bt6.Student"
	import="pxu.edu.vn.bt6.StudentModel" import="java.util.Date"
	import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//Lay du lieu tu form
		String hoten = (String) request.getParameter("hoten");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date ngaysinh = df.parse(request.getParameter("ngaysinh"));
		String gioitinh = (String) request.getParameter("gioitinh");
		String sdt = (String) request.getParameter("sdt");
		//out.println(hoten + "; " + ngaysinh.toString() + "; " + gioitinh + "; " + sdt);
		//Goi StudentModel de luu doi tuong sv vao CSDL
		Student sv = new Student();
		sv.setHoten(hoten);
		sv.setGioitinh(gioitinh);
		sv.setNgaysinh(ngaysinh);
		sv.setSdt(sdt);
		StudentModel myModel = new StudentModel();
		boolean kq = myModel.addStudent(sv);
		if (kq) {
			request.setAttribute("message", "THEM SINH VIEN THANH CONG");
		} else {
			request.setAttribute("message", "THEM SINH VIEN THAT BAI");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	%>
</body>
</html>