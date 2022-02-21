/**
 * 
 * 
 */
$(document).ready(function(){
   // 게시물 번호 가져오기
   let bno = $("#bno").val();
   console.log(bno);
   
   // showList 함수를 실행함으로써 로딩되는 즉시 목록 리스트가 보여짐
   showList();
   
   // showList 함수 선언
   function showList() {
	  for (let i=0; i<bno; i++) {
		  let bno2 = bno - i;
		  replyService.getList({bno:bno2}, function(list){
			  
			  var str="";
			  
			  for(var j=0; j<list.length; j++){
				  str+="<li class='replyList' data-rno='"+list[j].rno+"'>";
				  str+="<div><p><b>"+list[j].replyer+"</b></p>" + "<p>"+list[j].reply+"</p></div>";
				  str+="<div><button class='modBtn' data-rno='"+list[j].rno+"'>수정</button><button class='removeBtn' data-rno='"+list[j].rno+"'>삭제</button></div>"
				  str+="</li><br>";
			  }
			  
			  $("#relist"+i).html(str);
		  });
	  }
	  
   }   
   // showList 함수 선언 끝
   for(let i=0; i<bno; i++) {
	   // 댓글 작성 버튼을 클릭하면
	   $("#addReply"+i).on("click",function() {
		   let bno2 = bno-i;
		   if($("#reply"+i).val() != "" && $("#replyer"+i).val() != ""){
			   //사용자가 입력한 댓글 내용을 저장
			   let reply = $("#reply"+i).val();
			   //사용자가 입력한 댓글 작성자를 저장
			   let replyer = $("#replyer"+i).val();
			   
			   console.log(bno2,reply,replyer);
			   	
			   
			   replyService.add({reply:reply, replyer:replyer, bno:bno2},
					   function(result){
				   alert("댓글 작성 : " + result);
				   showList();
			   }
			   );
			   $("#reply"+i).val("");
			   $("#replyer"+i).val("");
		   } else {
			   alert("댓글 내용을 입력해주세요!");
			   $("#reply"+i).val("");
			   $("#replyer"+i).val("");
		   }
		   
	   // 댓글 작성 버튼 클릭 끝
	   
	   
   })}
   
   
   
   // modal창 관련 js작성
   
   
      // 댓글 목록에서 수정 버튼을 클릭하면
      $("#relist").on("click", ".modBtn", function(){
         $(".replymodal").css("display", "block");
         $("body").css("overflow", "hidden");
         
         // rno값 가져오기 (for문에 사용했던 data-rno)
         const rno = $(this).data("rno");
         
         console.log(rno);
         
         replyService.reDetail(rno,function(detail){
            $("input[name='rno']").val(rno);
            $("input[name='replyer']").val(detail.replyer);
            $("input[name='reply']").val(detail.reply);
         })
      })
      // 댓글 수정 버튼 클릭 이벤트 끝
   
      
      // 댓글 update
      $(".replymodal").on("click","#insideModBtn",function(){	// 이벤트 델리게이트.
    	 alert("aaa");
         const reply = {rno:$("input[name='rno']").val(), reply:$("input[name='reply']").val()};
         
         replyService.reUpdate(reply, function(result) {
            alert("댓글 수정 : " + result);
            $(".replymodal").css("display", "none");
            showList();
         })
         
         $("body").css("overflow", "auto");
      })
      // 댓글 update 끝
      
     
   
   $("#insideCloseBtn").on("click", function(){
      $(".replymodal").css("display", "none");
      $("body").css("overflow", "auto");
   })
   // modal창 관련 js작성 끝
   
   
   // 댓글 삭제 버튼을 클릭하면
   $("#relist").on("click", ".removeBtn", function(){
      // rno값 가져오기 (for문에 사용했던 data-rno)
      const rno = $(this).data("rno");
      const reply = {rno:rno};
      
      replyService.reRemove(reply, function(result) {
         alert("댓글 삭제 : " + result);
         showList();
      })
   })
   
   
   
   
   
   
   
   
})   // documet.ready 끝




//-----------------------------------------함수 선언부----------------------------------------



var replyService=(function(){
   // 댓글 쓰기 함수 선언
   function add(reply,callback) {
      $.ajax({
         url:"/replies/new",
         type:"post",
         data:JSON.stringify(reply),
         contentType : "application/json;charset=UTF-8",
         success: function(result){
            if(callback)
               callback(result);
         }
      })
   }
   
   // 댓글 목록 리스트를 보기 위한 함수 선언
   function getList(param, callback) {
      let bno = param.bno;
      $.getJSON(
            "/replies/main/"+bno+".json",
            function(data){
               if (callback)
                  callback(data);
            }
      )
   }
   
   // 댓글을 수정하기 위해 데이터를 받아오는 함수 선언
   function reDetail(rno, callback) {
      var rno=rno;
      $.getJSON(
            "/replies/"+rno+".json",
            function(data) {
               if(callback)
                  callback(data);
            }
      )
   }
   
   // 댓글 update를 위한 함수 선언
   function reUpdate(reply, callback) {
      $.ajax({
         url: "/replies/update",
         type: "put",
         data: JSON.stringify(reply),
         contentType:"application/json; charset=utf-8",
         success: function(result){
            if(callback)
               callback(result);
         },
         error: function(){
         }
      })
   }
   
   // 댓글 삭제를 위한 함수 선언
   function reRemove(reply, callback) {
      $.ajax({
         url: "/replies/remove",
         type: "delete",
         data: JSON.stringify(reply),
         contentType:"application/json; charset=utf-8",
         success: function(result) {
            if(callback)
               callback(result);
         },
         error: function(){
         }
      })
   }
   
   
   
   
   return {
      add:add,
      getList:getList,
      reDetail:reDetail,
      reUpdate:reUpdate,
      reRemove:reRemove
   };
})()