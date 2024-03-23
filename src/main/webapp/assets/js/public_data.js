    window.onload = function () {
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
      };
      
var markerInfoData = document.getElementById("info").getAttribute("data");
// 지도를 표시할 div 요소 가져오기
var mapContainer = document.getElementById("map");

// 마커를 담을 배열
var markers = [];
var overlays = [];

// 지도 옵션 설정
var mapOption = {
    center: new kakao.maps.LatLng(37.566535, 126.9779692), // 서울 시청을 중심으로 지도 표시
    level: 9 // 지도의 확대 레벨
};

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 지도 컨트롤 추가
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);



markerInfoData = JSON.parse(markerInfoData);
// 장소 검색
if(markerInfoData != "") {
	displayPlaces(markerInfoData);
}else{
	alert("올바른 키워드가 아닙니다!");
}

// 검색 결과 목록과 마커를 표시하는 함수
function displayPlaces(places) {
    bounds = new kakao.maps.LatLngBounds();
    removeMarker();

    for (var i = 0; i < places.length; i++) {
        positions.push({
            title: places[i].addr1,
            latlng_x: places[i].latitude,
            latlng_y: places[i].longitude,
        });
    }

    for (var i = 0; i < positions.length; i++) {
        var placePosition = new kakao.maps.LatLng(places[i].longitude, places[i].latitude);
        displayMarker(places, i);
        bounds.extend(placePosition);
    }

    map.setBounds(bounds);
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(latitude, longitude) {
    var imageSrc = "./assets/img/marker.png",
        imageSize = new kakao.maps.Size(80, 80),
        imgOptions = {
            spriteSize: new kakao.maps.Size(30, 60),
            spriteOrigin: new kakao.maps.Point(0, 0),
            offset: new kakao.maps.Point(12, 60),
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(latitude, longitude), // 위도(latitude), 경도(longitude) 순서로 전달
            image: markerImage,
        });

    marker.setMap(map);
    markers.push(marker);
    return marker;
}

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {
		
        // kakao.maps.LatLngBounds()는 카카오맵에서 사용되는 경도 및 위도 좌표의 경계를 정의하는 클래스입니다.
        bounds = new kakao.maps.LatLngBounds();
        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
  
        for (var i = 0; i < places.length; i++) {
          positions.push({
            title: places[i].addr1,
            latlng_x: places[i].longitude,
            latlng_y: places[i].latitude
          });
        }
  
        for (var i = 0; i < positions.length; i++) {
          var placePosition = new kakao.maps.LatLng(places[i].latitude, places[i].longitude);
  
          displayMarker(places, i);
          bounds.extend(placePosition);
        }
  
        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        // menuEl.scrollTop = 0;
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
      }
  
      //지도에 마커 클릭시 오버레이 출력
      function displayMarker(places, i) {
        marker = addMarker(places[i].latitude, places[i].longitude);
  
        var overlay = new kakao.maps.CustomOverlay({
          position: marker.getPosition(),
        });
  
        // 이미지가 없다면 준비중으로 대체
        if (places[i].first_image == "") {
          places[i].first_image = "./assets/img/preparingimg.jpg";
        }
        var content = document.createElement("div");
        content.classList.add("wrap");
        content.innerHTML =
          '<div class="info">' +
          '<div class="title">' +
          places[i].title +
          // // 버튼 추가
          // // 버튼 추가 end
          "</div>" +
          '<div class="body">' +
          '<div class="img">' +
          '<img src="' +
          places[i].firstImage +
          '" width="73" height="70">' +
          "</div>" +
          "</div>" +
          '<div class="desc">' +
          '<div class="ellipsis">' +
          places[i].addr +
          "</div>" +
          '<div class="jibun ellipsis">' +
          places[i].addr +
          "</div>" +
          "</div>" +
          "</div>";
  
        var closeBtn = document.createElement("button");
        closeBtn.className = "btn btn-primary btn-sm";
        closeBtn.style.cssText = "float : right";
        closeBtn.innerHTML += "<div>닫기</div>";
  
        closeBtn.onclick = function () {
          overlay.setMap(null);
        };
  
        content.appendChild(closeBtn);
  
        // end
  
        overlay.setContent(content);
  
        kakao.maps.event.addListener(marker, "click", function () {
          removeOverlay();
          overlay.setMap(map);
        });
  
        overlays.push(overlay);
        return overlay;
      }
  
      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
  
      // 지도 위에 표시되고 있는 마커,오버레이 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
  
        for (var i = 0; i < overlays.length; i++) {
          overlays[i].setMap(null);
        }
        markers = [];
        positions = [];
        overlays = [];
      }
  
      //다른 오버레이 클릭시 기존에 열려있던 오버레이 창을 닫음
      function removeOverlay() {
        for (var i = 0; i < overlays.length; i++) {
          overlays[i].setMap(null);
        }
      }
  
  