<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>acl</title>
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/left.css">
    <link rel="stylesheet" href="../resources/css/detail.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/detail.js"></script>
</head>
<body>
    <%@include file="header.jsp"%>
    
    <div class="container">
        <%@include file="left.jsp"%>
        <div class="right">
            <div class="detail">
                <input type="text" id="bno" value="${detail.bno}" name="bno" hidden>
                <h1>${detail.title}</h1>
                <div class="dFlex">
                    <span class="nickname">${detail.nickname}</span>
                    <span class="regdate">${detail.regdate}</span>
                </div>
                <span class="content">${detail.content}</span>
            </div>
            
            <div class="subBtns">
                <div><a href="/main">목록</a></div>
                <!-- <c:if test="${login!=null}"> -->
                <div><a href="/modify?bno=${detail.bno}">수정</a></div>
                <div><a href="/remove?bno=${detail.bno}">삭제</a></div>
                <!-- </c:if> -->
            </div>

            <!-- 댓글 영역 -->
            <div class="board__reply">
                <input id="bno" type="hidden" value="${detail.bno}">
                <h3>댓글</h3>
                <div>
                    <textarea id="reply" cols="100" rows="3" required></textarea>
                    <div class="board__reply-bottom">
                        <label for="replyer">작성자</label>
                        <input id="replyer" type="text"/>
                        <button id="addReply">댓글 작성</button>
                    </div>
                </div>
                <div>
                    <ul id="relist">
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
                                <input type="text" name="replyer">
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
                    
            <div class="pageInfo_wrap">
                <div class="pageInfo_area">
                    <ul id="pageInfo" class="pageInfo">
                        
                        <!-- 이전페이지 버튼 -->
                        <c:if test="${pager.prev}">
                            <li class="pageInfo_btn previous"><a href="${pager.startPage-1}">Prev</a></li>
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
            </div><!--페이저 끝-->
            
            <form id="moveForm" method="get">
                <input type="hidden" name="pageNum" value="${pager.cri.pageNum}">
                <input type="hidden" name="amount" value="${pager.cri.amount}">
                <input type="hidden" name="keyword" value="${pager.cri.keyword }">
                <input type="hidden" name="type" value="${pager.cri.type }">
            </form>
        </div><!--right끝-->
    </div><!--container끝-->
        <script>
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
            
            // 카테고리 선택
            let Doodle = $("#Doodle")
            let diary = $("#diary")
            let travel = $("#travel")
            let movie = $("#movie")
            let photolog = $("#photolog") 

            $("#all").on("click", function(){
                location.href = '/main'
            })

            $("#Doodle").on("click", function(){
                moveForm.find("input[name='type']").val('G');
                $("input[name='keyword']").val('낙서장');
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
            $("#diary").on("click", function(){
                moveForm.find("input[name='type']").val('G');
                $("input[name='keyword']").val('일기장');
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
            $("#travel").on("click", function(){
                moveForm.find("input[name='type']").val('G');
                $("input[name='keyword']").val('여행');
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
            $("#movie").on("click", function(){
                moveForm.find("input[name='type']").val('G');
                $("input[name='keyword']").val('영화');
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
            $("#photolog").on("click", function(){
                moveForm.find("input[name='type']").val('G');
                $("input[name='keyword']").val('포토로그');
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });
        	// 카테고리 선택 끝
        </script>
    <script src="../resources/js/header.js"></script>
</body>
</html>