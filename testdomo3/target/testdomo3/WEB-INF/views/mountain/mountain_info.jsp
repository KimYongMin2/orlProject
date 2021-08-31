<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mountain_Info</title>
    <link rel="stylesheet" href="<c:url value='/css/mountain/mountain_info.css'/>">
</head>
<body>
<%@ include file="/WEB-INF/frame/default/header.jsp"%>
<div class="body_wrap">
    <div class="main_wrap_con">
        <div class="main_wrap_item main_wrap_item_1 main_wrap_item_1_top_con">
            <div class="main_wrap_item_1_top_item main_wrap_item_1_top_item_1">
                <img src="../images/mountain/background3.jpg" width="600px" height="390px">
            </div>
            <div class="main_wrap_item_1_top_item main_wrap_item_1_top_item_2 mountain_info_con">

                <div class="mountain_info_item mountain_info_item_2">
                    가리왕산
                </div>
                <div class="mountain_info_item mountain_info_item_3">
                    높이 : 1561
                </div>
                <div class="mountain_info_item mountain_info_item_4">
                    위치 : 강원도 정선군 정선읍 회동리, 강원도 평창군 진부면, 북평면
                </div>
                <div class="mountain_info_item mountain_info_item_5">
                    &lt;p&gt;가리왕산은 태백산의 지붕역활을 하고 있으며 경사도가 완만한 등산로로 유명하다. 산 능선에는 고산식물인 주목, 잣나무, 단풍나무등 각종 수목이 울창하며
                    산삼등 많은 산약초가 자라고 있다.&lt;br /&gt; &lt;br /&gt; 회동리 입구에는 자연휴양림이 조성되어 각종 편의시설이 설치되어 있고 등산로 산행시간은 총 6시간
                    정도 소요된다. 군립공원으로 지정, 개발계획에 있으며 숙암방면 입구는 약 4km 구간에 철쭉이 밀집 자생하고 있다.&lt;/p&gt;
                </div>
                <div class="mountain_info_item mountain_info_item_6">
                    &lt;p&gt;하안미리기점능선종주코스▷총8시간30분&lt;br/&gt;&#xd;하안미5리백일동-(30분)-상수도취수원-(1시간30분)-안부(1160m)-(30분)-중왕산-(50분)-마항치-(1시간20분)-1450봉-(50분)-정상-(1시간)-중봉-(2시간)-회동리얼음굴매표소&lt;/p&gt;
                </div>
            </div>
        </div>
        <div class="main_wrap_item main_wrap_item_2 main_wrap_item_1_bottom_con">
            <div class="main_wrap_item_1_bottom_item main_wrap_item_1_bottom_item_1">
                #가리왕산
            </div>
            <div class="main_wrap_item_1_bottom_item main_wrap_item_1_bottom_item_2 feed_picture_con">
                <div class="feed_picture_item feed_picture_item1">
                    <img class="img" src="../images/mountain/3.png" width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item2">
                    <img class="img" src="../images/mountain/4.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item3">
                    <img class="img" src="../images/mountain/5.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item4">
                    <img class="img" src="../images/mountain/6.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item5">
                    <img class="img" src="../images/mountain/7.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item6">
                    <img class="img" src="../images/mountain/8.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item feed_picture_item7">
                    <img class="img" src="../images/mountain/9.png"width="100%" height="100%">
                </div>
                <div class="feed_picture_item8">
                    <img class="img" src="../images/icons/rightside.png"width="30px">
                </div>

            </div>
        </div>
    </div>
    <div id="map" class="map" style="width: 100%; height: 800px; margin: 0px auto ;background-color: #000044">
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5188ac15584cefe54aea3746f43ba94"></script>
        <script>
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(37.65947494926604, 126.97759875364473),
                level: 6
            };

            var map = new kakao.maps.Map(container, options);

            var linePath = [
                new kakao.maps.LatLng(37.66104591233062, 126.98061806902977),
                new kakao.maps.LatLng(37.65851176614999, 126.98355035943321),
                new kakao.maps.LatLng(37.65963376520629, 126.97910305232135),
                new kakao.maps.LatLng(37.65595818784788, 126.98181542094453)
            ];

            var linePath2 = [
                new kakao.maps.LatLng(37.66027213644478, 126.97079489627016),
                new kakao.maps.LatLng(37.66139410889663, 126.97514446036858),
                new kakao.maps.LatLng(37.65942097361837, 126.97494897434169),
                new kakao.maps.LatLng(37.65911145744381, 126.97910305241321)
            ];

            // 지도에 표시할 선을 생성합니다
            var polyline = new kakao.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#44ff00', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            var polyline2 = new kakao.maps.Polyline({
                path: linePath2, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FFAE06', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            // 지도에 선을 표시합니다
            polyline.setMap(map);
            polyline2.setMap(map);
        </script>
    </div>
</div>
<%@ include file="/WEB-INF/frame/default/footer.jsp"%>
</body>
</html>
