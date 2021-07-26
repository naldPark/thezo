<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

<style>
     .drop-zone{margin-left:80px; width: 100%; height: 110px; border: 1px solid lightgray; overflow: auto;
    }
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
    label{margin-bottom: 0rem !important;}

/* *{border:1px solid red} */

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
          <p class="pageTitle">  leaveForm <b> 휴가신청서</b></p>
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter row ">
              <div class="card border-0" style=" width:80%">
                <div class="card-body">
                  <form action="insertDocu.appr" method="post" enctype="Multipart/form-data" id="form">
                    <h3 style="margin-bottom: 25px;">휴가신청서</h3>
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
  
                    <div class="input-group mb-3" style="width:30%">
                      
                      <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: white; border:0px;">휴가분류</span>
                      </div>
                      <select class="form-control" id="sel1">
                        <option>연차</option>
                        <option>경조사</option>
                      </select>
                    </div>
                    
                   
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: white; border:0px;">시작일자</span>
                      </div>
                      <input type="date" class="form-control" style="border:1px solid lightgray;">
                      <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: white; border:0px;">종료일자</span>
                      </div>
                      <input type="date" class="form-control" style="border:1px solid lightgray;">
                      <div class="input-group-prepend">
                        <span class="input-group-text" style="margin-left:5px; width:130px; background-color: rgba(241, 196, 15, 0.274);">차감연차: 0개</span>
                      </div>
                    </div>
                    <br>
                    <textarea class="form-control" maxlength="70" rows="5" autocomplete="off" placeholder="휴가 사유를 입력해주세요"></textarea>
                    <br>
                    <input type="file" class="form-control-file border"><br>
                    <div class="row justify-content-center">
                      <button type="button" id="submitBtn" class="btn btn-primary">기안하기</button>&nbsp;
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
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
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
                              <li>
                                  <span class="box">경영관리본부</span>
                                  <ul class="nested">
                                    <li>
                                        <span class="box">인사팀</span>
                                        <ul class="nested">
                                            <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                            <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                            <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                            <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">총무팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">회계팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                      </ul>
                                    </li>
                                </ul>
                              </li>
                              <li>
                                <li>
                                  <span class="box">개발본부</span>
                                  <ul class="nested">
                                    <li>
                                        <span class="box">개발1팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">개발2팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">인프라팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                </ul>
                              </li>
                              <li>
                                <li>
                                  <span class="box">운영본부</span>
                                  <ul class="nested">
                                    <li>
                                        <span class="box">운영팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">영업팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="box">구매팀</span>
                                        <ul class="nested">
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                          <li><label><input type="checkbox"/> 김말똥 과장</label></li>
                                        </ul>
                                    </li>
                                </ul>
                              </li>
                              <li>
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
                    <select class="selectBoxCustom">
                      <option>결재</option>
                      <option>합의</option>
                    </select>
                  </th>
              </tr>
              <tr>
                  <th>2</th>
                  <td>인사팀</td>
                  <th>이선영 과장</th>
                  <th>
                    <select class="selectBoxCustom">
                      <option>결재</option>
                      <option>합의</option>
                    </select>
                  </th>
              </tr>
              <tr>
                  <th>3</th>
                  <td>경영지원본부 본부장</td>
                  <th>신재원 상무</th>
                  <th>
                    <select class="selectBoxCustom">
                      <option>결재</option>
                      <option>합의</option>
                    </select>
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