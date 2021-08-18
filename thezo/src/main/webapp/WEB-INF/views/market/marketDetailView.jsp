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
                <a class="btn heart" id="like1">
					<img id="heart" name="heart" class="like" src="resources/images/like1.png" style="width:20px;height:20px;">
				</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    
			<script>
			var like = '<img id="heart" name="heart" class="like" src="resources/images/like2.png" style="width:20px;height:20px;">';
			var unlike = '<img id="heart" name="heart" class="like" src="resources/images/like1.png" style="width:20px;height:20px;">';
			
			var likeClass=$("#like1");
			console.log(likeClass);
			
			$(function(){
				$(function(){
			   if("${like}"!=0){
				likeClass.html(like);
			   }else{
				likeClass.html(unlike);
			   }
			})
			})
			
			
							$(".heart").click(function(){ 
								var marketNo = "${mk.marketNo}";
								var currentStatus="";
								//안조아하고있으면
								if(likeClass.html()==unlike){
									currentStatus = "insert";
								}else{ //조아하고있으면 해제
									currentStatus = "delete";
								}
								$.ajax({
									url:"productLike.mk",
									data:{
										marketNo:marketNo,
										currentStatus: currentStatus					
									},
									type:"post",
									success:function(result){			
										if(result>1){
											likeClass.html(unlike);
											alert("찜하기 해제 되었습니다");
										}else{
											likeClass.html(like);
											alert("찜하기 추가되었습니다");
										}
									},error:function(){
										console.log("ajax통신 실패");
									}
								});
								});
			
			</script>

			    <!-- <script>
			    	$(document).ready(function(){
			    		
			    		var heartval = ${ mk.productLike };
			    	console.log("sdadasdas");
			    		if(heartval>0){
			    			console.log(heartval);
				            $("#heart").prop("src", "resources/images/like2.png");
				            $(".heart").prop('name', heartval)
			    		}else{
			    			console.log(heartval);
				            $("#heart").prop("src", "resources/images/like1.png");
				            $(".heart").prop('name', heartval)
			    		}
			    	
			    		$(".heart").on("click", function(){
							var status= $(this).attr('id');
							var tempSrc2="/resources/images/like2.png"; //2가 좋아요임!!
							var tempSrc1="/resources/images/like1.png";		
							var changeValue ="";					
							if( status =='like1'){
								changeValue =tempSrc2;
							}else{
								changeValue =tempSrc1;
								$(this).prop('id', 'like2');
							}
			    			var that = $(".heart");
			    			
			    			$.ajax({
			    				url:'productLike.mk',
			    				data: {
			    					marketNo:${mk.marketNo},
			    					heart:heartval,
									memId:'${loginUser.memId}'
			    				},sucess : function(result){
			    					that.prop('name',result);
			    					if(result>1){
			    						$('#heart').prop("src", "/resources/images/like2.png");
			    					}else{
			    						$('#heart').prop("src", "/resources/images/like1.png");
			    					}
			    				},error:function(){
									console.log("찜하기 ajax통신 실패");
								}
			    				
			    			})
			    		})
			    		
			    	})
			    </script> -->
			    
			  
                <a href="" data-toggle="modal" data-target="#marketReportForm" style="text-decoration:none;">신고</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		                      작성자 : ${ mk.department }&nbsp;&nbsp;${ mk.memName }&nbsp;${ mk.rank }<br>
		                      작성일 : ${ mk.marketDate }
		            <p style="font-size: small;">
			        	<img src="resources/images/countView.png" width="20" height="20">&nbsp;&nbsp;${ mk.count }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <img src="resources/images/heart.png" width="20" height="20">&nbsp;&nbsp;${ like }<!-- 찜: 하트이미지 바꾸기-->
		            </p>
	            </div>
            	<hr width="700">
            </div>
            <div class="content" align="center" style="min-height: 200px; font-size: 17px;">
                ${ mk.marketContent }
            </div>
            
            <br><br><br><br>
            <!-- 메세지로 연결해야하는데...? 
            <div align="center">
            	<a class="btn btn-primary" href="">거래하기</a>
            </div>
          	<br><br>
            -->
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
				                             + "<td>" + list[i].createDate + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"
				                             + "<td><input type='hidden' name='replyNo' class='replyNo' value='" + list[i].replyNo 
				                             + "'><a href='' class='reportMarketReply' data-toggle='modal' data-target='#mReplyReportForm'><img src='resources/images/warning.png' width='20' height='20'></a></td>"
				                             + "<c:if test='${ loginUser.memId eq mk.marketWriter}'>"
				                             + "<td><a href='deleteReply.mk?replyNo=" + list[i].replyNo + "&mkno=" + ${ mk.marketNo } + "' style='text-decoration:none;color:#ff5252;'>삭제</a></td>"
				                             + "</c:if>"
				                          + "</tr>";
		        			}
		        				
		        			$("#replyArea tbody").html(value);
		        				
		        		},error:function(){
		        			console.log("댓글 리스트 조회용 ajax 통신 실패");
		        		}
		        	})
		        }
		        $(document).on("click", ".reportMarketReply", function(){
	                
                    $("#rpNo1").val($(this).prev().val());
               		$("#rpNo2").val($(this).prev().val());
                    
                 })
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
			<!-- 게시글 신고 -->
			<div class="modal" id="marketReportForm">
				<div class="modal-dialog">
					<div class="modal-content">
	
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">게시글 신고하기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
	
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="memMarketReport.bo" method="post">
								<!-- 신고할 내용 입력 -->
								<input type="hidden" name="rpId" value="${ loginUser.memId }"> 
								<input type="hidden" name="rpNo" id="rpNo1" value="${ mk.marketNo}">
								<input type="hidden" name="boardType" value="2">
								<input type="hidden" name="rpType" value="1"> 
								<b>신고구분</b><br><br>
								<select id="rpSection1" name="rpSection"  class="form-control" style="width:130px;">
									<option value="욕설/비방">욕설/비방</option>
									<option value="음란/유해">음란/유해</option>
									<option value="도배/스팸">도배/스팸</option>
								</select> <br>
								<br> 
								<b>신고 내용 입력</b><br><br>
								<textarea name="rpContent" id="rpContent1" cols="50" row="1"
									style="resize: none" class="form-control"></textarea>
								<br><br>
								<button type="submit" class="btn btn-danger btb-sm">신고하기</button>
	
							</form>
						</div>
	
					</div>
				</div>
			</div>
				
			<!-- 신고하기 모달창 끝 -->
			
			<!-- 신고하기 버튼 클릭시 보여질 Modal -->
			<!-- 댓글 신고 -->
			<div class="modal" id="mReplyReportForm">
				<div class="modal-dialog">
					<div class="modal-content">
						
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">댓글 신고하기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
	
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="marketReplyReport.bo" method="post">
								<!-- 신고할 내용 입력 -->
								<input type="hidden" name="rpId" value="${ loginUser.memId }"> 
								<input type="hidden" name="rpNo" id="rpNo2" value="${ mk.marketNo}">
								<input type="hidden" name="boardType" value="2">
								<input type="hidden" name="rpType" value="2"> 
								<b>신고구분</b><br><br>
								<select id="rpSection2" name="rpSection"  class="form-control" style="width:130px;">
									<option value="욕설/비방">욕설/비방</option>
									<option value="음란/유해">음란/유해</option>
									<option value="도배/스팸">도배/스팸</option>
								</select> <br><br>
								<b>신고 내용 입력</b><br><br>
								<textarea name="rpContent" id="rpContent2" cols="50" row="1" style="resize: none" class="form-control"></textarea>
								<br><br>
								<button type="submit" class="btn btn-danger btb-sm">신고하기</button>
	
							</form>
						</div>
	
					</div>
				</div>
			</div>
				
			<!-- 신고하기 모달창 끝 -->				
			
			
			

        </div>


    </div>
  	</section>
	
	
</body>
</html>