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
              height: 500,
              disabledResizeEditor:true,            
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],	 
              focus: true
            });
          });
  })( jQuery );
  </script>
  <style>
      .input-group-text{width:80px}
      .referSpan{padding:10px; margin-right: 2px;}
        .w3-dropdown-content{min-width: 714px !important;}
        .drop-zone {
          margin-left: 80px;
          width: 100%;
          height: 110px;
          border: 1px solid lightgray;
          overflow: auto;
          font-weight: bolder; 
        }
        .empAddZone {
          margin-left: 80px;
          width: 100%;
          text-align: left!important;
          font-size: 15pt;
        }
        .empListInput{width: 867px !important; }
        .dropFile{ text-decoration:underline !important; cursor: pointer; color: rgb(109, 107, 107)!important;}
        .dropFile:hover{ text-decoration:underline !important; cursor: pointer; }
        
  </style>
</head>
<body>
  <% request.setAttribute("mm",session.getAttribute("mm"));
    session.removeAttribute("mm"); %>
	<jsp:include page="../common/header.jsp"/>
    <section>
      <div class="outer">    
        <p class="pageTitle">  e-mail <b>전자메일</b></p>
        <jsp:include page="mailSidebar.jsp"/>
        <div class="mailOuter row">
          <div class="card" style="margin-bottom: 5rem; width:100%">
            <div class="card-body">
              <form action="send.mail"  method="post" enctype="Multipart/form-data" id="form">
                <h3 style="margin-bottom: 25px;">메일쓰기</h3>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">제목</span>
                  </div>
                  <input type="text" name="mailTitle" placeholder="제목을 입력해주세요" class="form-control" value="${replyType}${mm.mailTitle}">
                </div>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">받는사람</span>
                  </div>
                  <div class="w3-dropdown-click" style="width:700px">
                    <div class="empListDiv w3-dropdown-content w3-bar-block w3-light-grey" id="receiveListDiv">
                      <input type="text" class="form-control empListInput" name="receiveAry" 
                      <c:if test="${replyType eq 're:'}">value="${mm.sender}"</c:if> 
                      <c:if test="${replyType eq 'me:'}">value="${loginUser.email}" readonly</c:if> 
                          id="receiveListInput" placeholder="(선택사항)이름을 입력하세요" onkeyup="filterFunction()">
                       <!-- 동적문구 -->
                       <a class="w3-bar-item w3-button" id="receiveKeyupInput" style="display: none;"></a>
                       <input type="hidden" value="" style="display: none;">
                       <!-- 동적 추가된 span자리 -->
                    </div>
                  </div>
                  <div id="receiveListSpan" class="empAddZone" style="text-align: center; font-size: 15pt;">
                    <span><input type="hidden" value="-1"></span> 
                
                  </div>
                </div>

                <c:if test="${replyType ne 'me:'}">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text bg-white border-0">수신참조</span>
                    </div>
                    <div class="w3-dropdown-click" style="width:700px">
                      <div class="empListDiv w3-dropdown-content w3-bar-block w3-light-grey" id="referListDiv">
                        <input type="text" class="form-control empListInput" name="refReceiveAry" id="referListInput" placeholder="(선택사항)이름을 입력하세요" onkeyup="filterFunction()">
                        <!-- 동적문구 -->
                          <a class="w3-bar-item w3-button" id="refKeyupInput" style="display: none;"></a>
                        <input type="hidden" value="" style="display: none;">
                      </div>
                    </div>
                    <div id="referListSpan" class="empAddZone" style="text-align: center; font-size: 15pt;">
                      <span><input type="hidden" value="-1"></span> 
                      <!-- 동적 추가된 span자리 -->
                    </div>
                  </div>
                </c:if>


                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">파일첨부</span>
                  </div>
                  <input type="file" id="file" name="upfile" multiple>
                  <div class="drop-zone" style="text-align: center; font-size: 15pt;">
                    <br>
                    <c:choose>
                      <c:when test="${empty mm.at}">
                        <i class="far fa-clone"></i>
                        파일을 여기로 드래그하세요.
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="at" items="${ mm.at }">
                          <a class="dropFile" style="font-size: 12pt; " href="${at.fileUrl}"><i class="fas fa-file-download"></i>&nbsp;${at.originName}</a><br>
                        </c:forEach>
                        </c:otherwise>
                      
                    </c:choose>
                    
                  </div>
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="mailContent" id="summernote" maxlength="140" rows="7" autocomplete="off">
                      <c:if test="${!empty mm.mailTitle}">
                        ----------Original Message---------- <br>
                        From: ${mm.sender} <br>
                        To: ${mm.receiver}  <br>
                        Cc: ${mm.refReceiver} <br>
                        Sent:  ${mm.receiveDate}${mm.sendDate} <br> 
                        Subject: ${mm.mailTitle}  <br>
                        <br><br>
                        ${mm.mailContent}
                      </c:if>
                    </textarea>
                </div><br>
                <div class="row justify-content-center">
                  <button type="button" id="submitBtn" class="btn btn-primary">발송하기</button>&nbsp;
                  <button type="button" onclick="location.href=''" class="btn btn-secondary">취소</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <br>
    </section>


    <script>
      $(document).on('click', '#submitBtn', function () {
          if($("#docName").val()=="") {
            alert("제목은 반드시 입력하셔야합니다");
            return false;
          } else if($("#summernote").val() == "") {
            alert("내용은 반드시 입력하셔야합니다");
            return false;
          } else {
            if (confirm("정말로 제출하시겠습니까?\n기안 후엔 수정이 불가능합니다.")) {
              $("#form").submit();
            }
          }
        });


      $(function () {

        var $file = document.getElementById("file")
        var dropZone = document.querySelector(".drop-zone")

        var toggleClass = function (className) {
          var list = ["dragenter", "dragleave", "dragover", "drop"]

          for (var i = 0; i < list.length; i++) {
            if (className === list[i]) {
              dropZone.classList.add("drop-zone-" + list[i])
            } else {
              dropZone.classList.remove("drop-zone-" + list[i])
            }
          }
        }

        var showFiles = function (files) {
          dropZone.innerHTML = ""
          for (var i = 0, len = files.length; i < len; i++) {
            dropZone.innerHTML += "<p>" + files[i].name + "</p>"
          }
        }

        var selectFile = function (files) {
          // input file 영역에 드랍된 파일들로 대체
          $file.files = files
          showFiles($file.files)

        }

        $file.addEventListener("change", function (e) {
          showFiles(e.target.files)
        })

        // 드래그한 파일이 최초로 진입했을 때
        dropZone.addEventListener("dragenter", function (e) {
          e.stopPropagation()
          e.preventDefault()

          toggleClass("dragenter")

        })

        // 드래그한 파일이 dropZone 영역을 벗어났을 때
        dropZone.addEventListener("dragleave", function (e) {
          e.stopPropagation()
          e.preventDefault()
          $(this).css("background-color", "#FFF");
          toggleClass("dragleave")

        })

        // 드래그한 파일이 dropZone 영역에 머물러 있을 때
        dropZone.addEventListener("dragover", function (e) {
          e.stopPropagation()
          e.preventDefault()
          $(this).css("background-color", "rgb(248, 241, 214)");
          toggleClass("dragover")

        })

        // 드래그한 파일이 드랍되었을 때
        dropZone.addEventListener("drop", function (e) {
          e.preventDefault()
          $(this).css("background-color", "#FFF");
          $(this).css("font-size", "11pt");
          $(this).css("text-align", "left");

          toggleClass("drop")

          var files = e.dataTransfer && e.dataTransfer.files

          if (files != null) {
            if (files.length < 1) {
              alert("폴더 업로드 불가")
              return
            }
            selectFile(files)
          } else {
            alert("ERROR")
          }

        })

      });
    </script>


<script>
  $(function(){

    // inputList
    $(".empListDiv").on("click", "a", function(){
        var email= $(this).next().val();  //a태그로 클릭한 사람의 강보람/boram@naver.com
        var strArray=$(this).text().split(" "); // a태그로 선택한 사람으르 배열로 [강보람,대표이사]

        var regExp =/^[0-9a-zA-Z가-힣/]([-_.]?[0-9a-zA-Z가-힣/])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if(!regExp.test(email)){
            alert("유효한 이름을 입력해주세요");
        } else {
              //선택한 항목(수신/참조)에 있는 인풋 리스트 조회
              var inputs = $(this).parent().parent().next().find("input[type=hidden]");

              // a의 아빠의 아빠의 다음
              var inputCate = ['', ''];
              // 수신인지 참조인지 확인
              if($(this).parent().attr("id")=='referListDiv'){
                inputCate = ['refReceiveAry', 'referSpan'];
              } else {
                inputCate = ['receiveAry', 'receiveSpan'];
              }

              //중복체크
              var addCheck=0; //이미 선택한 사람인지 확인하기 위한 변수
              $(inputs).each(function(index, el){  
                      var match =inputs.eq(index).val();   // 반복문이 도는 input의 각각의 벨류                  
                    //만약 기존추가된 input과 추가할 사번이 일치하고, input의 갯수가 1개가 아니면 생략
                    if(match==email&&$(inputs).length!=1){  
                          addCheck++;
                    }
              })
              if(addCheck==0){
                // console.log(addCheck);
                // 선택한 항목 추가하기
                $("<span class='btn-sm btn-light "+inputCate[1]+" disabled'><input type='hidden' name='"+inputCate[0]+"' value='"+email+"'>"
                +strArray[0]+" "+strArray[1]+" <button type='button' class='badge badge-light'> &times;</button></span>").appendTo($(this).parent().parent().next());
              }
          }
          // 조회완료후 리스트닫아주기
          $(".empListInput").nextAll().css("display","none");
          $(".empListInput").val("");
          
      })
      
    })

    // 전사원 리스트 세팅
    $(function(){
      <c:forEach var="p" items="${ empList }" varStatus="status">
        $("<a class='w3-bar-item w3-button'>${p.memName} ${p.rank} "
          +"<c:if test='${!empty p.job }'>(${p.job}) </c:if>/ ${p.department} / ${p.email}</a><input type='hidden' value='${p.email}'>").appendTo("#referListDiv");
          $("<a class='w3-bar-item w3-button'>${p.memName} ${p.rank} "
          +"<c:if test='${!empty p.job }'>(${p.job}) </c:if>/ ${p.department} / ${p.email}</a><input type='hidden' value='${p.email}'>").appendTo("#receiveListDiv");
      </c:forEach>
    
        var x = document.getElementById("referListDiv");
        var y = document.getElementById("receiveListDiv");

        $("#referListInput").nextAll().css("display","none");
        $("#receiveListInput").nextAll().css("display","none");

        if (y.className.indexOf("w3-show") == -1) {
          y.className += " w3-show";
        } else {
          y.className = y.className.replace(" w3-show", "");
        }

        if (x.className.indexOf("w3-show") == -1) {
          x.className += " w3-show";
        } else {
          x.className = x.className.replace(" w3-show", "");
        }
      })

      // 참조 삭제
      $(".empAddZone").on("click", "span button", function(){  
        $(this).parent().remove();
      })

      // 키업으로 글작성시 아래로 리스트 표시하는 기능
    function filterFunction() {

      // 참조부분
      if($("#referListInput").val().length >= 1){
      
        $("#refKeyupInput").text($("#referListInput").val()+" ");
        $("#refKeyupInput").next().val($("#referListInput").val());
        
        $("#referListDiv").css("z-index","1");
          var input, filter, ul, li, a, i;
          input = document.getElementById("referListInput");
          filter = input.value.toUpperCase();
          div = document.getElementById("referListDiv");
          a = div.getElementsByTagName("a");
          for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              a[i].style.display = "";
            } else {
              a[i].style.display = "none";
            }
          }
        }else{
          $("#referListInput").nextAll().css("display","none");
        }

        // 수신부분
        if($("#receiveListInput").val().length >= 1){

          $("#receiveKeyupInput").text($("#receiveListInput").val()+" ");
          $("#receiveKeyupInput").next().val($("#receiveListInput").val());
          
          $("#referListDiv").css("z-index","0");
          var input, filter, ul, li, a, i;
          input = document.getElementById("receiveListInput");
          filter = input.value.toUpperCase();
          div = document.getElementById("receiveListDiv");
          a = div.getElementsByTagName("a");
          for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              a[i].style.display = "";
            } else {
              a[i].style.display = "none";
            }
          }
        }else{
          $("#receiveListInput").nextAll().css("display","none");
        }
  }
</script>


</body>
</html>