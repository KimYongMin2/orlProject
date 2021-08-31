<%@ page import="com.bitcamp.orl.mountain.domain.MountainLocInfo" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지역별산</title>
    <link rel="stylesheet" href="<c:url value='/css/mountain/local.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
</head>
<body>
<%@ include file="/WEB-INF/frame/default/header.jsp" %>

<!--중간 부분 전부-->
<div class="main">
    <!--왼쪽 컨텐츠-->
    <div class="main_content">
        <span>300()(여기 바뀌여야됨)() 개의 산</span>
        <h1>${loc}</h1>
        <div class="search">
            <div class="iconsearch"></div>
            <div class="input">
                <input type="text" placeholder="산 이름을 검색하세요" id="mysearch">
            </div>
            <span id='clearIcon' class="clear" style="display:none;"
                  onclick="document.getElementById('mysearch').value=''"></span>
        </div>

        <script>
            const iconsearch = document.querySelector('.iconsearch');
            const search = document.querySelector('.search');
            const clearIcon = document.getElementById("clearIcon");
            iconsearch.onclick = function () {
                search.classList.toggle('active')
                if (clearIcon.style.display == 'none') {
                    clearIcon.style.display = 'block';
                } else {
                    clearIcon.style.display = 'none';
                }
            }
        </script>


        <div class="main_filters">
            <button class="outlined curved">이름순으로 보기</button>
            <button class="outlined curved">높이순으로 보기</button>
            <button class="outlined curved">인기순으로 보기</button>
        </div>


        <div class="main_scarcity">
            <img src="" alt="">
            <span>
                    <span>

                        산 이름을 입력하시면 해당 산에 대한 정보를 확인할 수 있습니다.
                    </span>
                검색하기 전에 지도로 주변 산들을  둘러보세요.
                </span>
        </div>
        <%
            List<MountainLocInfo> mountainLocInfoList = (List<MountainLocInfo>) request.getAttribute("mountainLocInfoList");
            for (int i = 0; i < mountainLocInfoList.size(); i++) {
                request.setAttribute("mountainLocInfo", mountainLocInfoList.get(i));

        %>`

        <div class="listings">
            <div class="listings_item">
                <div class="listings_image">
                    <%--                    <button>--%>
                    <%--                        <i class="fas fa-angle-left"></i>--%>
                    <%--                    </button>--%>
                    <%--                    <button>--%>
                    <%--                        <i class="fas fa-angle-right"></i>--%>
                    <%--                    </button>--%>
                    <img src="https://www.forest.go.kr/images/data/down/mountain/${mountainLocInfo.img}" alt="">
                </div>
                <div class="listings_content">
                    <div class="listings_title">
                        <div class="listings_text">
                            <span class="greyText">${loc} 산 전체</span>
                            <h2>#${mountainLocInfo.mountainName}</h2>
                        </div>
                    </div>
                    <div class="separator"></div>
                    <div class="listings_description">
                        <span class="greyText">${mountainLocInfo.mountainAddress}</span>
                        <span class="greyText">${mountainLocInfo.mountainInfo}</span>
                    </div>

                </div>
            </div>
        </div>

        <%
            }
        %>
    </div>


    <!--오른쪽 지도-->
    <div class="main_map">
        <div class="main_kakaoMap">
            <div class="map" id='map'></div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/frame/default/footer.jsp" %>

<!--카카오 지도 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5188ac15584cefe54aea3746f43ba94"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.549530, 128.488619),
        level: 11
    };
    var map = new kakao.maps.Map(container, options);

    // 마커를 표시할 위치와 title 객체 배열입니다
    var positions = [
        {
            title: '<%=mountainLocInfoList.get(0).getMountainName()%>',
            lating: new kakao.maps.LatLng(<%=mountainLocInfoList.get(0).getLongitude()%>, <%=mountainLocInfoList.get(0).getLatitude()%>)
        }
        <%
        for(int i = 1; i < mountainLocInfoList.size(); i++) {
            %>,{
            title: '<%=mountainLocInfoList.get(i).getMountainName()%>',
            lating: new kakao.maps.LatLng(<%=mountainLocInfoList.get(i).getLongitude()%>, <%=mountainLocInfoList.get(i).getLatitude()%>)
        }
        <%
        }
        %>
    ];

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "${pageContext.request.contextPath}/images/mountain/seedling-solid.png";

    for (var i = 0; i < positions.length; i++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(20, 20);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].lating, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage // 마커 이미지
        });
    }

</script>


</body>


</html>