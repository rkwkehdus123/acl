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
    <%@include file="header.jsp"%>
    
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
                    <li>전체보기(${realtotal})</li>
                    <li>낙서장</li>
                    <li>일기장</li>
                    <li>여행</li>
                    <li>영화</li>
                    <li>포토로그</li>
                </ul>
            </div>
            <div class="search">
                <input type="text" name="keyword" value="${pager.cri.keyword}" placeholder="검색창">
                <select name="type">
                    <option value="TC" selected <c:out value="${pager.cri.type eq 'TC'?'selected':'' }"/>>전체</option>
                    <option value="T" <c:out value="${pager.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                    <option value="C" <c:out value="${pager.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                </select>
                <button>검색</button>
            </div>

            <div class="datepicker">
                <span>대충 달력</span>
            </div>
        </div><!--left 끝-->
        <div class="right">
            <div>
            	<c:forEach items="${maindetail}" var="maindetail" varStatus="status">
	                <div class="Rcategory"><span>${maindetail.category}</span></div>
	                <div class="Mpost">
	                	<div><input type="text" value="${maindetail.bno}"></input></div>
	                	<c:out value="${status.index}" /> / <c:out value="${status.index}" />
	                    <h1>${maindetail.title}</h1>
	                    <div class="Rflex">
	                        <span>${maindetail.nickname}</span>
	                        <span>${maindetail.regdate}</span>
	                    </div>
	                    <div><span>${maindetail.content}</span></div>
	                </div>

                    <div class="detRem">
                        <div><a href="/modify?bno=${maindetail.bno}">수정</a></div>
                        <div><a href="/remove?bno=${maindetail.bno}">삭제</a></div>
                    </div>

                    <!-- 댓글 영역 -->
                    <div class="board__reply">
                        <input id="bno" type="text" value="${maindetail.bno}">
                            <h3>댓글</h3>
                            <div>
                            <textarea id="reply<c:out value="${status.index}"/>" maxlength="1000" cols="125" rows="3" required></textarea>
                            <div class="board__reply-bottom">
                                <label for="replyer">작성자</label>
                                <input id="replyer<c:out value="${status.index}"/>" type="text"/>
                                <button id="addReply<c:out value="${status.index}"/>">댓글 작성</button>
                            </div>
                            </div>
                        <div>
                        <ul id="relist<c:out value="${status.index}"/>">
                        </ul>
                        </div>
                        
                        <!-- Modal -->
                        <div class="replymodal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">댓글 수정하기</h4>
                            </div>
                            <div class="modal-body">
                                <div class="modal-rno">
                                <input type="hidden" name="rno">
                                </div>
                                <div class="modal-replyer">
                                <label>Replyer</label>
                                <input type="text" name="replyer" readonly>
                                </div>
                                <div class="modal-reply">
                                <label>Reply</label>
                                <input type="text" name="reply">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="insideModBtn">수정하기</button>
                                <button type="button" id="insideCloseBtn">Close</button>
                            </div>
                        </div>   <!-- .modal-content 끝 -->
                        </div>   <!-- .modal 끝 -->
                        
                    </div>
                   
                    <!-- <div class="reply">
                        <h3>댓글</h3>
                        <textarea name="reply" id="reply" placeholder="댓글을 입력해주세요"></textarea>
                        <div class="reply_idps">
                            <input type="text" id="replyer" name="replyer" placeholder="이름">
                            <input type="password" id="password" name="password" placeholder="비밀번호">
                        </div>
                        <button type="submit" class="enroll_btn">등록</button>
                    </div>reply 끝 -->
                </c:forEach>
                
                <div class="pageInfo_wrap">
                    <div class="pageInfo_area">
                        <ul id="pageInfo" class="pageInfo">
                            
                            <!-- 이전페이지 버튼 -->
                            <c:if test="${pager.prev}">
                                <li class="pageInfo_btn previous"><a href="${pager.startPage-1}">Previous</a></li>
                            </c:if>

                            <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
                                <li class="pageInfo_btn ${pager.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                            </c:forEach>

                            <!-- 다음페이지 버튼 -->
                            <c:if test="${pager.next}">
                                <li class="pageInfo_btn next" ><a href="${pager.endPage + 1 }">Next</a></li>
                            </c:if>   
                        </ul>
                    </div>
                </div><!--페이저 끝-->>
                
                <form id="moveForm" method="get">
                    <input type="hidden" name="pageNum" value="${pager.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pager.cri.amount}">
                    <input type="hidden" name="keyword" value="${pager.cri.keyword }">
                    <input type="hidden" name="type" value="${pager.cri.type }">
                </form>
            </div>
        </div><!--right끝-->
    </div><!--container끝-->
        <script>
            $(document).ready(function(){

            });

            // 페이저&검색 기능
            let moveForm = $("#moveForm");

            $(".pageInfo a").on("click", function(e){
                e.preventDefault();
                moveForm.find("input[name='pageNum']").val($(this).attr("href"));
                moveForm.attr("action", "/main");
                moveForm.submit();
            });

            $(".search button").on("click", function(e){
                e.preventDefault();
                
                let type = $(".search select").val();
                let keyword = $(".search input[name='keyword']").val();
                
                if(!keyword){
                    alert("키워드를 입력하세요.");
                    return false;
                }        
                
                moveForm.find("input[name='type']").val(type);
                moveForm.find("input[name='keyword']").val(keyword);
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
            // 페이저&검색 기능 끝

            $(".enroll_btn").on("click", function(e){

                const reply = $("#reply").val();
                const replyer = $("#replyer").val();
                const password = $("#password").val();

                const data = {
                    reply : reply,
                    replyer : replyer,
                    password : password
                }
                $.ajax({
                    data : data,
                    type : 'POST',
                    url : '/reply/write',
                    success : function(result){
                        if(callback)
                            callback(result);
                    }
                    
                });	

            });
            


            // 모달
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
            // 모달 끝
    	</script>
</body>
</html>