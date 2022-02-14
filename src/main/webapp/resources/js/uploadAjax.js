$(document).ready(function(){
	
	//파일의 크기와 확장자를 검사하는 함수 선언
    //서버에서 설정해 놓은 파일 크기 설정
    var maxSize=5242880; //5MB
    //서버에서 허용 불가능한 확장자 설정(정규식)
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
    
    function checkExtension(fileSize, fileName){  //(파일의크기, 확장자)
        //사용자가 선택한 파일의 크기가 서버에서 설정해놓은 파일의 크기보다 이상이면
        if(fileSize>=maxSize) { //(사용자가 선택한 파일크기 >= 서버에서 설정해 놓은 파일 크기)
            alert("파일 사이즈 초과");
            return false;
        }
        //사용자가 선택한 파일의 확장자가 서버에서 설정해 놓은 파일의 확장자와 일치하지 않으면
        if(regex.test(fileName)){
            alert("해당 종류의 파일은 업로드 할 수 없습니다.");
            return false;
        }
        return true;
    }

	var formObj = $("form[role='form']")
    //글쓰기 버튼을 클릭하면
    $("input[type='submit']").on("click",function(e){
//        e.preventDefault();
        var str="";
        //li태그에 있는 data선택자를 이용하여 input태그의 value값으로 세팅
        $("#uploadResult ul li").each(function(i,obj){
            console.log(obj);
            //data선택자를 이용하여 인풋태그의 밸류값으로 세팅
            /*
             * data함수
             * <span>
             * #("span").data("age",13) => <span data-age="13"> data함수 괄호안에 매개변수가 두개면 setter
             * <span data-age="13">
             * #("span").data("age") => 13 data함수 괄호안에 매개변수가 하나면 getter
             * */
            str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+$(obj).data("filename")+"'>"
            str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+$(obj).data("uuid")+"'>"
            str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+$(obj).data("path")+"'>"
            str+="<input type='hidden' name='attachList["+i+"].image' value='"+$(obj).data("type")+"'>"
        })
        formObj.append(str).submit();
        //.html()과 달리 append는 덮어쓰기가 아니라 추가를 해줌
        //.submit은 'append함과 동시에 submit을 해라'라는 의미

        
    })




	$("input[type='file']").on("change",function(e){
//         alert("aaa")
        //가상의 form태그
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");
        var files = inputFile[0].files;
           
        console.log(files)
        for(var i=0;i<files.length;i++){
            //파일의 크기가 이상이면
            if(!checkExtension(files[i].size,files[i].name)){
                //밑에 있는거 하지마라
                return false
            }
            formData.append("uploadFile",files[i]);
        }
        
        //ajax를 이용해서....
        //formData 자체를 데이터로 전송하고,
        //formData를 데이터로 전송할 때에는
        //processData와 contentType는 반드시 false여야 함.
        $.ajax({
        	url:"/uploadAjaxAction",
            type:"post",
            data:formData,
            processData:false,
            contentType:false,
            success:function(result){ //사용자가 선택한 파일을 원하는 경로에 업로드 한 후.....
            	//showUploadedFile함수 호출
                showUploadedFile(result);
            }
        })//$ajax 끝...
        
    })
})//$(document).ready(function(){ 끝..

// 사용자가 선택한 파일을 원하는 경로에 성곡적으로 업로드 한 후 웹브라우저에 파일을 띄워라에 대한 함수 선언(showUploadedFile)
function showUploadedFile(uploadresultArr){
    var str="";
    $(uploadresultArr).each(function(i,obj){
        console.log(obj);
        if(!obj.image){ //사용자가 업로드한 파일의 타입이 이미지가 아니면(엑셀문서 파일, ppt파일 등등)
        	var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName)
            str+="<li data-path='"+obj.uploadPath+"'";
            str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
            str+="<li><a href='download?fileName="+fileCallPath+"'>"+obj.fileName+"</li>"
        }else{ //사용자가 업로드한 파일의 타입이 이미지가 맞으면(.jpg, .png, .gif)
        	var fileCallPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName)
            console.log(fileCallPath)
            //img태그를 사용해서 웹브라우저에 이미지 출력
            str+="<li data-path='"+obj.uploadPath+"'";
            str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
            str+="<img src='/display?fileName="+fileCallPath+"'></li>"
        } 
    })
    $("#uploadResult ul").html(str)
}