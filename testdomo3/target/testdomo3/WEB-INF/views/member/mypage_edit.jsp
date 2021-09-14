<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script defer type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" charset="utf-8"></script>
    <script defer src="<c:url value='/js/member/insert.js'/>"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/frame/default/header.jsp" %>
<div class="section">
    <div class="box">
        <%@ include file="/WEB-INF/frame/member/member-mypage-nav.jsp" %>
        <div class="edit_section">
            <form method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>
                            <img id="profile"
                                 src="<c:url value='/images/member/profile/${member.memberProfile}'/>" onclick="doImgPop(this.src)">
                        </td>
                        <td>
                            <div class="profileSection">
                                <p id="id" class="text_bold">${member.memberNickname}</p>
                                <label for="memberPhoto" class="changeProfile" style="cursor:pointer">프로필사진바꾸기</label>
                                <input type="file" id="memberPhoto" name="memberPhoto" style="display:none" >
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td><label for="name">이름</label></td>
                        <td><input type="text" id="name" name="memberName"
                                   class="form-control" required="required" value="${member.memberName}" required></td>
                    </tr>
                    <tr>
                        <td><label for="nickname">닉네임</label></td>
                        <td><input type="text" id="nickname" name="memberNickname"
                                   class="form-control" required="required" value="${member.memberNickname}" required>
                                   <span id="msg" class="display_none"></span><img id="loadingimg" class="display_none" alt="loading"
						src="<c:url value="/images/default/loading.gif"/>"></td>
                    </tr>
                    <tr id="divide">
                        <td></td>
                        <td>
                            <p>개인정보</p>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="email">이메일</label></td>
                        <td><input type="text" id="email" name="memberEmail"
                                   class="form-control" required="required" value="${member.memberEmail}" required></td>
                    </tr>
                    <tr>
                        <%--    <fmt:formatDate value="${member.memberBirth}" pattern="yyMMdd" timeZone="UTC+9" /> --%>
                        <td><label>생년월일</label></td>
                        <td><input type="text" id="memberBirth" name="birth"
                                   class="form-control" required="required" value="${member.memberBirth}" required>
                            <%--   <div class="birth">
                                  <div class="table_cell">
                                      <input type="number" placeholder="년(4자)" class="form-control" required="required">
                                  </div>
                                  <div class="table_cell">
                                      <select class="form-control" required="required">
                                          <option value="1">1월</option>
                                          <option value="1">2월</option>
                                          <option value="1">3월</option>
                                          <option value="1">4월</option>
                                          <option value="1">5월</option>
                                          <option value="1">6월</option>
                                          <option value="1">7월</option>
                                          <option value="1">8월</option>
                                          <option value="1">9월</option>
                                          <option value="1">10월</option>
                                          <option value="1">11월</option>
                                          <option value="1">12월</option>
                                      </select>
                                  </div>
                                  <div class="table_cell">
                                      <input type="number" placeholder="일" class="form-control" required="required" value="${member.memberBirth}">
                                  </div>
                              </div> --%>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="변경하기"
                                   class="form-control btn-secondary"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/frame/default/footer.jsp" %>

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