<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
		scope 속성이 없으면 현재 페이지에서만 contextPath 속성을 사용할 수 있다.
		scope속성 : page(디폴트), request, session, application
	-->
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<a href="${contextPath}/board/detail">게시판 상세보기</a>
	<a href="${contextPath}/member/detail">회원 상세보기</a>
</body>
</html>