<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <input type="text" id="bno" value="${detail.bno}" name="bno">
    </div>
</div><!--left 끝-->