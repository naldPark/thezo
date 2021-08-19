<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table * {
   margin: 5px;
}

table {
   width: 100%;
}

#replyArea {
   width: 95%;
}

.innerOuter {
   width: 1000px;
   margin: auto;
   padding: 5% 5%;
   background: white;
}
</style>
</head>
<body>

   <jsp:include page="../common/header.jsp" />
   
   <c:if test="${loginUser.memId eq 'admin' }">
      <script>   
         document.getElementById("admin-header").style.display = "block";
         document.getElementById("admin-mode").style.color = "red";
      </script>
      <br><br><br><br>
   </c:if>
   
   <section>
   <div class="outer">
         <div class="innerOuter">
            <h2><b>사내게시판</b></h2>
            <br>
            <div align="right">
               <a href="" data-toggle="modal" data-target="#boardReportForm" style="text-decoration:none;">신고</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <!--게시글 작성자만 보이도록-->
               <c:if test="${ loginUser.memId eq b.boardWriter}">
                     <a style="float:right; cursor: pointer; color: #0091FF;" onclick="postFormSubmit(2);">삭제</a>
                  </c:if>
            </div>
            <br>
            <table id="contentArea" align="center" class="table">
               <tr>
                  <th style="font-size: 20px;">${ b.boardTitle }</th>
               </tr>
               <tr align="left" style="font-size: 13px;">
                  <td>
                     작성자&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.boardWriter }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     작성일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.boardDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     조회수&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.count }</td>
               </tr>
               <tr>
                  <td>
                     <div style="min-height: 400px; font-size: 17px;">
                        ${ b.boardContent }
                     </div>
                  </td>
               </tr>
               <tr>
                  <c:choose>
                          <c:when test="${ empty bf.originName }">
                             <td>
                                첨부파일이 없습니다.
                             </td>
                          </c:when>
                          <c:otherwise>
                             <td>
                                첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<a href="${ bf.changeName }" download="${ bf.originName }">${ bf.originName }</a>
                             </td>
                          </c:otherwise>   
                       </c:choose>   
               </tr>
            </table>
   
            <hr>
            <br>
   
            <table id="replyArea" class="table-borderless" align="center">
               <thead>
                  <tr>
                     <td colspan="6">댓글 (<span id="rcount"></span>)
                     </td>
                  </tr>
               </thead>
               <tbody>
               </tbody>
               <tfoot>
                  <tr>
                     <th colspan="4"><textarea class="form-control" id="content" cols="55" rows="2" style="resize: none; width: 100%"></textarea></th>
                     <th colspan="2" style="vertical-align: middle">
                        &nbsp;&nbsp;<button class="btn btn-secondary" onclick="addReply();">등록하기</button>
                     </th>
                  </tr>
               </tfoot>
            </table>
            <br><br><br>
            
            <script>
                 $(function(){
                    selectReplyList();
                 })
                 
                 // 댓글 작성
                 function addReply(){
              
                    if($("#content").val().trim().length != 0){ // 유효한 댓글 작성시 => insert요청 // trim: 공백제거
                       
                       $.ajax({
                        url:"rinsert.bo",
                        data:{
                           refNo:${b.boardNo},
                           memNo:${loginUser.memNo},
                           replyContent:$("#content").val(),
                           replyWriter:'${loginUser.memId}'
                        }, success:function(status){
                           
                           if(status == "success"){
                              selectReplyList();
                              $("#content").val("");
                           }
                           
                        }, error:function(){
                           console.log("댓글 작성용 ajax통신 실패");
                        }
                       })          
                       
                       
                    }else{
                       alertify.alert("댓글 작성후 등록 요청해주세요!");
                    }
                    
                 }
                 
                 // 댓글 조회
                 function selectReplyList(){
                    $.ajax({
                       url:"rlist.bo",
                       data:{bno:${ b.boardNo }},
                       success:function(list){
                          console.log(list);
                          
                          $("#rcount").text(list.length);
                          
                          //<a href='' data-toggle='modal' data-target='#bReplyReportForm' style='text-decoration:none;'>신고</a>
                          var value = "";
                          for(var i in list){
                             value += "<tr>"
                                          + "<th>" + list[i].replyWriter +"</th>"
                                          + "<td style='width: 400px;'>" + list[i].replyContent + "</td>"
                                          + "<td>" + list[i].createDate + "</td>"
                                          + "<td><input type='hidden' name='replyNo' class='replyNo' value='" + list[i].replyNo 
                                          + "'> <a href='' class='reportboardReply' data-toggle='modal' data-target='#bReplyReportForm'><img src='resources/images/warning.png' width='20' height='20'></a></td>";
                                          
                                          if(${loginUser.memNo} == list[i].memNo) {
                                        	  value += "<td><a href='deleteReply.bo?replyNo=" + list[i].replyNo + "&bno=" + ${ b.boardNo } + "' style='text-decoration:none;color:#ff5252;'>삭제</a></td>";
                                          }
                                       + "</tr>";
                          }
                          
                          $("#replyArea tbody").html(value);
                          
                       },error:function(){
                          console.log("댓글 리스트 조회용 ajax 통신 실패");
                       }
                    })
                    
                 }

	             $(document).on("click", ".reportboardReply", function(){
	                
	                  $("#rpNo1").val($(this).prev().val());
	                  $("#rpNo2").val($(this).prev().val());
	                       
	              })
              </script>
         
            <div align="center">
               <a class="btn btn-secondary" href="boardList.bo">목록</a> 
               <c:if test="${ loginUser.memId eq b.boardWriter}">
                       <a class="btn btn-secondary" onclick="postFormSubmit(1);">수정</a>
                    </c:if>
            </div>
            <br><br>
            
            <form id="postForm" action="" method="post">
                  <input type="hidden" name="bno" value="${ b.boardNo }">
                  <input type="hidden" name="filePath" value="${ bf.changeName }">
                  <input type="hidden" name="refBno" value="${ b.boardNo }">
               </form>
               
               <script>
                  function postFormSubmit(num){
                     if(num == 1){ // 수정하기 클릭시
                        $("#postForm").attr("action", "boardUpdateForm.bo").submit();
                     }else{ // 삭제하기 클릭시
                        $("#postForm").attr("action", "boardDelete.bo").submit();
                     }
                  }
               </script>
    
   
   
            <!-- 신고하기 버튼 클릭시 보여질 Modal -->
            <!-- 게시글 신고 -->
            <div class="modal" id="boardReportForm">
               <div class="modal-dialog">
                  <div class="modal-content">
   
                     <!-- Modal Header -->
                     <div class="modal-header">
                        <h4 class="modal-title">게시글 신고하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
   
                     <!-- Modal body -->
                     <div class="modal-body" align="center">
                        <form action="memBoardReport.bo" method="post">
                           <!-- 신고할 내용 입력 -->
                           <input type="hidden" name="rpId" value="${ loginUser.memId }"> 
                           <input type="hidden" name="rpNo" id="rpNo1" value="${ b.boardNo }">
                           <input type="hidden" name="boardType" value="1">
                           <input type="hidden" name="rpType" value="1"> 
                           <b>신고구분</b><br><br>
                           <select id="rpSection1" name="rpSection"  class="form-control" style="width:130px;">
                              <option value="욕설/비방">욕설/비방</option>
                              <option value="음란/유해">음란/유해</option>
                              <option value="도배/스팸">도배/스팸</option>
                           </select> <br>
                           <br> <b>신고 내용 입력</b><br>
                           <br>
                           <textarea name="rpContent" id="rpContent1" cols="50" row="1"
                              style="resize: none" class="form-control"></textarea>
                           <br>
                           <br>
                           <button type="submit" class="btn btn-danger btb-sm">신고하기</button>
   
                        </form>
                     </div>
   
                  </div>
               </div>
            </div>
            
            <!-- 신고하기 모달창 끝 -->


            <!-- 신고하기 버튼 클릭시 보여질 Modal -->
            <!-- 댓글 신고 -->
            <div class="modal" id="bReplyReportForm">
               <div class="modal-dialog">
                  <div class="modal-content">
   
                     <!-- Modal Header -->
                     <div class="modal-header">
                        <h4 class="modal-title">댓글 신고하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
   
                     <!-- Modal body -->
                     <div class="modal-body" align="center">
                        <form action="boardReplyReport.bo" method="post">
                           <!-- 신고할 내용 입력 -->
                           <input type="hidden" name="rpId" value="${ loginUser.memId }"> 
                           <input type="hidden" name="rpNo" id="rpNo2" value=""> 
                           <input type="hidden" name="boardType" value="1">
                           <input type="hidden" name="rpType" value="2"> 
                           <b>신고구분</b><br><br>
                           <select id="rpSection2" name="rpSection"  class="form-control" style="width:130px;">
                              <option value="욕설/비방">욕설/비방</option>
                              <option value="음란/유해">음란/유해</option>
                              <option value="도배/스팸">도배/스팸</option>
                           </select> <br>
                           <br> <b>신고 내용 입력</b><br>
                           <br>
                           <textarea name="rpContent" id="rpContent2" cols="50" row="1"
                              style="resize: none" class="form-control"></textarea>
                           <br>
                           <br>
                           <button type="submit" class="btn btn-danger btb-sm">신고하기</button>
   
                        </form>
                     </div>
   
                  </div>
               </div>
            </div>
            
         
            
            
         </div>
      </div>
         
   </section>
</body>
</html>
   
	