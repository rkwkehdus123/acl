/*
지금 현재 페이지 번호를 클릭하면
http://localhost:8080/board/list?pageNum=2&amount=10
검색에 대한(검색종류, 키워드)가 없어서 문제가 발생한다

따라서 현재 페이지 번호를 클릭하면
http://localhost:8080/board/list?pageNum=2&amount=10&search=T&keyword=안녕
과 같은 url주소로 변경해주어야 한다.
*/

$(document).ready(function(){
	var actionForm=$("#actionForm");
    //현재 페이지 번호를 클릭하면
    $(".paginate_button a").on("click",function(e){
        e.preventDefault();
        //form태그 안에 있는 pageNum 값을 가져와라
        actionForm.find("input[name='pageNum']").val($(this).attr("href")) //val는 인풋박스 안의 ${pageMaker.cri.pageNum}를 말하는것
        //form태그 안에 있는 값을 컨트롤러로 보내라
        actionForm.submit();
    })
    //검색버튼을 클릭하면
    $("input[type='submit']").on("click",function(){
        //pageNum의 값을 1로 설정
        actionForm.find("input[name='pageNum']").val("1")
        actionForm.submit();
    })
})


