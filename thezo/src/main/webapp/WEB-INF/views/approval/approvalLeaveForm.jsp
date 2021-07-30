<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

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
    }


</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">
          <p class="pageTitle"> leaveForm <b> 연차신청서</b></p>
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
                    <input type="text" placeholder="제목을 입력해주세요" id="docName" name="docName" class="form-control" required>
                  </div>
        
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text bg-white border-0">수신참조</span>
                    </div>
                    <div class="w3-dropdown-click" style="width:700px">
                      <div class="w3-dropdown-content w3-bar-block w3-light-grey" id="referListDiv">
                        <input type="text" class="form-control" placeholder="(선택사항)이름을 입력하세요" id="referListInput"
                          onkeyup="filterFunction()">
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
        
                  <div class="input-group mb-3" style="width:30%">
        
                    <div class="input-group-prepend">
                      <span class="input-group-text" style="background-color: white; border:0px;">휴가분류</span>
                    </div>
                    <select class="form-control" id="leaveType" name="leaveCategory">
                      <option>연차</option>
                      <option>경조사</option>
                    </select>
                  </div>
        
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" style="background-color: white; border:0px;">시작일자</span>
                    </div>
                    <input type="date" class="form-control" name="startDate" id="startDate" style="border:1px solid lightgray;">
                    <div class="input-group-prepend">
                      <span class="input-group-text" style="background-color: white; border:0px;">종료일자</span>
                    </div>
                    <input type="date" class="form-control" name="endDate" id="endDate"  max="2021-08-03" style="border:1px solid lightgray;">
                    <div class="input-group-prepend">
                      <span class="input-group-text" style="margin-left:5px; width:130px;">
                        차감연차: &nbsp;
                        <b class="text-primary" id="countLeave"> 0</b>
                        <input type="hidden" name="leaveCount" id="leaveCount" value="0">
                        개
                      </span>
                    </div>
                  </div>
        
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" style="background-color: white; border:0px;">휴가사유</span>
                    </div>
                    <textarea class="form-control" maxlength="50" rows="4" name="content" id="content" placeholder="휴가 사유를 입력해주세요"
                      style="resize:none; height: 60px"></textarea>
                  </div>
                  <br>
                  <div class="row justify-content-center">
                    <button type="submit" id="submitBtn" class="btn btn-primary">기안하기</button>&nbsp;
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

        $("input[type=date],#leaveType").change(function(){
          var startDate = new Date($("#startDate").val());
          var endDate = new Date($("#endDate").val());
          var count = 0;

          var checkWhile = true;
          if ($("#startDate").val() == "" || $("#endDate").val() == "" || $("#leaveType").val()=="경조사") {
            checkWhile = false;
          }

          while (checkWhile) {
            var temp_date = startDate;
            if (temp_date.getTime() > endDate.getTime()) {
              break;
            } else {
              var tmp = temp_date.getDay();
              if (tmp != 0 && tmp != 6) {
                count++;
              }
              temp_date.setDate(startDate.getDate() + 1);
            }
          }

          $("#countLeave").text(count);
          $("#leaveCount").val(count);
        
        })
      })

      </script>
        
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
          } else if($("#startDate").val() == "" || $("#endDate").val() == "" ) {
            alert("시작날짜 및 종료날짜는 필수사항입니다");
            return false;
          } else if($("#content").val() == "") {
            alert("휴가사유는 필수사항입니다");
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