<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		display: block;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	// 페이지 로드 이벤트
	$(document).ready(function(){
		fnList();
		fnDetail();
		fnAdd();
		fnModify();
		fnRemove();
		fnInit();
	})

	function fnList(){
		$.ajax({
			url: '/AJAX/list.do',
			dataType: 'json',
			success: function(responseText){	//	responseText : {"count":7, "members":[]}
				$('#memberCount').text(responseText.count);
				var no = $('#member.no');
				var memberList = $('#memberList');
				memberList.empty();  // 회원 목록의 초기화
				$.each(responseText.members, function(i, member){
					var tr = '<tr>';
					tr += '<td>' + member.id + '</td>';
					tr += '<td>' + member.name + '</td>';
					tr += '<td>' + member.gender + '</td>';
					tr += '<td>' + member.address + '</td>';
					tr += '<td><input type="button" value="조회" class="btnDetail" data-no="' + member.no + '"></td>';
					tr += '</tr>';
					memberList.append(tr);
				})
			}
		})
	}

	function fnDetail(){
		//	조회 버튼은 (dynamic element)이므로, 부모를 기반으로 이벤트를 등록시킨다.
		$('body').on('click', '.btnDetail', function(){
			var no = $(this).data('no');	//	var no = $(this).data('no');
			$.ajax({
				url: '/AJAX/detail.do',
				data: 'no='+no,
				type: 'GET',
				dataType: 'json',
				success: function(responseText){
					if(responseText.result == true){
						$('#id').val(responseText.member.id).prop('readOnly', true);
						$('#name').val(responseText.member.name);
						$(':radio[name="gender"][value="' + responseText.member.gender + '"]').prop('checked',true);
						$('#address').val(responseText.member.address);
					} else {
						alert('조회된 회원 정보가 없습니다.');
					}
				}
			})
		})
	}

	function fnAdd(){
		// 등록 버튼을 클릭하면 실행
		$('#btnAdd').on('click', function(){
			
			//	요청 URL
			//	http://localhost:9090/AJAX/add.do
				
			//	요청 Method
			//	POST
			
			//	요청 Parameter
			//	id=아이디&name=이름&gender=성별&address=주소
			
			//	요청 Parameter 상세
			//	id		: 신규 회원의 아이디 (필수, 중복 불가)
			//	name	: 신규 회원의 이름
			//	gender	: 신규 회원의 성별
			//	address	: 신규 회원의 주소
			
			$.ajax({
				url:'/AJAX/add.do',
				type: 'POST',
				data: $('#formMember').serialize(),
//				data: 'id=' + $('#id').val() + '&name=' + $('#name').val() + '&gender=' + $(':radio[name="gender"]:checked').val() + '&address=' + $('#address').val(),
				dataType: 'json',
				success: function(responseText){
					if(responseText.res==1){
						alert('신규 회원이 등록되었습니다.');
						fnList();
						$('#id').val('');
						$('#name').val('');
						$(':radio[name="gender"]').prop('checked', false);
						$('#address').val('');
					}
				},
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.responseText);
				}
			})
		})
	}

	function fnModify(){
		// 수정 버튼을 클릭하면 실행
		
	}
	function fnRemove(){
		// 삭제 버튼을 클릭하면 실행
		
	}
	function fnInit(){
		$('#btnInit').on('click', function(){
			$('#id').val('').prop('readOnly', false);
			$('#name').val('');
			$(':radio[name="gender"]').prop('checked', false);
			$('#address').val('');
		})
	}
	</script>
</head>
<body>
	<h1>회원관리</h1>
	<div>
		<form id="formMember">
			<label for="id">
				아이디
				<input type="text" name="id" id="id">
			</label>
			<label for="name">
				이름
				<input type="text" name="name" id="name">
			</label>
			<label for="male">
				남자
				<input type="radio" name="gender" id="male" value="male">
			</label>
			<label for="female">
				여자
				<input type="radio" name="gender" id="female" value="female">
			</label>
			<label for="address">
				주소
				<input type="text" name="address" id="address">
			</label>
			<div>
				<input type="button" value="초기화" id="btnInit">
				<input type="button" value="등록" id="btnAdd">
				<input type="button" value="수정" id="btnModify">
				<input type="button" value="삭제" id="btnRemove">
			</div>
		</form>
	</div>
	<hr>
	<div>
		<cation>회원수 : <span id="memberCount"></span>명</cation>
		<table border="1">
			<thead>
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>성별</td>
					<td>주소</td>
					<td>버튼</td>
				</tr>
			</thead>
			<tbody id="memberList">
			</tbody>
		</table>
	</div>
</body>
</html>