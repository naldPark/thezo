<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="resources/summernote-0.8.18-dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<script>
  jQuery.noConflict();
  (function( $ ) {
    $(document).ready(function() {
            $('#summernote').summernote({
              toolbar: [
                ['fontname', ['fontname']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert',['picture','link']],
              ],
              lang: 'ko-KR',
              placeholder: '내용을 입력해주세요',
              height: 700,
              disabledResizeEditor:true,            
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],	 
              focus: true
            });
          });
  })( jQuery );
  </script>
  <style>
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
    .input-group-text{width:80px}
      /* *{border:1px solid red} */
      ul, #myUL {
      list-style-type: none;
    }
    
    #myUL {
      margin: 0;
      padding: 0;
      line-height:2em;
    }
    
    .box {
        cursor: pointer;
        -webkit-user-select: none; /* Safari 3.1+ */
        -moz-user-select: none; /* Firefox 2+ */
        -ms-user-select: none; /* IE 10+ */
        user-select: none;
    }

    .box::before {
        content: "\25B6";
        color: rgb(121, 121, 121);
        display: inline-block;
        margin-right: 6px;
    }

    .line::before {
        content: "\268A";
        color: lightgray;
        display: inline-block;
        margin-right: 6px;
    }

    .check-box::before {
        -ms-transform: rotate(90deg); /* IE 9 */
        -webkit-transform: rotate(90deg); /* Safari */
        transform: rotate(90deg);  
    }

    .nested {
        display: none;
    }

    .active {
        display: block;
    }
/* *{border:1px solid red} */
    #contactList table tbody tr td img{width:30px; height:30px;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
          <p class="pageTitle">  approval <b> 전자결재</b></p>
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter row ">
              <div class="card border-0" style=" width:80%">
                <div class="card-body">
                  <form action="" method="post" enctype="Multipart/form-data" id="form">
                    <h3 style="margin-bottom: 25px;">시말서</h3>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">제목</span>
                      </div>
                      <input type="text" placeholder="제목을 입력해주세요" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">수신참조</span>
                      </div>
                      <input type="text" class="form-control" value="">
                    </div>
                  
                    <div class="form-group">
                        <textarea class="form-control" id="summernote" maxlength="140" rows="7" autocomplete="off"></textarea>
                    </div><br>
                    <div class="filebox justify-content-center">
                      <input class="upload-name" value="" disabled="disabled"> 
                      <label for="rwFilename" style="font-size: 11pt;">파일 첨부하기</label> 
                      <input type="file" id="rwFilename" name="rwFilename" class="upload-hidden" onchange="checkSize(this)"> 
                    </div>
                      <br>
                    <div class="row justify-content-center">
                      <button type="button" id="submitBtn" class="btn btn-primary">기안하기</button>
                      <button type="button" onclick="location.href=''" class="btn btn-secondary">취소</button>
                    </div>

                  </form>
                </div>
              </div>
             
              <div class="card row  border-0" style="margin-bottom: 5rem; width:21%">
                <div class="card-body">
                  <h5>결재선 등록</h5>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="검색어">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="submit" data-toggle="modal" data-target="#myModal">추가</button>
                    </div>
                  </div>
                  <div class="newDocu mb-2">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="newDocu mb-2">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">합의</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="newDocu mb-2">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                </div>
              </div>


            </div>
    	</div>
    </section>

<script>
     $(document).on('click','#submitBtn',function(){
          if(confirm("정말로 제출하시겠습니까?\n기안 후엔 수정이 불가능합니다.")){
            $("#form").submit();
          }					
        });

              // 파일첨부 시작
      $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden'); fileTarget.on('change', function(){
            if(window.FileReader){
              var filename = $(this)[0].files[0].name; 
            } else { 
              var filename = $(this).val().split('/').pop().split('\\').pop(); 
            } 
            $(this).siblings('.upload-name').val(filename); 
          }); 
       });

        function checkSize(input) {
        	
        	pathpoint = input.value.lastIndexOf('.');
        	filepoint = input.value.substring(pathpoint+1,input.length);
        	filetype = filepoint.toLowerCase();

        	
          if (input.files && input.files[0].size > (20 * 1024 * 1024)) {
              alert("파일 사이즈가 20mb 를 넘습니다.");
              input.value = null; 
            }
          } //파일첨부 끝
</script>
    

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">결재선 지정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body row pl-3 justify-content-center">

            <div>
                <h5>조직도</h5>
                <div class="p-3" style="border:1px solid lightgrey; width:400px;">
                    
                    <ul id="myUL">
                        <li> 대표이사</span>
                            <ul>
                                <li><span class="line">본부1</span></li>
                                <li><span class="line">본부2</span></li>
                                <li>
                                    <span class="box">본부3</span>
                                    <ul class="nested">
                                        <li><span class="line">팀1</span></li>
                                        <li><span class="line">팀2</span></li>
                                        <li>
                                            <span class="box">팀시리리리3</span>
                                            <ul class="nested">
                                                <li>김말똥 과장</span></li>
                                                <li>김개똥 부장</span></li>
                                                <li>김개순</span></li>
                                                <li>김밀똥</span></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>  
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
          <div class="p-2 align-self-center">
            <button type="button" class="btn btn-sm btn-outline-secondary">추가</button><br>
            <button type="button" class="btn btn-sm mt-2 btn-outline-secondary">삭제</button>
          </div>
          <div>
            <h5>적용대상 <b class="text-primary">4</b>명</h5>
            <div class="p-3" style="border:1px solid lightgrey; width:400px;">
                
               <table class="table table-sm table-borderless">
                <tr>
                    <th>1</th>
                    <td>인사팀 팀장</td>
                    <th>이성경 부장</th>
                    <th>
                        <button type="button" class="btn btn-sm btn-primary">결재</button>
                        <button type="button" class="btn btn-sm btn-light">합의</button>
                    </th>
                </tr>
                <tr>
                    <th>2</th>
                    <td>인사팀</td>
                    <th>이선영 과장</th>
                    <th>
                        <button type="button" class="btn btn-sm btn-primary">결재</button>
                        <button type="button" class="btn btn-sm btn-light">합의</button>
                    </th>
                </tr>
                <tr>
                    <th>3</th>
                    <td>경영지원본부 본부장</td>
                    <th>신재원 상무</th>
                    <th>
                        <button type="button" class="btn btn-sm btn-primary">결재</button>
                        <button type="button" class="btn btn-sm btn-light">합의</button>
                    </th>
                </tr>
               </table>
            </div>
        </div>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" >등록</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
  
      </div>
    </div>
  </div>
  
  <script>
    // 왼쪽 조직트리 클릭시 하위 조직 표시
    var toggler = document.getElementsByClassName("box");
    var i;
    for (i = 0; i < toggler.length; i++) {
    toggler[i].addEventListener("click", function() {
        this.parentElement.querySelector(".nested").classList.toggle("active");
        this.classList.toggle("check-box");
    });
    }
</script>


</body>
</html>