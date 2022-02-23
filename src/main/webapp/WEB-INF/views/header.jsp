<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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