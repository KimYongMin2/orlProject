<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="<c:url value='/css/member/reg.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="reg_box">
    <div class="box2">
        <div class="logo">
            <h1>
                <a href="<c:url value='/'/>">오를래</a>
            </h1>
            <p>새로운 회원들과 함께 산을 탐험해보세요!</p>
        </div>
        <div class="naver_login">
            <button class="naver_btn">네이버로 로그인</button>
        </div>
        <div class="etc">또는</div>
        <div class="sign_section">
            <form method="post">
                <div class="int-area">

                    <input type="text" name="memberId" id="id" autocomplete="off"
                           required> <label for="id">ID</label> <span id="msg" class="display_none"></span>
                    <img id="loadingimg" class="display_none" alt="loading"
                         src="<c:url value="/images/default/loading.gif"/>">
                    <span id="msgchk"></span>
                </div>
                <div class="int-area">

                    <input type="password" name="memberPw" id="pw" autocomplete="off" required>
                    <label for="pw">PASSWORD</label>
                    <span id="msgchk2"></span>
                </div>
                <div class="int-area">
                    <input type="password" name="memberPw2" id="pw2" autocomplete="off" required>
                    <label for="pw2">PASSWORD 확인</label>
                    <span id="msgchk3"></span>
                </div>
                <div class="int-area">
                    <input type="text" name="memberName" id="name" autocomplete="off" required>
                    <label for="name">이름</label>
                    <span id="msgchk4"></span>
                </div>
                <div class="int-area">

                    <input type="text" name="memberEmail" id="email" autocomplete="off" required>
                    <label for="email">E-mail</label>
                    <span id="msg3" class="display_none"></span>
                    <img id="loadingimg3" class="display_none" alt="loading"
                         src="<c:url value="/images/default/loading.gif"/>">
                    <span id="msgchk5"></span>
                </div>
                <div class="int-area">
                    <input type="text" name="memberNickname" id="nickname" autocomplete="off" required>
                    <label for="nickname">닉네임</label>
                    <span id="msg2" class="display_none"></span>
                    <img id="loadingimg2" class="display_none" alt="loading"
                         src="<c:url value="/images/default/loading.gif"/>">
                    <span id="msgchk6"></span>
                </div>
                <div class="birth">
                    <div class="int-area table_cell">
                        <input type="number" name="year" id="year" autocomplete="off" required>
                        <label for="year">년(4자)</label>
                    </div>
                    <div class="int-area table_cell select_opt">
                        <select id="month" name="month">
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                    </div>
                    <div class="int-area table_cell">
                        <input type="number" name="date" id="date" autocomplete="off" required>
                        <label for="date">일</label>
                    </div>
                </div>
                <div class="btn-area">
                    <input type="submit" value="가입">
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    //모든 공백 체크 정규식
    var empJ = /\s/g;
    //아이디
    var idJ = /^[[A-Za-z0-9]{4,12}$/;
    // 비밀번호
    var pwJ = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    // 이름
    var nameJ = /^[가-힣]{2,6}$/;
    // 닉네임
    var ninkJ = /^[가-힣][A-Za-z0-9]{4,12}$/;
    // 이메일 검사
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


    $(document).ready(function () {

        // 비동기통신 스타일 속성
        $('#id').focusin(function () {
            $('#msg').addClass('display_none');
            $('#msg').removeClass('color_yellow');
            $('#msg').removeClass('color_red');
            $('#msgchk').addClass('display_none');
            $(this).val('');
        });

        //1. 아이디 유효성 체크
        $("#id").blur(function () {
            if (idJ.test($(this).val())) {
                console.log(idJ.test($(this).val()));
                $("#msgchk").text('');
                // 유효성 체크 되면 비동기통신으로  id 중복 체크
                $.ajax({
                    url: '<c:url value="/member/idCheck"/>',
                    type: 'get',
                    data: {
                        mid: $(this).val()
                    },
                    beforeSend: function () {
                        $('#loadingimg').removeClass('display_none');
                    },
                    success: function (data) {
                        // data : Y / N
                        if (data == 'Y') {
                            $('#msg').html('사용가능');
                            $('#msg').addClass('color_yellow');
                            $('#msg').removeClass('display_none');
                        } else {
                            $('#msg').html('사용 불가능');
                            $('#msg').addClass('color_red');
                            $('#msg').removeClass('display_none');
                        }
                    },
                    error: function (request, status, error) {
                        alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
                        console.log(request);
                        console.log(status);
                        console.log(error);
                    },
                    complete: function () {
                        $('#loadingimg').addClass('display_none');
                    }
                });

            } else {
                /*    alert('아이디는 4자 이상 12자 이하여야하며 ,대문자/소문자/숫자만 사용할 수 있습니다.'); */
                $('#msgchk').removeClass('display_none');
                $('#msgchk').text('아이디는 4자 이상 12자 이하여야하며 ,대문자/소문자/숫자만 사용할 수 있습니다.');
                $('#msgchk').css('color', '#f82a2aa3');
            }
        });


        // 2.비밀번호 유효성 체크

		$('#pw').focusin(function () {
			$('#msgchk2').addClass('display_none');
			$(this).val('');
		});


        $("#pw").blur(function () {
            if (pwJ.test($(this).val())) {
                console.log(pwJ.test($(this).val()));
                $("#msgchk2").text('');
            } else {
                /*    alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.'); */
				$('#msgchk2').removeClass('display_none');
				$('#msgchk2').text('숫자/소문자/특수문자를 모두 포함한 8자리 이상이여야합니다.');
                $('#msgchk2').css('color', '#f82a2aa3');
            }
        });

        // 3. 비밀번호 확인 체크
        $('#pw').keyup(function () {
            $('#chkNotice').html('');
        });

        $('#pw2').keyup(function () {

            if ($('#pw').val() != $('#pw2').val()) {
                $('#msgchk3').html('비밀번호가 일치하지 않습니다.');
                $('#msgchk3').css('color', '#f82a2aa3');
            } else {
                $('#msgchk3').html('비밀번호가 일치합니다.');
                $('#msgchk3').css('color', '#199894b3');
            }

        });

        // 4. 이름 체크
		$('#name').focusin(function () {
			$('#msgchk4').addClass('display_none');
			$(this).val('');
		});

		$("#name").blur(function () {
			if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#msgchk4").text('');
			} else {
				/* alert('이름은 2자 이상 6자 이하여야 하며, 한글만을 사용해야 합니다.'); */
				$('#msgchk4').removeClass('display_none');
				$('#msgchk4').text('이름은 2자 이상 6자 이하여야 하며, 한글만을 사용해야 합니다.');
				$('#msgchk4').css('color', '#f82a2aa3');
			}
		});


		// 5. email 체크
		$('#email').focusin(function () {
			$('#msgchk5').addClass('display_none');
			$('#msg3').addClass('display_none');
			$('#msg3').removeClass('color_yellow');
			$('#msg3').removeClass('color_red');
			$(this).val('');
		});

		$("#email").blur(function () {
			if (mailJ.test($(this).val())) {
				console.log(mailJ.test($(this).val()));
				$("#msgchk5").text('');
					$.ajax({
						url: '<c:url value="/member/emailCheck"/>',
						type: 'get',
						data: {
							email: $(this).val()
						},
						beforeSend: function () {
							$('#loadingimg3').removeClass('display_none');
						},
						success: function (data) {
							// data : Y / N
							if (data == 'Y') {
								$('#msg3').html('사용가능');
								$('#msg3').addClass('color_yellow');
								$('#msg3').removeClass('display_none');
							} else {
								$('#msg3').html('사용 불가능');
								$('#msg3').addClass('color_red');
								$('#msg3').removeClass('display_none');
							}
						},
						error: function (request, status, error) {
							alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
							console.log(request);
							console.log(status);
							console.log(error);
						},
						complete: function () {
							$('#loadingimg3').addClass('display_none');
						}
					});
			} else {
				/*    alert('이메일을 다시 입력해주세요'); */
				$('#msgchk5').removeClass('display_none');
				$('#msgchk5').text('이메일형식에 맞게 작성해주세요');
				$('#msgchk5').css('color', '#f82a2aa3');
			}
		});

		// 6. 닉네임 체크

        $('#nickname').focusin(function () {
			$('#msgchk6').addClass('display_none');
			$('#msg2').addClass('display_none');
            $('#msg2').removeClass('color_yellow');
            $('#msg2').removeClass('color_red');
            $(this).val('');
        });
		$("#nickname").blur(function () {
			if (ninkJ.test($(this).val())) {
				console.log(ninkJ.test($(this).val()));
				$("#msgchk6").text('');
					$.ajax({
						url: '<c:url value="/member/nickNameCheck"/>',
						type: 'get',
						data: {
							nickname: $(this).val()
						},
						beforeSend: function () {
							$('#loadingimg2').removeClass('display_none');
						},
						success: function (data) {
							// data : Y / N
							if (data == 'Y') {
								$('#msg2').html('사용가능');
								$('#msg2').addClass('color_yellow');
								$('#msg2').removeClass('display_none');
							} else {
								$('#msg2').html('사용 불가능');
								$('#msg2').addClass('color_red');
								$('#msg2').removeClass('display_none');
							}
						},
						error: function (request, status, error) {
							alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
							console.log(request);
							console.log(status);
							console.log(error);
						},
						complete: function () {
							$('#loadingimg2').addClass('display_none');
						}
					});
			} else {
				/* alert('이름은 4자 이상 12자 이하여야 하며, 한글/소문자/대문자만을 사용해야 합니다.'); */
				$('#msgchk6').removeClass('display_none');
				$('#msgchk6').text('닉네임은 4자 이상 12자 이하여야 하며, 한글/소문자/대문자만을 사용해야 합니다.');
				$('#msgchk6').css('color', '#f82a2aa3');
			}
		});


    });

</script>

</body>
</html>