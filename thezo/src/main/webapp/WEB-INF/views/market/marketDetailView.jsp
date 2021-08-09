<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .innerOuter{
      width: 1000px;
      margin:auto;
      padding:5% 5%;
      background:white;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
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
            <h2><b>더조마켓</b></h2>
            <div align="center">
                <a href="">찜하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="" data-toggle="modal" data-target="#reportForm">신고</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <!--게시글 작성자만 보이도록-->
				<c:if test="${ loginUser.memId eq mk.marketWriter}">
		            <a style="cursor: pointer; color: red;" onclick="postFormSubmit(2);">삭제</a>
		        </c:if>
            </div>
            <br>
            <div id="thumbnail"align="center">
                <p style="color:  #0091FF; font-size:17px;"><b>${ mk.marketSection }</b></p><br>
                <img src="${ mk.productImg }" width="200" height="200"><br>
                <p style="font-size:20px;"><b>${ mk.marketTitle }</b></p><br>
                <p style="color: rebeccapurple;">${ mk.price }원</p>
              
	            <div>
		                      작성자 : ${ mk.marketWriter }<br>
		                      작성일 : ${ mk.marketDate }
		            <p style="font-size: small;">
			        	<img src="resources/images/countView.png" width="20" height="20">&nbsp;&nbsp;${ mk.count }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <img src="resources/images/heart.png" width="20" height="20">&nbsp;&nbsp;${ mk.productLike}<!-- 찜: 하트이미지 바꾸기-->
		            </p>
	            </div>
            	<hr width="700">
            </div>
            <div class="content" align="center" style="min-height: 400px; font-size: 17px;">
                ${ mk.marketContent }
            </div>
            
            <br><br><br><br>
            <!-- 메세지로 연결해야하는데...? -->
            <div align="center">
            	<a class="btn btn-primary" href="">거래하기</a>
            </div>
          	<br><br>
           
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
							url:"marketReplyinsert.bo",
							data:{
								refNo:${mk.marketNo},
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
		        		url:"mkRlist.bo",
		        		data:{bno:${ mk.marketNo }},
		        		success:function(list){
		        			console.log(list);
		        				
		        			$("#rcount").text(list.length);
		        				
		        			var value = "";
		        			for(var i in list){
		        				value += "<tr>"
				                             + "<th>" + list[i].replyWriter + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>"
				                             + "<td colspan='2' style='width: 400px;'>" + list[i].replyContent + "</td>"
				                             + "<td>" + list[i].createDate + "</td>"
				                             + "<td>신고</td>"
				                             + "<td>삭제</td>"
				                          + "</tr>";
		        			}
		        				
		        			$("#replyArea tbody").html(value);
		        				
		        		},error:function(){
		        			console.log("댓글 리스트 조회용 ajax 통신 실패");
		        		}
		        	})
		        }
		      </script>
			
	
			


            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <a class="btn btn-secondary" href="marketList.bo">목록</a>
                <c:if test="${ loginUser.memId eq mk.marketWriter}">
                    <a class="btn btn-secondary" onclick="postFormSubmit(1);">수정</a>
                </c:if>
            </div>
        
			<form id="postForm" action="" method="post">
	            <input type="hidden" name="mkno" value="${ mk.marketNo }">
	            <input type="hidden" name="filePath" value="${ mk.productImg }">
	        </form>
            <br><br>
            
            <script>
	            function postFormSubmit(num){
	            	if(num == 1){ // 수정하기 클릭시
	            		$("#postForm").attr("action", "marketUpdateForm.bo").submit();
	            	}else{ // 삭제하기 클릭시
	            		$("#postForm").attr("action", "marketDelete.bo").submit();
	            	}
	            }
	        </script>
            

            <!-- 신고하기 버튼 클릭시 보여질 Modal -->
					<div class="modal" id="reportForm">
                        <div class="modal-dialog">
                          <div class="modal-content">
                      
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">게시글 신고하기</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                      
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                                  <form action="" method="post">
                                   <!-- 신고할 내용 입력 -->
                                       <input type="hidden" name="userId" value="">
                                       <input type="hidden" name="boardType" value="">  <!-- 컬럼명확인 -->
                                       <input type="hidden" name="boardNo" value="">
                                       
                                       <b>신고 구분</b><br>
                                       <select id="rpSection" name="rpSection">
                                           <option value="욕설">욕설/비방</option>
                                           <option value="음란">음란/유해</option>
                                           <option value="도배">도배/스팸</option>
                                       </select>
                                       <br><br>
                                       <b>신고 내용 입력</b><br><br>
                                       <textarea name="rpContent" id="rpContent" cols="50" row="1" style="resize:none"></textarea><br><br>
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