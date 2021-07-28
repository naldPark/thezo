<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>The Zo</title>
      <style>
        .note-modal-content,
        .note-modal-content:before,
        .note-modal-content:after {
          box-sizing: unset !important;
        }

        .note-modal-footer,
        .note-modal-footer:before,
        .note-modal-footer:after {
          box-sizing: unset !important;
        }

        .input-group-text {
          width: 80px
        }

        ul,
        #myUL {
          list-style-type: none;
        }

        #myUL {
          margin: 0;
          padding: 0;
          line-height: 2em;
        }

        .box {
          cursor: pointer;
          -webkit-user-select: none;
          /* Safari 3.1+ */
          -moz-user-select: none;
          /* Firefox 2+ */
          -ms-user-select: none;
          /* IE 10+ */
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
          -ms-transform: rotate(90deg);
          /* IE 9 */
          -webkit-transform: rotate(90deg);
          /* Safari */
          transform: rotate(90deg);
        }

        .nested {
          display: none;
        }

        .active {
          display: block;
        }

        .drop-zone {
          margin-left: 80px;
          width: 100%;
          height: 110px;
          border: 1px solid lightgray;
          overflow: auto;

        }

        label {
          margin-bottom: 0rem !important;
        }

        .eachPerson:hover {
          cursor: pointer !important;
          background-color: lightgray;
        }

        .eachPerson label:hover {
          cursor: pointer !important;
        }

        #currentLine tr:hover {
          cursor: pointer;
          background-color: lightgray;
        }
      </style>
    </head>

    <body>

      <!-- 결재선 모달 시작 -->
      <div class="modal" id="apprLineModal">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">

            <div class="modal-header">
              <h4 class="modal-title">결재선 지정</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!--모달 내 area시작 -->
            <div class="modal-body row pl-3 justify-content-center">
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="myInput" placeholder="검색어를 입력하세요">
              </div>
              <div>
                <h5>조직도</h5>
                <div class="p-3" style="border:1px solid lightgrey; width:400px; min-height: 500px;">

                  <ul id="myUL">
                    <li class="eachPerson" id="ceoCheck"></li></span>
                    <ul>
                      <li class="departmentLevel">
                        <span class="box">경영관리본부</span>
                        <ul class="nested">
                          <li>
                            <span class="box">인사팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">총무팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">회계팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                      <li class="departmentLevel">
                        <span class="box">개발본부</span>
                        <ul class="nested">
                          <li>
                            <span class="box">개발1팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">개발2팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">인프라팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                      <li class="departmentLevel">
                        <span class="box">운영본부</span>
                        <ul class="nested">
                          <li>
                            <span class="box">운영팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">영업팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                          <li>
                            <span class="box">구매팀</span>
                            <ul class="nested">
                              <li></li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </ul>
                </div>
              </div>
              <div class="p-2 align-self-center">
                <button type="button" class="btn btn-sm btn-outline-secondary" id="addAppr">추가</button><br>
                <button type="button" class="btn btn-sm mt-2 btn-outline-secondary" id="deleteAppr">삭제</button>
              </div>
              <div>
                <h5>적용대상 <b class="text-primary" id="countApprPpl">0</b>명</h5>
                <div class="p-3" style="width:600px;">

                  <table class="table text-center">
                    <thead>
                      <tr>
                        <th style="width:40%">대상자</th>
                        <th>부서</th>
                        <th>결재/합의</th>
                        <th>순서</th>
                      </tr>
                    </thead>
                    <tbody id="currentLine">

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <!--모달 내 area 끝 -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="enrollApprLineBtn">등록</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal" id="claseApprLineModal">취소</button>
            </div>

          </div>
        </div>
      </div>
      <!-- 결재선 모달 끝 -->


      <script>
        // 왼쪽 조직트리 클릭시 하위 조직 표시
        var toggler = document.getElementsByClassName("box");
        var i;
        for (i = 0; i < toggler.length; i++) {
          toggler[i].addEventListener("click", function () {
            this.parentElement.querySelector(".nested").classList.toggle("active");
            this.classList.toggle("check-box");
          });
        }

        // 검색시 노출
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
              console.log($("#myInput").val().length == 0);
              if ($("#myInput").val().length == 0) {
                $(".nested").removeClass("active");
                $(".box").removeClass("check-box");
              } else {
                $(".nested").addClass("active");
                $(".box").addClass("check-box");
                var value = $(this).val().toLowerCase();
                $(".eachPerson").filter(function () {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
              }
            });
          });


        // 조직트리 내 직원 리스트
        $(function () {
            $("#myUL").find(".box").each(function (index, el) {
              <c:forEach var="p" items="${ empList }" varStatus="status">
                if("대표이사"=="${p.department}"){
                  var ceoInfo="<label><input type='checkbox' style='display:none' value='${p.memNo}' class='apprLineCheck' /> ${p.memName} 대표이사</label>";
                  $("#ceoCheck").html(ceoInfo);
                }
                if($(this).text()=="${p.department}"){                  
                  if($(this).text().includes("본부")){
                    var temp=$(this).next();
                    $("<li class='eachPerson'><label><input type='checkbox' class='apprLineCheck' value='${p.memNo}' style='display:none' /> ${p.memName} ${p.rank} <c:if test='${!empty p.job }'>(${p.job})</c:if> </label></li>").prependTo(temp);
                  } else {
                    var temp=$(this).parent().find("ul");
                      $("<li class='eachPerson'><label><input type='checkbox' class='apprLineCheck' value='${p.memNo}' style='display:none' /> ${p.memName} ${p.rank} <c:if test='${!empty p.job }'>(${p.job})</c:if> </label></li>").appendTo(temp);
                  }                    
                }
              </c:forEach>
            })
        })


        // 추가버튼 클릭시 오른쪽 적용대상으로 이동 됨
        $("#addAppr").click(function () {

          if ($("#ceoCheck").find(":checkbox").prop("checked")) {
            var tempLine = "<tr><td class='text-left pl-5'>" + $("#ceoCheck").children().html()
              + "</td><td>대표이사</td><td><select class='selectBoxCustom'><option>결재</option>"
              + "<option>합의</option></select></td><td class='upDown'><button type='button'  class='btn btn-sm btn-outline-dark' onclick='moveUp(this)'>&#8743;</button><button type='button' class='btn-outline-dark btn btn-sm' onclick='moveDown(this)'>&#8744;</button></td></tr>"
            $($("#currentLine")).append(tempLine);
          }
          $(".apprLineCheck").each(function (index, el) {

            if ($(this).prop("checked")) {
              //중복제거를 위한 스크립트
              var inputValue = $(this).val();
              var removeTr = $("#currentLine input[value=" + inputValue + "]").parent().parent();
              if (removeTr != null) {
                removeTr.remove();
              }
              //중복제거를 위한 스크립트 끝
              var tempLine = "<tr><td class='text-left pl-5'>" + $(this).parent().html()
                + "</td><td>" + $(this).parent().parent().parent().parent().children("span").text()
                + "</td><td><select class='selectBoxCustom'><option>결재</option>"
                + "<option>합의</option></select></td><td class='upDown'><button type='button' class='btn-outline-dark btn btn-sm' onclick='moveUp(this)'>&#8743;</button><button type='button' class='btn-outline-dark btn btn-sm' onclick='moveDown(this)'>&#8744;</button></td></tr>"
              $($("#currentLine")).append(tempLine);
            }
          })
          $("#countApprPpl").text($("#currentLine tr").length);
        })

        // 삭제버튼 클릭시 오른쪽 적용대상이 삭제 됨
        $("#deleteAppr").click(function () {
          $("#currentLine tr").each(function (index, el) {
            if ($(this).children().eq(0).children().prop("checked")) {
              $(this).remove();
            }
          })
          $("#countApprPpl").text($("#currentLine tr").length);
        })


        // 체크 했을때 배경색 변경 및 체크박스 표시 
        $(function () {
          $("#currentLine").on("click", "tr:not(.upDown)", function () {
            if ($(this).find(":checkbox").prop("checked")) {
              $(this).css("backgroundColor", "");
              $(this).children().eq(0).children().attr("checked", false);
            } else {
              $(this).css("backgroundColor", "lightblue");
              $(this).children().eq(0).children().attr("checked", true);
            }
          })

          $(".nested").on("click", "label", function () {
            if ($(this).find(":checkbox").prop("checked")) {
              $(this).parent().css("backgroundColor", "lightblue");
            } else {
              $(this).parent().css("backgroundColor", "");
            }
          })

          $("#ceoCheck").on("click", function () {
            if ($(this).find(":checkbox").prop("checked")) {
              $(this).css("backgroundColor", "lightblue");
            } else {
              $(this).css("backgroundColor", "");
            }
          })
        })
        // 체크 했을때 배경색 변경 및 체크박스 표시 끝


        // 모달 내 결재선 위아래 이동 시 실행
        function moveUp(el) {
          var $tr = $(el).parent().parent();
          $tr.prev().before($tr);
        }

        function moveDown(el) {
          var $tr = $(el).parent().parent();
          $tr.next().after($tr);
        }
      // 모달 내 결재선 위아래 이동 시 실행 끝



      // 결재선 설정후 등록 클릭시 지정한 결재선 표기 
      $(function(){
          
          $("#enrollApprLineBtn").click(function(){
            var confirmedLine=[];
            $("#currentLine").children().each(function (index, el) {
              var tempLine=[];
              tempLine.push($(this).children().eq(0).text());  // 0 이름 및 직급
              tempLine.push($(this).children().eq(0).children().val()); //1 사번
              tempLine.push($(this).children().eq(1).text()); //2 부서
              tempLine.push($(this).children().eq(2).children().val()); // 3 합의결재
              confirmedLine.push(tempLine);
          })

            for( var i =0 ; i< confirmedLine.length;i++){
              var addLine= '<div class="mb-2 p-2 shadow-sm">'
                    +'<div class="d-flex">'
                          +'<div class="p-2 text-primary"><b>'+confirmedLine[i][0]+'</b></div>'
                    +'</div>'
                    +'<div class="d-flex flex-row mb-3">'
                          +'<div class="pl-2" style="width:75%">'+confirmedLine[i][2]+'</div>'
                          +'<div><span class="btn-sm btn-secondary">'+confirmedLine[i][3]+'</span></div>'
                    +'</div>'
                    +'<input type="hidden" name="Approval.apAccept['+i+'].memNo" value="'+confirmedLine[i][1]+'">'
                    +'<input type="hidden" name="Approval.apAccept['+i+'].type" value="'+confirmedLine[i][3]+'">'
              +'</div>'
              $("#selectedLine").append(addLine);
          }
        
          alert("결재선이 등록되었습니다");
          $("#claseApprLineModal").click();
        

        })
      })
      // 결재선 설정후 등록 클릭시 지정한 결재선 표기 끝
      </script>



    </body>

    </html>