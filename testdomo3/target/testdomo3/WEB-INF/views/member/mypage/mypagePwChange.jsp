<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/member/mypagePw.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
</head>
<body>
<%@ include file="/WEB-INF/frame/default/header.jsp"%>
<div id="all">
    <section class="forgot-pw">
        <h1>Change Password</h1>
        <form method="post">
            <div class="input-area">
               <input type="password" id="pw" name="pw"
								class="form-control" required>
               <label for="pw">이전 비밀번호</label>
            </div>

            <div class="input-area">
                <input type="password" id="newpw" name="newpw"
								class="form-control" required>
                <label for="newpw">새 비밀번호</label>
            </div>

            
            <div class="input-area">
                  <input type="password" id="newpw2" name="newpw2"
								class="form-control" required>
               <label for="newpw2">새 비밀번호 확인</label>
            </div>

            <div class="btn-area">
                <input type="submit" value="비밀번호 변경"
								class="form-control btn-secondary">
            </div>
            	<div class="caption">
					<a href="<c:url value="/member/forgotPw"/>">
									<p class="pw_link">비밀번호를 잊으셨나요?
				</div>
        </form>

    </section>
    </div>
</body>
</html>