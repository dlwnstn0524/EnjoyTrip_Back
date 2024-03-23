<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
	
	<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
	
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Enjoy Your Trip!</title>
  </head>
  <body>
    <!--상단바 시작-->
    <div id="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
        <div class="container">
          <a class="navbar-brand text-primary fw-bold" href="enjoytrip?action=init">
            <img src="./assets/img/logo.PNG" alt="" width="60" />
            EnjoyTrip!
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="enjoytrip?action=local">지역별관광지</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="enjoytrip?action=">나의여행계획</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">핫플자랑하기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">여행정보공유</a>
              </li>
            </ul>
            <c:if test="${login==null }">
            <!-- 로그인 전 -->
            <ul class="navbar-nav mb-2 me-2 mb-lg-0" id="logoutstate">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="enjoytrip?action=mvregister">회원가입</a>
              </li>
              <li class="nav-item" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <a class="nav-link" aria-current="page" href="#">로그인</a>
              </li>
            </ul>
            </c:if>
            <!-- 로그인 후 -->
            <c:if test="${login!=null }">
<<<<<<< HEAD
            <ul class="navbar-nav mb-2 me-2 mb-lg-0" id="loginstate">
=======
            <ul class="navbar-nav mb-2 me-2 mb-lg-0 d-flex align-items-center" id="loginstate">
              <li class="nav-item ">
                ${login }님 어서오세요. 
              </li>
>>>>>>> main
              <li class="nav-item">
                ${login }님 어서오세요. 
                
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  aria-current="page"
                  href="enjoytrip?action=logout"
                  > 로그아웃</a
                >
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="enjoytrip?action=mvmypage">마이페이지</a>
              </li>
            </ul>
            </c:if>
          </div>
        </div>
      </nav>
      <!-- Modal -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <form action="enjoytrip?action=login" method="post">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="inputId">아이디 : </label>
                <input type="text" class="form-control" id="inputId" name="id" required />
                <div class="invalid-feedback">아이디를 입력해주세요.</div>
              </div>

              <div class="mb-3">
                <label for="inputPw">비밀번호 : </label>
                <input type="password" class="form-control" id="inputPw" name="pw" required />
                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
              </div>
              <div id="loginErrorMessage" class="alert alert-danger" style="display: none;"></div>
            </div>
            <div class="justify-content-end">
              <div class="d-flex justify-content-end me-2 mb-2">
                <div class="">
                  <label for="name"></label>
                  <button
                    type="submit"
                    class="btn btn-outline-primary"
                    id="LOGIN"
                    onclick="javascript:login();"
                  >
                    로그인
                  </button>
                </div>
<!--                 <div class="">
                  <label for="findId"></label>
                  <button type="submit" class="btn btn-outline-success">ID찾기</button>
                </div> -->
                <div class="">
                  <label for="findPassword"></label>
                  <button type="button" class="btn btn-outline-secondary"
                  data-bs-toggle="modal" data-bs-target="#passwordFindModal">PW찾기</button>
                </div>
              </div>
            </div>
            <!-- 로그인 실패 표시 -->
            <c:if test="${not empty sessionScope.loginError}">
            	<% System.out.println("Failed~!!"); %>
			    <script>
					window.alert("${loginError}");
			    </script>
			    <c:remove var="loginError" scope="session" />
			</c:if>
          </div>
        </div>
        </form>
      </div>
    <!-- 비밀번호 찾기 모달 -->
    <div
      class="modal fade"
      id="passwordFindModal"
      role="dialog"
      style="position: absolute;"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="d-flex justify-content-center">
            <div
              class="modal-header ms-auto me me-auto text-center"
              style="padding: 30px 40px 10px 40px"
            >
              <h4><span class="glyphicon glyphicon-lock"></span>비밀번호 찾기</h4>
            </div>
          </div>

          <div class="modal-body" style="padding: 40px 50px">
            <form role="form">
              <div class="form-group mb-2">
                <label for="loginEmail"
                  ><span class="glyphicon glyphicon-user"></span>이메일</label
                >
                <input
                  type="email"
                  class="form-control"
                  id="deleteEmail"
                  placeholder="Enter Email"
                  name = "email"
                />
              </div>
              <button
                type="button"
                class="btn btn-primary btn-block w-100"
                id="sendButton"
                data-bs-toggle="modal" data-bs-target="#codeModal"
              >
                <span class="glyphicon glyphicon-off"></span> 보내기
              </button>
            </form>
          </div>
          <script>
			  document.addEventListener("DOMContentLoaded", function() {
			    var deleteButton = document.getElementById("sendButton");
	
			    deleteButton.addEventListener("click", function() {
			      alert("이메일로 인증코드를 보냈습니다.");
			    });
			  });
			</script>
        </div>
      </div>
    </div>
    <!-- 비밀번호 찾기 모달 끝 -->
    <!-- 인증 코드 모달 -->
    <div
      class="modal fade"
      id="codeModal"
      role="dialog"
      style="position: absolute;"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="d-flex justify-content-center">
            <div
              class="modal-header ms-auto me me-auto text-center"
              style="padding: 30px 40px 10px 40px"
            >
              <h4><span class="glyphicon glyphicon-lock"></span>코드 입력</h4>
            </div>
          </div>

          <div class="modal-body" style="padding: 40px 50px">
            <form role="form">
              <div class="form-group mb-2">
                <label for="loginEmail"
                  ><span class="glyphicon glyphicon-user"></span>이메일로 전송된 코드를 입력하세요.</label
                >
                <input
                  type="password"
                  class="form-control"
                  id="code"
                  placeholder="Enter Code"
                  name = "code"
                />
              </div>
              <button
                type="button"
                class="btn btn-success btn-block w-100"
                id="sendCode"
              >
                <span class="glyphicon glyphicon-off"></span> 보내기
              </button>
            </form>
          </div>
        </div>
        </form>
      </div>
    </div>
    <!-- 인증 코드 모달 끝 -->
    </div>
    <!--상단바 끝-->