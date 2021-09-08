<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		getCrewMemberList();
		
	});
	
	function getCrewMemberList(){
		$.ajax({
			url: 'http://localhost:8080/orl/crew/getCrewMemberList',
			type: 'GET',
			data: {crewIdx: '${crew.crewIdx}'},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
			success: function(data){
				var html = '';
				$.each(data, function(index, item){
					html += '<tr>';
					html += '<td>'+Number(index+1)+'</td>';
					html += '<td><img id="profile" src="<c:url value="/images/default.jpg"/>"></td>';
					html += '<td id="nickname">'+item.memberNickName+'</td>';
					html += '<td class="date">'+item.crewRegdate+'</td>';
					html += '<td><input type="submit" class="btn" value="추방"></td>';
					html += '</tr>';
				});
				$('#crewMemberList').html(html);
			}
		});
	}
</script>
<%@ include file="/WEB-INF/frame/default/header.jsp"%>
</head>
<body>
	<div class="section">
		<div class="box">
			<%@ include file="/WEB-INF/frame/crew/crew-manage-nav.jsp"%>
			<div class="edit_section">
				<label for="crewname">크루명</label>
				<form>
					<table id="crewMemberList" class="table table-hover">
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</body>
<%@ include file="/WEB-INF/frame/default/footer.jsp"%>
</html>