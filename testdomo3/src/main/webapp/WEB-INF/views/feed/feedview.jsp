<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FEED VIEW</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/feed/feedview.css'/>">
</head>
<body>

<!-- header -->
<%@ include file="/WEB-INF/frame/default/header.jsp"%>

<!-- background START -->
<div class="background">

    <!-- page back -->
    <div class="pageBack">
        <button id="pageBack">
            <img alt="pageBack" src="<c:url value="/images/feed/feedw/feedButton.png"/>">
        </button>
    </div>

    <section class="container_view">

        <!-- feed photo START -->
        <section class="v_leftbox">

            <!-- feed photo -->
            <img src="<c:url value="/images/feed/feedw/uploadfile/${selectFeedView.boardPhoto}"/>" alt="feed-img">

            <!-- tag button -->
            <button>
                <img src="<c:url value="/images/feed/feedw/icon-05.png"/>">
            </button>

        </section>
        <!-- feed photo END -->



        <!-- info START -->
        <section class="v_rightbox">

            <!-- profile START -->
            <div class="v_profile">

                <!-- feed creator profile photo -->
                <div class="v_photo">
                    <button onclick="location.href = '<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>'">
                        <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="profile-img">
                    </button>
                </div>

                <!-- feed creator nickname -->
                <a href="<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>" class="v_nickname">${selectFeedView.memberNickname}</a>
                <!-- <button>?????????</button> -->

                <!-- option button -->
                <c:if test="${sessionScope.memberVo.memberIdx eq selectFeedView.memberIdx}">
                    <div class="edit_div">
                    	<button class="v_edit feedview_btn" onclick="feedEdit(${selectFeedView.memberIdx}, ${selectFeedView.boardIdx})">??????</button>
                    </div>
                    <div class="delete_div">
                    	<button class="v_delete feedview_btn">??????</button>
                    </div>
                </c:if>

                <!-- feed contents & hashtag -->
                <div class="contents">
                    <p>${selectFeedView.boardDiscription}</p>
                    <div> <a class="hashtag">${selectFeedView.hashtag}</a> </div>
                </div>

            </div>
            <!-- profile END -->



            <!-- comment START -->
            <section class="commentbox">
                <div id="cmt">
						<!-- ????????? ???????????? ???????????? ?????? -->
                </div>
            </section>
            <!-- comment END -->



            <!-- commenting START -->
            <section class="commentingbox">

                <!-- commenting nav START -->
                <div class="buttonline">
                    <div>
						<!--  ????????? ?????? -->
                          <button class="like"  id="likeButton">
                             <!-- ??????: ????????? ??? ??????, ?????????: ????????? ?????? -->
                             <c:if test="${likeStatus>0}">
                                <img id="current-like" name="delete" src="<c:url value="/images/feed/feedw/like.png"/>"  onclick="clickLike(this.name)">
                             </c:if>
                             <!-- ??????: ????????? ?????? ?????? , ?????????: ????????? ?????? -->
                             <c:if test="${likeStatus==0}">
                                <img id="current-dislike" name="insert" src="<c:url value="/images/feed/feedw/nolike.png"/>" onclick="clickLike(this.name)">
                             </c:if> 
                          </button>   
                          <!-- ????????? ?????? ??? -->   


					<!-- ???????????? ???????????? ??????0913-->
                     <a class="share" id="kakao-link-btn" href="javascript:sendLink(${selectFeedView.memberIdx},${selectFeedView.boardIdx},${totalLikeCount})">
                       <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
                     </a>
                     <!-- ?????? ?????? ??? -->
     
                    </div>
                    
                    
                    <!-- ????????? ?????? ?????? -->                  
	                  <div class="likeline">
	                     <p>????????? <span id="totaLikeCount">${totalLikeCount}</span>???</p>
	                  </div>
	                  <!-- ????????? ?????? ?????? ???-->
                    
                </div>
                <!-- commenting nav END -->
                
                

                <!-- commenting form START -->
                <form method="post" enctype="multipart/form-data">
                    <div class="commentingline">

                        <div class="textbox">
                            <input type="text" placeholder="????????????" name="comment" id="comment" autofocus>
                        </div>
                        <div class="submitbox">
                            <input type="submit" id="comment_submit" value="??????" onclick="commentSubmit()">
                        </div>

                    </div>
                </form>
                <!-- commenting form END -->

            </section>
            <!-- commenting END -->

        </section>
        <!-- info END -->

    </section>
</div>
<!-- backgroung END -->

<!-- footer -->
<%@ include file="/WEB-INF/frame/default/footer.jsp"%>





<script>

    $(document).ready(function(){

        /* page back */
        $('#pageBack').click(function(){
            history.back();
        });

        /* feed delete */
        $('.v_delete').click(function(){
            $.ajax({
                url : '<c:url value="/feed/feedview/deletefeed/${selectFeedView.memberIdx}&${selectFeedView.boardIdx}"/>',
                type:'POST',
                success : function(data) {
                    if(data==1) {
                        alert('????????? ?????????????????????');
                        window.history.back(); /* ???????????? ????????? ?????? ?????? */
                    }
                }
            });
        });
        /* feed delete END */



        /* comment list */
        $.ajax({
            url: '<c:url value="/feed/feedview/selectcomment"/>',
            type: 'get',
            data: {
                boardIdx: '${selectFeedView.boardIdx}'
            },
            success: function(data) {
            	
            	console.log(data);
                var memberIdx = '${sessionScope.memberVo.memberIdx}';
                showList(data,memberIdx);
                
            }
        });
        /* comment list END */


        
    });
    /* document ready END */
    

    
    /* comment list */
    function showList(list, memberIdx){
        	
           var html = '';
           var idx = memberIdx;
            
            $.each(list, function(index, item){

                html += '<div class="comments">';
                html += '      <div class="cmt-profile">';
                html += '         <button onclick="location.href = "<c:url value="/feed/userFeed/'+item.memberIdx+'"/>"">';
                html += '            <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="cmt-profile-img">';
                html += '         </button>';
                html += '      </div>';
                html += '      <div class="comment">';
                html += '         <a href="<c:url value="/feed/userFeed/'+item.memberIdx+'"/>" class="v_nickname">'+item.memberNickname+'</a>';
                html += '         <p>'+item.comment+'</p>';
                html += '      </div>';

                if (idx == item.memberIdx){
                    html += '   <div>';
                    html += '      <a class="comment_delete" onclick="commentDelete('+item.boardCommentIdx+',${boardIdx})">????????????</a>';
                    html += '   </div>';
                }

                html += '</div>';

                $('#cmt').html(html);
            })
        }
    
    
    
    /* comment submit */
        function commentSubmit() {
    	
    		alert('????????? ?????????????????????');
        	/* showList(data,memberIdx); */
        	
    }
        
        
        /* comment delete */
        function commentDelete(boardCommentIdx, boardIdx){
        	
        	var board = boardIdx;
        	var idx = boardCommentIdx;
        	console.log(idx);

            console.log('comment delete ajax start');

            $.ajax({
                url: '<c:url value="/feed/feedview/deletecomment/'+idx+'&'+board+'"/>',
                type: 'POST',
                success: function(data){
                
                    var memberIdx = '${sessionScope.memberVo.memberIdx}';
                    console.log(memberIdx);
                    console.log("delete" + data);
                    
                    alert('????????? ?????????????????????');
                    showList(data,memberIdx);	/* ?????? ?????? */
                    
                }
            });

        };

        
        
        /* feed edit */
        function feedEdit(memberIdx, boardIdx){
        	
    		var myIdx = '${sessionScope.memberVo.memberIdx}';
    		var memberIdx = memberIdx;
    		var boardIdx = boardIdx;
    								
    		if(!myIdx) {
    			alert('????????? ??? ?????? ???????????????');
    			location.href='<c:url value="/member/login"/>';
    		} else {
    			location.href='<c:url value="/feed/feededit/'+memberIdx+'&'+boardIdx+'"/>';
    		}
        	
        }
        
        
        
</script>



<!-- ????????? ????????? -->
<script>
      function clickLike(click){
         
         console.log(click);
         
         if(click == 'insert'){
            //????????? ?????? ??????
            
            
            $.ajax({
               url:'<c:url value="/feed/likeButtonClick"/>',
                 type:'POST',
               data:{
                  likeChange:'1',
                  boardIdx:'${selectFeedView.boardIdx}'
               },
               success:function(data){
                  //????????? ????????? ??????
                  if(data ==1){
                     
                     console.log('insert??????');
                     
                     
                      var html  ='<img id="current-like" name="delete" src="<c:url value="/images/feed/feedw/like.png"/>"  onclick="clickLike(this.name)">';
                      
                     $('#likeButton').html(html);
                     
                     // ????????? ???????????? ????????? ?????? +1 ?????????
                     var currentLikeCount = parseInt($('#totaLikeCount').text());
                     
                     var newLikeCount = currentLikeCount+1;
                     
                     $('#totaLikeCount').text(newLikeCount);
                     
                     
                     // ????????? ???????????? ????????? ?????? ?????? ???????????? ??????
                     
                  }/*if ???  */
                  
               }/* success ??? */
               
            });/* ajax ???*/
         }else{
            // click == 'delete'
            
            $.ajax({
               url:'<c:url value="/feed/likeButtonClick"/>',
                 type:'POST',
               data:{
                  likeChange:'-1',
                  boardIdx:'${selectFeedView.boardIdx}'
               },
               success:function(data){
                  //????????? ???????????? ??????
                  if(data == 1){
                     
                     console.log('????????? ???????????? ??????');
                     
                         var html  ='<img id="current-dislike" name="insert" src="<c:url value="/images/feed/feedw/nolike.png"/>" onclick="clickLike(this.name)">';
                     
                     $('#likeButton').html(html);
                     
                     // ????????? ???????????? ????????? ?????? -1?????????
                     // ????????? ???????????? ????????? ?????? ?????? ???????????? ?????? or ?????? ?????? ????????? ?????? ???????????? ?????? ?????? /feed/userFeed/{memberIdx}
                     var currentLikeCount = parseInt($('#totaLikeCount').text());
                     
                     var newLikeCount = currentLikeCount-1;
                     
                     $('#totaLikeCount').text(newLikeCount);
                     
                     
                  }/*if ???  */
                  
               }/* success ??? */
            });/* ajax ??? */
         }
      };
   
   </script>
   
   
   
   
   <!--  ?????????????????? ????????????   ???0914??????-->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script type="text/javascript">
     function sendLink(memberIdx,boardIdx,totalLikeCount) {
        /* hashtag??? ??????????????? ?????? */
      var hashtag = hashtag;  
        
      Kakao.init("daeecdc3ce37abac4a9a3f8ad3e05b0a");
      
       Kakao.Link.sendDefault({
         objectType: 'feed',
         content: {
           title: '????????? ????????? ???????????????.',
           description: '?????????',
           imageUrl:'https://ifh.cc/g/Mtgj7e.jpg',
           link: {
             mobileWebUrl: 'http://localhost:8080/orl/feed/feedview/'+memberIdx+'&'+boardIdx,
             webUrl: 'http://localhost:8080/orl/feed/feedview/'+memberIdx+'&'+boardIdx,
           },
         },
         social: {
           likeCount:totalLikeCount,
           /* commentCount: 45,
           sharedCount: 845, */
         },
         buttons: [
           {
             title: '????????? ??????',
             link: {
               mobileWebUrl: 'http://localhost:8080/orl/feed/feedview/'+memberIdx+'&'+boardIdx,
               webUrl: 'http://localhost:8080/orl/feed/feedview/'+memberIdx+'&'+boardIdx,
             },
           }
         ],
       })
     }
   </script>
   

</body>
</html>