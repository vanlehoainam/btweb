<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../error.html"
	import="pxu.edu.vn.bt1.productmodel" import="java.util.*"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!public ArrayList<productmodel> getProduct() {
		ArrayList<productmodel> results = new ArrayList();
		results.add(new productmodel(1, "huda"));
		results.add(new productmodel(2, "saigon"));

		return results;

	}%>
	<%
	ArrayList<productmodel> dssp = getProduct();
	
	%>

	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>Tên sản phẩm</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (productmodel itr : dssp) {
			%>
			<tr>
				<td>
					<%
					out.print(itr.getProductID());
					%>
				</td>
				<td>
					<%
					out.print(itr.getProductName());
					%>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<%
			} //đóng vòng lặp for
			%>
		</tbody>
	</table>
</body>
</html>