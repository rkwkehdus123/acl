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
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/left.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@include file="header.jsp"%>
    
    <div class="container">
        <%@include file="left.jsp"%>
        <div class="right">
            <div>
            	<c:forEach items="${maindetail}" var="maindetail" varStatus="status">
	                <div class="Rcategory"><span>${maindetail.category}</span></div>
	                <div class="Mpost">
	                	<div><input id="bno" type="text" value="${maindetail.bno}"></input></div>
	                	<c:out value="${status.index}" /> / <c:out value="${maindetail.bno}" />
	                    <h1><a href="/detail?bno=${maindetail.bno}">${maindetail.title}</a></h1>
	                    <div class="Rflex">
	                        <span>${maindetail.nickname}</span>
	                        <span>${maindetail.regdate}</span>
	                    </div>
	                    <div class="content">${maindetail.content}</div>
	                </div>
                    <div class="detRem">
                        <div><a href="/modify?bno=${maindetail.bno}">수정</a></div>
                        <div><a href="/remove?bno=${maindetail.bno}">삭제</a></div>
                    </div>
                </c:forEach>
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
        </script>
    <script src="../resources/js/header.js"></script>
</body>
</html>