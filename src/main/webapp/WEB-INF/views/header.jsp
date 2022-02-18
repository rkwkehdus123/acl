<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
    margin: 0;
    padding: 0;
    background-color: #476177;
}

body{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 13px;
    line-height: 20px;
    color:#333;
}

ul, ol{
    list-style: none;
}

img{
    vertical-align: top;
    border: 0;
}

a{
    text-decoration: none;
}

.hide {
    position: absolute;
    top: -99999px;
    left: -99999px;
    width: 1px;
    height: 1px;
    overflow: hidden;
}

header{
    width: 1000px;
    height: 200px;
    margin: 0 auto;
    color: #F4BF3D;
}

.modal {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1050;

    width: 100%;
    height: 100%;

    display: none;

    background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
    display: block;
}

.modal_body {
    position: absolute;
    top: 50%;
    left: 50%;

    width: 400px;
    height: 400px;

    padding: 40px;

    text-align: center;
    line-height: 5em;

    background-color: white;
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
}

.modal_body h1, .modal_body input, .modal_body div{
    background-color: white;
}

.modal_body h1{
    border-bottom: 1px solid #333;
    margin-bottom: 40px;
}

.modal_idps{
    margin-bottom: 20px;
}

.modal_body input, .modal_body button{
    border: 1px solid #333;
    border-radius: 30px;
}

.modal_body input{
    width: 300px;
    padding: 15px 20px;
}

.modal_body button{
    background-color: rgb(252, 240, 221);
    padding: 10px 20px;
    cursor: pointer;
}

.login{
    text-align: right;
    padding-top: 20px;
    padding-right: 20px;
}

.login a{
    font-weight: bolder;
    font-size: 14px;
    color: #F4BF3D;

}

.headh1{
    margin-top: 60px;
    margin-left: 30px;
}

.headh1 a{
	color: #F4BF3D;
}
</style>
</head>
<body>
<header>
    <div class="modal">
        <form action="/login" method="post">
            <div class="modal_body">
                <h1>로그인</h1>
                <div class="modal_idps">
                    <input type="text" name="id" placeholder="아이디">
                    <input type="password" name="password" placeholder="비밀번호">
                </div>
                <button type="submit" class="modal_login">로그인</button>
            </div>
        </form>
    </div>
    
    <div class="login">
        <c:if test="${login==null}">
            <a href="#" class="modal_open">로그인하기</a>
        </c:if>
        <c:if test="${login!=null}">
            <a href="/logout">로그아웃하기</a>
        </c:if>
    </div>
    <h1 class="headh1">
        <a href="/main">ehdus123님의 블로그</a>
    </h1>
</header>
</body>
</html>