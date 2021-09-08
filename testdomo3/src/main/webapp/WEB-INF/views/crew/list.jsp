<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/crew/crew-list.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	
	var cList=[];
	cList=null;
	
	$.ajax({
		url:'<c:url value="/crew/searchTypeRest"/>',
		type:'GET',
		data:{searchType:'${searchType}'},
		dataType : 'json',
		success:function(data){
			cList = data;
			crewList(cList);
		}
	});
	
	$.ajax({
		url:'<c:url value="/crew/crewName"/>',
		type:'GET',
		data:{searchType:'${searchType}'},
		dataType : 'json',
		success:function(data){
			cList = data;
			crewList(cList);
		}
	});
	
	$('#nameList').click(function(){
		console.log("이름순으로 정렬");
	  console.log(cList);
	  cList.sort(function(a,b){
		  a = a.crewName;
			b = b.crewName;
		return a < b ? - 1 : a > b ? 1 : 0;
		});
	crewList(cList);
	});
	
	$('#newestList').click(function(){
		console.log("최신순으로 정렬");
	  console.log(cList);
	  cList.sort(function(a,b){
		a = a.crewCreatedate;
		b = b.crewCreatedate;
		return a > b ? -1 : a < b ? 1 : 0;
		});
	crewList(cList);
	});
	
	$('#oldList').click(function(){
		console.log("오래된순으로 정렬");
	  console.log(cList);
	  cList.sort(function(a,b){
			a = a.crewCreatedate;
			b = b.crewCreatedate;
		  return a < b ? -1 : a > b ? 1 : 0;
		});
	crewList(cList);
	});
});

function crewList(cList){
		var ccList=[];
		ccList=cList;
		console.log("리스트 함수 호출");
		console.log(ccList);
	
				var html='<div id="row" class="row">';
				
	  		$.each(ccList,function(index,item){
					html+='<div class="col-md-4">';
					html+='<div class="card shadow">';
					html+='<div class="inner">';
					html+='<div>';
					html+='<a href="<c:url value="/crew/detail/'+item.crewIdx+'&1"/>">';
					html+='<img src="<c:url value="/images/crew/'+item.crewPhoto+'"/>"  class="card-img-top" alt="card image cap">';
          html+='<div class="card-body text-left">';
          html+='<h4 class="card-title">크루 이름: '+item.crewName+' </h4>';
          html+='<p class="card-text">크루장: '+item.memberNickName+'</p>';
          html+='<p class="card-text">크루소개 : '+item.crewDiscription+'</p>';
          html+='<a href="#" class="btn btn-success">GO</a>';
          html+='</div>';
          html+='</a>';
					html+='</div>';
					html+='</div>';
					html+='</div>';
					html+='</div>';
					
					$('#cList').html(html);
				});
}
</script>
</head>
<%@ include file="/WEB-INF/frame/default/header.jsp"%>
<body>
	<div class="section">

		<div class="article">
			<h1>MY CREW</h1>

			<c:if test="${myCrewList ne null and not empty myCrewList}">
				<c:forEach items="${myCrewList}" var="crew">

					<div class="article-crew">
						<div>
							<a href='<c:url value="/crew/detail/${crew.crewIdx}&1"/>'> <img
								src="<c:url value='/images/crew/${crew.crewPhoto}'/>"></a>
						</div>
						<p>${crew.crewName}</p>
					</div>

				</c:forEach>
			</c:if>

		</div>

		<div class="container">
			<div class="search-box">
				<div class="dropdown">
					<h1>POPULAR CREW</h1>
					<button class="curved" id="nameList">이름순으로 보기</button>
					<button class="curved" id="newestList">최신순으로 보기</button>
					<button class="curved" id="oldList">오랜된 순으로 보기</button>
				</div>
				<form action="" name="frm">
					<div class="search-drop">
						<div class="searchType">
							<select name="searchType">
								<option value="name">크루 이름</option>
								<option value="nickName">닉네임</option>
								<option value="tag">해시태그</option>
							</select>
						</div>
						<div class="boxSearch">
							<span class="icon"><i class="fa fa-search"
								aria-hidden="true" onclick="search_onclick_submit"></i></span> <input
								id="search" class="search"
								onkeypress="if( event.keyCode == 13 ){search_onclick_submit;}"
								type="text" name="keyword" placeholder="Type to search">
						</div>
					</div>
				</form>
			</div>
			<div id="cList">
				<div class="row justify-content-center">
				</div>
			</div>
		</div>


		<div class="page">
			<nav aria-label="Page navigation example">

				<c:if test="${listView.totalPageNum>0}">
					<ul class="pagination">

						<c:forEach begin="1" end="${listView.totalPageNum}" var="num">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span> </a></li>
							<li class="page-item"><a class="page-link"
								href="<c:url value=''/>">1</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</c:forEach>

					</ul>
				</c:if>

			</nav>
			<div class="crew-insert">
				<a href="<c:url value='/crew/insert'/>">크루 생성하기</a>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/frame/default/footer.jsp"%>
</body>
</html>