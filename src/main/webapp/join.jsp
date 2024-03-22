<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <%@ include file="./assets/commons/header.jsp" %>

    
<div class="container">
  <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
      <h4 class="mb-3">회원가입</h4>
      <form class="validation-form" novalidate>
        <div class="mb-3">
          <label for="name">이름</label>
          <input type="text" class="form-control" id="name" required />
        </div>

        <div class="mb-3">
          <label for="userid">아이디</label>
          <input type="text" class="form-control" id="userid" required />
          <div class="invalid-feedback">아이디를 입력해주세요.</div>
        </div>

        <div class="mb-3">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" id="passWord" required />
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
            <input type="submit" class="btn btn-outline-primary"></input>
          </div>
          <div class="col">
            <label for="name"></label>
            <input type="reset" class="btn btn-outline-success"></input>
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

<script>
      function handleSubmit(event) {
        event.preventDefault(); // 기본 동작 방지

        // 입력된 값 가져오기
        const name = document.getElementById('name').value;
        const userid = document.getElementById('userid').value;
        const passWord = document.getElementById('passWord').value;
        const checkPassword = document.getElementById('checkPassword').value;
        const email = document.getElementById('email').value;
        const region = document.getElementById('region').value;

        console.log(passWord);
        if ( passWord != checkPassword) {
          alert('비밀번호가 일치하지 않습니다.');
          return;
        }
        if (this.checkValidity() === false) {
          return;
        }
        
        this.classList.add("was-validated");

        // 사용자 데이터 생성
        const userData = {
          name,
          userid,
          passWord,
          email,
          region,
        };

        // localStorage에 데이터 저장
        localStorage.setItem("register", JSON.stringify(userData));

        // 성공 메시지 표시
        alert('회원가입이 완료되었습니다.');
        window.location.href = 'main.html';
      }

      window.addEventListener(
        "load",
        () => {
          const forms = document.getElementsByClassName("validation-form");
          forms[0].addEventListener("submit", handleSubmit, false);
        },
        false
      );
      
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

      function login() {
        const inputId = document.querySelector("#userid").value;
        const inputPw = document.querySelector("#passWord").value;
        console.log(inputId);
        console.log(inputPw);

        const data = JSON.parse(localStorage.getItem("register"));
        const id = data.userid;
        const pw = data.passWord;

        console.log(id);
        console.log(pw);
        if (inputId === id && inputPw === pw) {
          alert("로그인 성공!");
          window.location.href = 'main.html';
          localStorage.setItem("isLogin", JSON.stringify(true));
          const wrapper = document.querySelector("#loginstate");
          wrapper.setAttribute("style", "display:block");
          wrapper = document.querySelector("#logoutstate");
          wrapper.setAttribute("style", "display:none");
        } else {
          alert("아이디 비밀번호를 확인해주세요");
        }
      }

      function logout() {
        localStorage.setItem("isLogin", JSON.stringify(false));
        return;
      }
    </script>
</html>