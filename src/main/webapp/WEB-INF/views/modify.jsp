<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/modify.css">
    <link rel="stylesheet" href="modify.css">
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
        	<c:if test="${login!=null}"><a href="/main">${login.id}님의 블로그</a></c:if>
		</h1>
    </header>
    
    <!-- 아카라이브 글쓰기 참조 -->
    <div class="container">
        <div class="Wpost">
            <form action="/modify" method="post">
                <div class="writeGo">글쓰기</div>
                <div class="Wcategory">
	                <select name="category">
	                    <option value="Doodle">낙서장</option>
	                    <option value="diary">일기장</option>
	                    <option value="travel">여행</option>
	                    <option value="movie">영화</option>
	                    <option value="photolog">포토로그</option>
	                </select>
                </div>
                <div><input type="text" value="${detail.bno}" name="bno" hidden></div>
                <div>
                    <label class="titletext" >제목</label>
                    <input class="titleinput" type="text" value="${detail.title}" name="title">
                </div>
                <div class="img">
                    <a href=""><img src="../resources/image/image-solid.svg" alt=""></a>
                </div>
                <div><textarea name="content" id="" cols="127" rows="30">${detail.content}</textarea>
                </div>
                <button type="submit">수정</button>
            </form>
        </div>
    </div>
</body>
</html>