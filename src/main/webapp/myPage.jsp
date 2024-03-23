<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="./assets/commons/header.jsp" %>
    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3">마이페이지</h4>
          <form action="enjoytrip?action=update" class="validation-form" method="post" novalidate>
            <div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" value="${m.name }" name="name" required />
            </div>

            <div class="mb-3">
              <label for="userId">아이디</label>
              <input type="text" class="form-control" id="userid" value="${m.id }" name="id" readonly="readonly" required />
              <div class="invalid-feedback">아이디를 입력해주세요.</div>
            </div>

            <div class="mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="passWord" name="pw" required />
              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
            </div>

            <div class="mb-3">
              <label for="checkPassword">비밀번호 확인</label>
              <input type="password" class="form-control" id="checkPassword" required />
              <div class="invalid-feedback">비밀번호를 재입력해주세요.</div>
            </div>

            <div class="mb-3">
              <label for="email">이메일</label>
              <input
                type="email"
                class="form-control"
                placeholder="you@example.com"
                id="email"
                value = "${m.email }"
                name="email" 
                required
              />
            </div>

            <div class="mb-3">
              <label for="address">지역</label>
              <input type="text" class="form-control" id="region" required />
            </div>

            <div class="row mr-auto" style="float: right">
              <div class="col-auto">
                <input type="submit" class="btn btn-outline-primary" value="수정"></input>
              </div>
              <div class="col">
<<<<<<< HEAD
                <label for="name"></label>
=======
>>>>>>> main
                <input type="button" class="btn btn-outline-success" value="회원탈퇴" 
                  data-bs-toggle="modal" data-bs-target="#profileDeleteModal"></input>
              </div>
            </div>
          </form>
        </div>
      </div>
      <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; Copyright By Jiu Kang</p>
      </footer>
    </div>
	<%@ include file="./assets/commons/footer.jsp" %>
	
<style>
      .input-form {
        max-width: 680px;

        margin-top: 80px;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      }
    </style>
    
    <!-- 프로필 삭제 모달 -->
    <form action="enjoytrip?action=delete" method="post">
    <div
      class="modal fade"
      id="profileDeleteModal"
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
              <h4><span class="glyphicon glyphicon-lock"></span>회원 삭제</h4>
            </div>
          </div>

          <div class="modal-body" style="padding: 40px 50px">
            <form role="form">
              <div class="form-group mb-2">
                <label for="loginEmail"
                  ><span class="glyphicon glyphicon-user"></span>아이디</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="deleteEmail"
                  placeholder="Enter ID"
                  name = "id"
                />
              </div>
              <div class="form-group mb-4">
                <label for="loginPassword"
                  ><span class="glyphicon glyphicon-eye-open"></span
                  >비밀번호</label
                >
                <input
                  type="password"
                  class="form-control"
                  id="deletePassword"
                  placeholder="Enter password"
					name = "pw"
                />
              </div>
              <button
                type="submit"
                class="btn btn-danger btn-block w-100"
                id="deleteButton"
              >
                <span class="glyphicon glyphicon-off"></span> 삭제하기
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
    </form>
    <!-- 프로필 삭제 모달 끝 -->
</html>