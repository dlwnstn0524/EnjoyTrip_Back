<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<link rel="stylesheet" href="./assets/css/trip_plan.css" />
    <%@ include file="./assets/commons/header.jsp" %>
    
    <div class="container">
	   <div class="row justify-content-center " style="margin-top:150px;">
	     <div  class="my-text col-md-6 text-center fw-bold mb-5 fs-2 ">여행은 또다른 나를 만나는 시간이다.</div>
	     <div class="map_wrap">
	       <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>    
	       <div id="menu_wrap" class="bg_white">
	       </div>
	     </div>
	   </div>
    </div>
	<%@ include file="./assets/commons/footer.jsp" %>
	
<script>
  window.onload = function() {
    const session = JSON.parse(localStorage.getItem("isLogin"));
    console.log(session);
    if (session == true) {
      const wrapper = document.querySelector("#loginstate");
      wrapper.setAttribute("style", "display:flex");
      const wrapper1 = document.querySelector("#logoutstate");
      wrapper1.setAttribute("style", "display:none");
    } else {
      const wrapper = document.querySelector("#logoutstate");
      wrapper.setAttribute("style", "display:flex");
      const wrapper1 = document.querySelector("#loginstate");
      wrapper1.setAttribute("style", "display:none");
    }
  }
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7653085a7d54c6d8dbbdb60e5fb00ef&libraries=services,clusterer,drawing"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- 관광지 공유 api -->

<script src="assets/js/trip_plan.js"></script>
<script>
let serviceKey = "98bjcTT737wV9WBAYZJCG44LYmmdDeoYCYochcob51sm%2BEj%2FzxuTjjGdOI37R2tJOK0JEHgh4%2Fxeg4f2YYCNCw%3D%3D";
let areaUrl =
"https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
serviceKey +
"&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

</script>
</html>