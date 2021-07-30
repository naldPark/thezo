<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        (function ($) {
          $(document).ready(function () {
            $('#summernote').summernote({
              toolbar: [
                ['fontname', ['fontname']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['picture', 'link']],
              ],
              lang: 'ko-KR',
              placeholder: '내용을 입력해주세요',
              height: 700,
              disabledResizeEditor: true,
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
              fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
              focus: true
            });
          });
        })(jQuery);
      </script>


      <style>
        .referSpan{padding:10px; margin-right: 2px;}
        .w3-dropdown-content{min-width: 714px !important;}
        .drop-zone {
          margin-left: 80px;
          width: 100%;
          height: 110px;
          border: 1px solid lightgray;
          overflow: auto;

        }

        .refer-zone {
          margin-left: 80px;
          width: 100%;
          text-align: left!important;
          /* border: 1px solid lightgray;
          overflow: auto; */

        }

      </style>

    </head>

    <body>
      <jsp:include page="../common/header.jsp" />
      <section>
        <div class="outer">
          <p class="pageTitle"> approval <b> 전자결재</b></p>
          <jsp:include page="apprSidebar.jsp" />
          <form action="insertDocu.appr" method="post" enctype="Multipart/form-data" id="form">
          <div class="sideOuter row ">
            <div class="card border-0" style=" width:80%">
              <div class="card-body">
                <input type="hidden" name="formNo" value="${a.formNo }">
                  <h3 style="margin-bottom: 25px;">${ a.formName } </h3>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text bg-white border-0">제목</span>
                    </div>
                    <input type="text" placeholder="제목을 입력해주세요" name="docName" id="docName" class="form-control" required>
                  </div>

                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text bg-white border-0">수신참조</span>
                    </div>
                    <div class="w3-dropdown-click" style="width:700px">
                      <div class="w3-dropdown-content w3-bar-block w3-light-grey" id="referListDiv">
                        <input type="text" class="form-control"  placeholder="(선택사항)이름을 입력하세요" id="referListInput" onkeyup="filterFunction()">
                      </div>
                    </div>
                    <div id="referListSpan" class="refer-zone" style="text-align: center; font-size: 15pt;">
                    </div>
                  </div>
              
                  
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text bg-white border-0">파일첨부</span>
                    </div>
                    <input type="file" id="file" name="upfile" multiple>
                    <div class="drop-zone" style="text-align: center; font-size: 15pt;">
                      <br>
                      <i class="far fa-clone"></i>
                      파일을 여기로 드래그하세요.
                    </div>
                  </div>
      
                  <div class="form-group">
                    <textarea class="form-control" name="content" id="summernote" maxlength="140" rows="7"
                      autocomplete="off">${ a.formContent }</textarea>
                  </div><br>
                  <div class="row justify-content-center">
                    <button type="button" id="submitBtn" class="btn btn-primary">기안하기</button>&nbsp;
                    <button type="button" onclick="location.href='main.appr'" class="btn btn-secondary">취소</button>
                  </div>
      
               
              </div>
            </div>
            <!--오른쪽 결재선 시작-->
            <div class="card row  border-0" style="margin-bottom: 5rem; width:21%">
              <div class="card-body" id="selectedLine">
                <h5 style="float:left; width: 70%">결재선</h5>
                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#apprLineModal">변경</button>
                <hr>
      
                <c:forEach var="c" items="${ cLine }">
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex">
                      <div class="p-2 text-primary"><b>${c.memName} ${c.job}</b></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <div class="pl-2" style="width:75%">${c.department} </div>
                      <div>
                        <span class="btn-sm btn-secondary">
                          ${c.type}
                        </span>
                      </div>
                    </div>
                    <input type="hidden" name="apAccept[${c.apprLevel-1}].memNo" value="${c.memNo}">
                    <input type="hidden" name="apAccept[${c.apprLevel-1}].type" value="${c.type}">
                    <input type="hidden" name="apAccept[${c.apprLevel-1}].apprLevel" value="${c.apprLevel}">
                  </div>
                </c:forEach>
      
      
              </div>
            </div>
            <!--오른쪽 결재선 끝-->
      
          </div>
        </form>
        </div>
      </section>



      <script>

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

      </script>
      
      <script>
        $(function(){
      
          // 참조inputList
          $("#referListDiv").on("click", "a", function(){
            // console.log($(this));
            var strArray=$(this).text().split(" ");
            $("<span class='btn-sm btn-light referSpan disabled'><input type='hidden' name='refMemNoAry' value='"+$(this).next().val()+"'>"
              +strArray[0]+" "+strArray[1]+" <button type='button' class='deleteRefer badge badge-light'> &times;</button></span>").appendTo("#referListSpan");
            $("#referListInput").nextAll().css("display","none");
            $("#referListInput").val("");
      
            // console.log($(".referSpan").val()+"왜지");
          })
      
          // 수신참조 세팅
          $(function(){
            <c:forEach var="p" items="${ empList }" varStatus="status">
              $("<a class='w3-bar-item w3-button'>${p.memName} ${p.rank} "
                +"<c:if test='${!empty p.job }'>(${p.job}) </c:if>/ ${p.department} / ${p.email}</a><input type='hidden' value='${p.memNo}'>").appendTo("#referListDiv");
            </c:forEach>
          
            var x = document.getElementById("referListDiv");
      
            $("#referListInput").nextAll().css("display","none");
      
            if (x.className.indexOf("w3-show") == -1) {
              x.className += " w3-show";
            } else {
              x.className = x.className.replace(" w3-show", "");
            }
          })
      
          // 참조 삭제
          $("#referListSpan").on("click", "span button", function(){  
            $(this).parent().remove();
          })
        })
        
        function filterFunction() {
          if($("#referListInput").val().length >= 1){
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
        }
        </script>

      <jsp:include page="apprLineModal.jsp" />
    </body>

    </html>