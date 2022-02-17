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
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/main.js"></script>
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
    
    <div class="container">
        <div class="left">
            <div class="profile">
                <div class="profile_image">
                    <img src="" alt="">
                </div>
                <div class="profile_text">
                    <c:if test="${login!=null}"><p>${login.nickname}님 안녕하세요</p></c:if>
                    <a href="/write">글쓰기</a>
                    <a href="">관리</a>
                </div>
            </div>
            <div class="Lcategory">
                <span>카테고리</span>
                <ul>
                    <li>전체보기({전체글갯수})</li>
                    <li>낙서장</li>
                    <li>일기장</li>
                    <li>여행</li>
                    <li>영화</li>
                    <li>포토로그</li>
                </ul>
            </div>
            <div class="datepicker">
                <span>대충 달력</span>
            </div>
        </div><!--left 끝-->
        <div class="right">
            <div>
            	<c:forEach items="${maindetail}" var="maindetail">
	                <div class="Rcategory"><span>${maindetail.category}</span></div>
	                <div class="Mpost">
	                	<div><span>${maindetail.bno}</span></div>
	                    <h1>${maindetail.title}</h1>
	                    <div class="Rflex">
	                        <span>${login.nickname}</span>
	                        <span>${maindetail.regdate}</span>
	                    </div>
	                    <div><span>${maintext.content}</span></div>
	                </div>

                    <div class="detRem">
                        <div><a href="/modify?bno=${maindetail.bno}">수정</a></div>
                        <div><a href="/remove?bno=${maindetail.bno}">삭제</a></div>
                    </div>

                    <div class="reply">
                        <h3>댓글</h3>
                        <textarea name="" id="" placeholder="댓글을 입력해주세요"></textarea>
                        <div class="reply_idps">
                            <input type="text" placeholder="이름">
                            <input type="password" placeholder="비밀번호">
                        </div>
                        <button type="submit">등록</button>
                    </div><!--reply 끝-->
                </c:forEach>
                <div class="pageInfo_wrap">
                    <div class="pageInfo_area">
                        <ul id="pageInfo" class="pageInfo">
                            
                            <!-- 이전페이지 버튼 -->
                            <c:if test="${pager.prev}">
                                <li class="pageInfo_btn previous"><a href="${pager.startPage-1}">Previous</a></li>
                            </c:if>

                            <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
                                <li class="pageInfo_btn"><a href="${num}">${num}</a></li>
                            </c:forEach>

                            <!-- 다음페이지 버튼 -->
                            <c:if test="${pager.next}">
                                <li class="pageInfo_btn next"><a href="${pager.endPage + 1 }">Next</a></li>
                            </c:if>   
                        </ul>
                    </div>
                </div>
                
                <form id="moveForm" method="get">
                    <input type="hidden" name="pageNum" value="${pager.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pager.cri.amount}">
                </form>
            </div>
        </div><!--right끝-->
    </div><!--container끝-->
        <script>
            $(document).ready(function(){

            });

            let moveForm = $("#moveForm");

            $(".pageInfo a").on("click", function(e){
                e.preventDefault();
                moveForm.find("input[name='pageNum']").val($(this).attr("href"));
                moveForm.attr("action", "/main");
                moveForm.submit();
                
            });

	        const body = document.querySelector('body');
	        const modal = document.querySelector('.modal');
	        const modal_open = document.querySelector('.modal_open');
	  
	        modal_open.addEventListener('click', () => {
	            modal.classList.toggle('show');
	  
	            if (modal.classList.contains('show')) {
	                body.style.overflow = 'hidden';
	            }
	        });
	  
	        modal.addEventListener('click', (event) => {
	            if (event.target === modal) {
	                modal.classList.toggle('show');
	  
	            if (!modal.classList.contains('show')) {
	                body.style.overflow = 'auto';
	                }
	            }
	        });
    	</script>
</body>
</html>