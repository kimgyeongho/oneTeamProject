<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나 홀로 집에</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/jquery/jquery-3.5.1.min.js"></script>
    <script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="resources/jquery/jquery-ui.min.js"></script>
    <script src="resources/jquery/jstyle.js"></script>
</head>
<style>
.uploadResult {
	width: 100%;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
<body>
   <header>
        <div class="header_container">
        <a href="/">
            <div class="header_logo">
            <!-- <img src="img/logo.png" alt="로고"> -->
            </div>
        </a>   
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>소개</p> 
                <ul class="nav_ul_b">
                    <a href="perpose.do"><li>목표</li></a>
                    <a href="service_info.do"><li>서비스 소개</li></a>
                    <a href="#"><li>만든이</li></a>
                </ul>
                </li>
            </ul>
        </nav>      
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>회원관리</p> 
                <ul class="nav_ul_b">
                    <a href="authentication.do"><li>회원가입</li></a>
                    <a href="login.do"><li>로그인</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul"> 
                <li><p>부동산</p> 
                <ul class="nav_ul_b">
                    <a href="map.do"><li>지도보기</li></a>
                    <a href="board_all.do"><li>게시판</li></a>
                               <c:if test="${user != null}">        
                    <a href="boardWrite.do"><li>글쓰기</li></a>
                    </c:if>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>서비스</p> 
                <ul class="nav_ul_b">
                    <a href="tips.do"><li>팁</li></a>
                    <a href=""><li>언어 / Language</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        </div>  
        <div class="div_allow">
            <img id="nav_left_arrow" src="resources/img/arrow_left_w.png" alt="왼쪽화살표">
            <img id="nav_right_arrow"src="resources/img/arrow_right_w.png" alt="오른쪽화살표">
        </div>    
    </header>         
    <section class="all_body_section">
         <!-- 게시판 작성 부분 -->
        <div class="board_table">
        <form action="#">                      
        <table class="boardWrite_table">
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">제목</td>
                <td><input type="text" placeholder="제목을 입력하세요"></input></td>
            </tr>
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">카테고리</td>
                <td>
                    <select name="catagorized" id="content_character">
                        <option value="카테고리를 선택해 주세요">선택</option>
                        <option value="카테고리">원룸</option>
                        <option value="기타1">투룸</option>
                        <option value="기타2">계약 기간 6개월 이상</option>
                        <option value="기타2">계약 기간 6개월 미만</option>
                    </select>
                </td>
            </tr>
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">아이디</td>
                <td>${user.userID}</td>
            </tr>                     
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">내용</td>
                <td><textarea class="boardWrite_textarea" cols="5" rows="11" maxlength="15000">내용을 입력하세요</textarea></td>
            </tr>          
           <tr>
           <td><div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">File Attach</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple>
        </div>
        
        <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
        
        
      </div>
    </div>
  </div>
</div>
           </td>
           </tr>       
        </table> 
        
    </form> 
       
    <!-- 첨부파일창 부분 -->
    <div class="img_file_container" style="margin-top: 12px; margin-bottom: 24px; width:120px; float: left; margin-left:150px;">
    <input type="file" name="add_image" id="add_fileA"></input>
    <input type="file" name="add_image" id="add_fileB"></input>
    </div>
    <!-- 보드 검색창 버튼 부분 -->
    <div class="boardWrite_btn_container" >                
        <button type="submit" class="board_search_btn" name="insert">올리기</button>                      
        <a href="board.do"><button class="board_fix_btn" name="update">수정하기</button></a>    
        <button class="board_delete_btn" name="delete">삭제하기</button></a>    
    </div>    
    </div>      
        </section>      
    <script type="text/javascript">
    $(document).ready(function(e){

      var formObj = $("form[role='form']");
      
      $("button[type='submit']").on("click", function(e){
        
        e.preventDefault();
        
        console.log("submit clicked");
        
      });
    });
    
    
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 5242880; //5MB
    
    function checkExtension(fileName, fileSize){
      
      if(fileSize >= maxSize){
        alert("파일 사이즈 초과");
        return false;
      }
      
      if(regex.test(fileName)){
        alert("해당 종류의 파일은 업로드할 수 없습니다.");
        return false;
      }
      return true;
    }
    
    $("input[type='file']").change(function(e){

      var formData = new FormData();
      
      var inputFile = $("input[name='uploadFile']");
      
      var files = inputFile[0].files;
      
      for(var i = 0; i < files.length; i++){

        if(!checkExtension(files[i].name, files[i].size) ){
          return false;
        }
        formData.append("uploadFile", files[i]);
        
      }
      
      $.ajax({
        url: '/uploadAjaxAction',
        processData: false, 
        contentType: false,data: 
        formData,type: 'POST',
        dataType:'json',
          success: function(result){
            console.log(result); 
  		  showUploadResult(result); //업로드 결과 처리 함수 

        }
      }); //$.ajax
      
    });  
    function showUploadResult(uploadResultArr){
	    
        if(!uploadResultArr || uploadResultArr.length == 0){ return; }
        
        var uploadUL = $(".uploadResult ul");
        
        var str ="";
        
        $(uploadResultArr).each(function(i, obj){
        
    		if(obj.image){
    			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
    			str += "<li data-path='"+obj.uploadPath+"'";
    			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
    			str +" ><div>";
    			str += "<span> "+ obj.fileName+"</span>";
    			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
    			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    			str += "<img src='/display?fileName="+fileCallPath+"'>";
    			str += "</div>";
    			str +"</li>";
    		}else{
    			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
    		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
    		      
    			str += "<li "
    			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
    			str += "<span> "+ obj.fileName+"</span>";
    			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
    			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    			str += "<img src='/resources/img/attach.png'></a>";
    			str += "</div>";
    			str +"</li>";
    		}

        });
        
        uploadUL.append(str);
      }

      $(".uploadResult").on("click", "button", function(e){
    	    
        console.log("delete file");
          
        var targetFile = $(this).data("file");
        var type = $(this).data("type");
        
        var targetLi = $(this).closest("li");
        
        $.ajax({
          url: '/deleteFile',
          data: {fileName: targetFile, type:type},
          dataType:'text',
          type: 'POST',
            success: function(result){
               alert(result);
               
               targetLi.remove();
             }
        }); //$.ajax
       });

    </script>
   
</body>
</html>