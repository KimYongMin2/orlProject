<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/css/member/mypage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script defer src="<c:url value='/js/member/insert.js'/>"></script>
</head>
<body>
<%@ include file="/WEB-INF/frame/default/header.jsp"%>
	<div id="all">
		<section class="forgot-pw">
			<h1>MyPage</h1>
			<form method="post" enctype="multipart/form-data">
				<div class="input-area" id="wrapImg">
					<img id="profile"
						src="<c:url value='/images/member/profile/${member.memberProfile}'/>"
						onclick="doImgPop(this.src)">
						<span id="id">${member.memberNickname}</span>
						<input type="file" id="memberPhoto" name="memberPhoto" style="display: none">
						<label for="memberPhoto" class="changeProfile" style="color:#FDEF7B">프로필사진바꾸기</label> 
				</div>
				<div class="input-area">
					
					<input type="text" id="name"
						name="memberName" autocomplete="off"
						value="${member.memberName}" required>
						<label for="name">이름</label> 
				</div>

				<div class="input-area">
					<input type="text" id="nickname" name="memberNickname"
						class="form-control" autocomplete="off"
						value="${member.memberNickname}" required> 
					<label for="nickname">닉네임</label>
					<span id="msg" class="display_none"></span>
					<img id="loadingimg" class="display_none" alt="loading"
						src="<c:url value="/images/default/loading.gif"/>">
				</div>


				<div class="input-area">
					<input type="text" id="email"
						name="memberEmail" class="form-control" autocomplete="off"
						value="${member.memberEmail}" required>
					<label for="email">이메일</label> 
				</div>

				<div class="input-area">
					<input type="text" id="memberBirth"
						name="birth" class="form-control" autocomplete="off"
						value="${member.memberBirth}" required>
					<label>생년월일</label> 
				</div>
				

			<div class="caption">
					 <a href="<c:url value='/member/mypage/pwchange'/>">비밀번호 변경하기</a>
				</div>


				<div class="btn-area">
					<input type="submit" value="변경하기"	class="form-control btn-secondary"> 
				</div>
			</form>

		</section>
	</div>
	<script>
	$(document).ready(function(){
		
		$('#nickname').focusin(function(){
			$('#msg').addClass('display_none');
			$('#msg').removeClass('color_blue');
			$('#msg').removeClass('color_red');
			$(this).val('');
		});
		$('#nickname').focusout(function(){
			
			$.ajax({
				url:'<c:url value="/member/nickNameCheck"/>',
				type:'get',
				data:{
					nickname:$(this).val()
				},
				beforeSend:function(){
					$('#loadingimg').removeClass('display_none');
				},
				success : function(data) {
					// data : Y / N
					if (data == 'Y') {
						$('#msg').html('사용가능');
						$('#msg').addClass('color_blue');
						$('#msg').removeClass('display_none');
					} else {
						$('#msg').html('사용 불가능');
						$('#msg').addClass('color_red');
						$('#msg').removeClass('display_none');
					}
				},
				error : function(request, status, error) {
					alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);
				},
				complete : function() {
					$('#loadingimg').addClass('display_none');
				}
			});
		});
		
		
		
		
		
		
		
	});

</script>
	
</body>
</html>