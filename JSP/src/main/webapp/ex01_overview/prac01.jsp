<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		<select name="month">
			<option value="">월 선택</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			...
			<option value="12">12월</option>
		</select>
	--%>
	
	<select name="month">
		<option value="">월 선택</option>
		<% for(int month = 1; month <= 12; month++) { %>
			<option value="<%=month%>"><%=month%>월</option>
		<% } %>
	</select>

</body>
</html>