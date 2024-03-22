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
              <div class="col">
                <label for="name"></label>
                <input type="submit" class="btn btn-outline-primary" value="수정"></input>
              </div>
              <div class="col">
                <label for="name"></label>
                <input type="reset" class="btn btn-outline-success" value="회원탈퇴"></input>
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
</html>