<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>

	$(document).ready(function(){

		$('tbody td:not(td:first-of-type)').on('click', function(){
			var noticeNo = $(this).parent().data('notice_no');
			location.href='${contextPath}/notice/detail?noticeNo=' + noticeNo;
		})

		var checkAll = $('#checkAll');
		var checkes = $('.checkes');
		checkAll.on('click', function(){
			for(let i = 0; i < checkes.length; i++) {
				// checkes[i].prop('checked', true);  // 전체 선택이 체크된 경우
				// checkes[i].prop('checked', false); // 전체 선택이 해제된 경우
				$(checkes[i]).prop('checked', checkAll.prop('checked'));
			}
			$.each(checkes, function(i, check){
				$(check).prop('checked', checkAll.prop('checked'));
			})
		})
		
		for(let i = 0; i < checkes.length; i++){
			$(checkes[i]).on('click', function(){
				for(let j = 0; j < checkes.length; j++){
					if($(checkes[j]).prop('checked') == false){  // 하나라도 체크 해제되었다면,
						checkAll.prop('checked', false);         // 전체 선택 해제하고,
						return;                                  // 함수 종료(클릭 이벤트 리스너)
					}
				}
				checkAll.prop('checked', true);             // 체크 해제된 것이 하나도 발견되지 않은 경우 전체 선택 체크
			})
		}

	})

</script>
<style>
	.blind { display: none; }
</style>
</head>
<body>

	<a href="${contextPath}/notice/savePage">새 공지 작성</a>

	<hr>

	<form action="${contextPath}/notice/removeList">
		<button>선택삭제</button>

			<table border="1">
			<thead>
				<tr>
					<td>
						<label for="checkAll">전체선택</label>
						<input type="checkbox" id="checkAll" class="blind">
					</td>
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notices}" var="notice">
					<tr data-notice_no="${notice.noticeNo}">
						<td><input type="checkbox" name="noticeNoList" value="${notice.noticeNo}" class="checkes"></td>
						<td>${notice.noticeNo}</td>
						<td>${notice.title}</td>
						<td>${notice.created}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>

</body>
</html>