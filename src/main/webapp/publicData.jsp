<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="./assets/css/public_data.css" />
    <%@ include file="./assets/commons/header.jsp" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <div class="container">
	<div class="col" style="margin-top: 100px">
        <form role="search" onsubmit="searchPlaces(); return false;">
          <div class="row justify-content-center">
            <div class="col-md-3 text-center">
            
              <select id="search-area" class="form-select mb-3" aria-label="Default select example">
                <option value="0" selected>검색 할 지역 선택</option>
                <c:forEach var="sido" items="${dto}">
            	<option value="${sido.sidoCode}">${sido.sidoName}</option>
	            </c:forEach>
              </select>
            </div>
            <div class="col-md-3 text-center">
              <select
                id="search-content-id"
                class="form-select mb-3"
                aria-label="Default select example"
              >
                <option value="0" selected>관광지 유형</option>
                <option value="12">관광지</option>
                <option value="14">문화시설</option>
                <option value="15">축제공연행사</option>
                <option value="25">여행코스</option>
                <option value="28">레포츠</option>
                <option value="32">숙박</option>
                <option value="38">쇼핑</option>
                <option value="39">음식점</option>
              </select>
            </div>
            <div class="col-md-3 mb-3 text-center d-flex col">
              <input
                id="search-keyword"
                class="form-control mr-2"
                type="search"
                placeholder="검색어"
                aria-label="검색어"
              />
              <button
                class="btn btn-primary btn-sm"
                name="name1"
                type="submit"
                style="white-space: nowrap; margin-left: 5%"
              >
                검색
              </button>
              <!-- ms-md-2 클래스를 추가하여 중간 및 큰 화면 크기에서 왼쪽 마진을 추가 -->
            </div>
          </div>
        </form>
        <div class="col" id="map" style="height: 600px"></div>
      </div>
	</div>
	<%@ include file="./assets/commons/footer.jsp" %>

<script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7653085a7d54c6d8dbbdb60e5fb00ef&libraries=services,clusterer,drawing"
  ></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <!-- 관광지 공유 api -->
<script src="assets/js/public_data.js"></script>
</html>