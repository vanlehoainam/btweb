<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
	String user = (String)session.getAttribute("user");
	if(user == null){
		request.setAttribute("message", "CHUA DANG NHAP");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../loginmvc/login.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
		
	String msg = (String) request.getAttribute("message");
	if(msg != null){
		out.print(msg);
	}
	
	%>
	<div class="container">
		<h2>Form Nhập Thông Tin Sinh Viên</h2>
		<form id="studentForm" action="StudentController.jsp" method="POST">
			<div class="form-group">
				<label for="idstudent">ID Sinh viên:</label> <input type="text"
					class="form-control" id="idstudent" name="idstudent"
					placeholder="Nhập ID sinh viên" onblur="validateIDStudent()">
				<span id="idstudentError" class="text-danger"></span>
			</div>
			<div class="form-group">
				<label for="hoten">Họ tên:</label> <input type="text"
					class="form-control" id="hoten" name="hoten"
					placeholder="Nhập họ tên" onblur="validateHoTen()"> <span
					id="hotenError" class="text-danger"></span>
			</div>
			<div class="form-group">
				<label for="ngaysinh">Ngày sinh:</label> <input type="date"
					class="form-control" id="ngaysinh" name="ngaysinh"
					onblur="validateNgaySinh()"> <span id="ngaysinhError"
					class="text-danger"></span>
			</div>
			<div class="form-group">
				<label for="gioitinh">Giới tính:</label> <select
					class="form-control" id="gioitinh" name="gioitinh">
					<option value="Nam">Nam</option>
					<option value="Nữ">Nữ</option>
					<option value="Không xác định">Không xác định</option>
				</select>
			</div>
			<div class="form-group">
				<label for="sdt">Số điện thoại:</label> <input type="text"
					class="form-control" id="sdt" name="sdt"
					placeholder="Nhập số điện thoại" onblur="validateSDT()"> <span
					id="sdtError" class="text-danger"></span>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// Validate function for ID Sinh viên
							function validateIDStudent() {
								var idstudent = $('#idstudent').val().trim();
								if (idstudent === '') {
									$('#idstudentError').text(
											'Vui lòng nhập ID Sinh viên');
								} else if (isNaN(idstudent)) {
									$('#idstudentError').text(
											'ID Sinh viên phải là một số');
								} else {
									$('#idstudentError').text('');
								}
							}

							// Validate function for Họ tên
							function validateHoTen() {
								var hoten = $('#hoten').val().trim();
								if (hoten === '') {
									$('#hotenError').text(
											'Vui lòng nhập Họ tên');
								} else {
									$('#hotenError').text('');
								}
							}

							function validateNgaySinh() {
								  var ngaysinh = $('#ngaysinh').val().trim();
if (ngaysinh === '') {
								    $('#ngaysinhError').text('Vui lòng chọn Ngày sinh');
								  } else {
								    var selectedDate = new Date(ngaysinh);
								    var currentDate = new Date();
								    if (selectedDate > currentDate) {
								      $('#ngaysinhError').text('Ngày sinh không được trong tương lai');
								    } else {
								      $('#ngaysinhError').text('');
								    }
								  }
								}


							// Validate function for Số điện thoại
							function validateSDT() {
								var sdt = $('#sdt').val().trim();
								if (sdt === '') {
									$('#sdtError').text(
											'Vui lòng nhập Số điện thoại');
								} else if (sdt.length !== 10) {
									$('#sdtError')
											.text(
													'Số điện thoại phải có đúng 10 kí tự');
								} else {
									$('#sdtError').text('');
								}
							}
							// Bind blur event handler to the input fields
							$('#idstudent').on('blur', validateIDStudent);
							$('#hoten').on('blur', validateHoTen);
							$('#ngaysinh').on('blur', validateNgaySinh);
							$('#sdt').on('blur', validateSDT);

							// Submit event handler for the form
							$('#studentForm')
									.on(
											'submit',
											function(event) {
												// Perform validation for all fields
												validateIDStudent();
												validateHoTen();
												validateNgaySinh();
												validateSDT();

												// Prevent form submission if any field is invalid
												if ($('#idstudentError').text() !== ''
														|| $('#hotenError')
																.text() !== ''
														|| $('#ngaysinhError')
																.text() !== ''
														|| $('#sdtError')
																.text() !== '') {
													event.preventDefault();
												}
											});
						});
	</script>
</body>
</html>