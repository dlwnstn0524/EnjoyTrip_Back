<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./assets/commons/header.jsp" %>

 <!--사진 부분 시작-->
    <div style="margin-top: 10px">
      <div class="card">
        <img src="assets/img/bg.jpg" class="img-fluid" />
        <div class="card-img-overlay d-flex justify-content-center align-items-center">
          <div class="row">
            <div class="col-lg-6 container">
              <h1>
                지금 Enjoy!!!Trip과 함께 우리지역의 관광지를 알아보고 나만의 여행 계획을
                만들어보세요!!!
              </h1>
            </div>
            <div class="col-lg-3"></div>
            <div class="col-lg-3 bg-light p-3 card">
              <!-- 폼 부분 시작 -->
              <form action="">
                <div class="mb-3 mt-3">
                  <h2 class="mb-2">문의하기</h2>
                  <div class="mb-4">이름과 연락처를 남겨주세요.</div>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    placeholder="이름"
                    name="email"
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="password"
                    class="form-control"
                    id="pwd"
                    placeholder="전화번호"
                    name="pswd"
                  />
                </div>
                <div class="form-check mb-3">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember" />정보제공동의함
                  </label>
                </div>
                <button type="submit" class="btn btn-primary">보내기</button>
              </form>
              <!-- 폼 부분 끝 -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--사진 부분 끝-->

    <!-- 바로가기 시작 -->
    <div class="d-flex justify-content-around mt-4 mb-4">
      <div class="card col-2 me-3">
        <img
          class="card-img-top"
          src="assets/img/beach.jpg"
          alt="Card image"
          style="filter: brightness(65%)"
        />
        <div class="card-img-overlay d-flex justify-content-center align-items-center">
          <h2 class="text-white">해 변</h2>
        </div>
      </div>

      <div class="card col-2 me-3">
        <img
          class="card-img-top"
          src="assets/img/river.jpg"
          alt="Card image"
          style="filter: brightness(65%)"
        />
        <div class="card-img-overlay d-flex justify-content-center align-items-center">
          <h2 class="text-white">강 가</h2>
        </div>
      </div>

      <div class="card col-2 me-3">
        <img
          class="card-img-top"
          src="assets/img/mont.jpg"
          alt="Card image"
          style="filter: brightness(65%)"
        />
        <div class="card-img-overlay d-flex justify-content-center align-items-center">
          <h2 class="text-white">산</h2>
        </div>
      </div>

      <div class="card col-2 me-3">
        <img
          class="card-img-top"
          src="assets/img/activity.jpg"
          alt="Card image"
          style="filter: brightness(65%)"
        />
        <div class="card-img-overlay d-flex justify-content-center align-items-center">
          <h2 class="text-white">액 티 비 티</h2>
        </div>
      </div>
    </div>
    <%@ include file="./assets/commons/footer.jsp" %>
  </html>
  <script>
	  window.onload = function() {
	    const session = JSON.parse(localStorage.getItem("isLogin"));
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