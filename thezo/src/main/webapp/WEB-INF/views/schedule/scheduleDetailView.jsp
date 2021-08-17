<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 - 일정상세정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	#hideRep, #showRep{color: grey;}
	pre{font-family:'Noto Sans KR', sans-serif; font-size:15px;}
	.scColorBox{width:15px; height: 15px; border-radius:5px; display: inline-block;}
	.report-area{width: 80%; margin:0 auto; text-align: center; border: 1px solid black; padding: 30px;}
	.detail-area{width: 80%; margin:0 auto; text-align: center; border: 1px solid black; padding: 30px;}
	table th{height:50px;}
</style>
</head>
<body>
	<br>
	<div class="schedueDetail" style="font-family:'Noto Sans KR', sans-serif;">
		<input type="hidden" id="scWriter" value="${ loginUser.memNo }"> <!-- 현재 로그인한 유저 전달 -->
		<input type="hidden" id="scNo" value="${ sc.scNo }">
		<div class="detail-area w3-panel w3-border w3-round">
			<div class="modal-header">
				<h4>&nbsp;&nbsp;일정 정보</h4>
			</div>
			<br>
			<table id="scInfo" align="center" class="text-left">
				<tr>
					<th width='120px'>일정 제목</th> 
					<td width='300px'>${ sc.title }</td> 
					<td><b>${ sc.scType } 일정</b>
						<c:choose>
							<c:when test="${ sc.scType eq '개인' }">
								<div class="scColorBox" style="background-color: #148CFF; margin-left:5px;"></div>
							</c:when>
							<c:when test="${ sc.scType eq '부서' }">
								<div class="scColorBox" style="background-color: #7B68EE;"></div>
							</c:when>
							<c:otherwise>
								<div class="scColorBox" style="background-color: #378006;"></div>
							</c:otherwise>
						</c:choose>
					</td>
				</tr> 
				<tr> 
					<th>일정 시간</th>
					<c:choose>
					<c:when test="${ sc.start eq sc.end }"> <!-- 일정이 1일 하루종일이면 -->
						<td colspan="2">${ sc.start }</td> 
					</c:when>
					<c:otherwise>
						<td colspan="2">${ sc.start } ~ ${ sc.end }</td>
					</c:otherwise>
					</c:choose> 
				</tr> 
				<tr> 
					<th>작성자</th> 
					<td colspan="2">${ sc.scWriter }</td> 
				</tr> 
				<tr> 
					<th>내용</th> 
					<td colspan="2"><pre>${ sc.scContent }</pre></td> 
				</tr> 
			</table>
			
			<script>
				// 일정 시간에서 'T'없애주기
				$(function(){
					var start = ${ sc.start };
					var end = ${ sc.end };
					//start.replace("T", " ");
					console.log(start + ", " + end);
				})
			</script>
		</div>
		<br>
		<div id="btn-area" align="right">
			<button type="button" class="btn" id="hideRep" hidden>
				업무 보고 접기 <i class='fas fa-angle-double-up' style='font-size: 15px'></i>
			</button>
			<button type="button" class="btn" id="showRep">
				업무 보고 보기 <i class='fas fa-angle-double-down' style='font-size: 15px'></i>
			</button>
		</div>
		<br>
		<script>
	    	$(function(){
	    		$("#hideRep").click(function(){
	    			$(".report-area").hide();
	    			$("#hideRep").prop("hidden", true);
	    			$("#showRep").removeAttr("hidden");
	    		})
	    		$("#showRep").click(function(){
	    			$(".report-area").show();
	    			$("#showRep").prop("hidden", true);
	    			$("#hideRep").removeAttr("hidden");
	    		})
	    	})
	    </script>
	
		<!-- 보고서 영역 -->
		<div class="report-area w3-panel w3-border w3-round" style="display:none;">
			
			<div class="modal-header">
				<h4 class="modal-title">업무 보고</h4>
			</div>
			
			
			<c:choose>
				<c:when test="${ empty sc.reportTitle }"> <!-- 보고서가 없다면 -->
					<div class="modal-body">
						<table id="repInfo">
							<div align="center">
								작성된 보고서가 없습니다. <br>
								<br>
								<button type="button" id="repInsert" class="btn btn-primary">등록하기</button>
							</div>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div class="modal-body">
						<table id="repInfo" align="center" class="text-left">
					 		<tr> 
								<th width='120px'>제목</th> 
								<td width='300px'>${ sc.reportTitle }</td> 
	   					    </tr> 
	   					    <tr> 
	 					 	  	<th>보고서 작성자</th> 
	 					 	  	<td>${ sc.reportWriter }</td> 
	   					    <tr> 
	   					 	   	<th>등록일</th> 
	   					 	  	<td>${ sc.createDate }</td> 
	   					    </tr> 
	   					    <tr> 
					 	 	 	<th>내용</th> 
	   					 	  	<td>
	   					 	  		<pre>${ sc.reportContent }</pre>
	   					 	  	</td> 
	   					    </tr> 
	   					    <tr> 
	   					 	  	<th>첨부파일</th> 
	   					 	  	<c:choose>
	   					 	  		<c:when test="${ empty sc.originName }">
	   					 	  			<td>첨부파일이 없습니다.</td>
	   					 	  		</c:when>
	   					 	  		<c:otherwise>
	   					 	  			<td><a href="${ sc.changeName }" download="${ sc.originName }">${ sc.originName }</a></td> 
	   					 	  		</c:otherwise>
	   					 	  	</c:choose>
	   					    </tr> 
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<br>
	
		<!-- Modal footer -->
		<div class="modal-footer center">
			<div class="button-area">
				<button class="btn btn-secondary" onclick="window.close();">취소</button>
				<c:if test="${ loginUser.memNo eq sc.memNo }">
					<button class="btn btn-primary" type="button" id="updateSc">수정</button>
					<button class="btn btn-danger" type="button" id="deleteModal" data-toggle="modal" data-target="#deleteSc">삭제</button>
				</c:if>
			</div>
			
			<!-- The Modal -->
			<div class="modal" id="deleteSc">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">일정 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        	일정을 삭제하시겠습니까? <br>
			        	<b>* 관련 보고 내용도 함께 삭제됩니다.</b>
			      </div>
				
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-danger" id="deleteScBtn">삭제</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			      </div>
			
			    </div>
			  </div>
			</div>
			<script>
				$(function(){
					$("#updateSc").click(function(){
						var option = "width = 750, height = 800, top = 100, left = 200, location = no";
						window.open("updateForm.sc?scNo=" + $("#scNo").val(), "일정수정", option);
						self.close();
					})
					
					$("#deleteScBtn").click(function(){
						location.href = "delete.sc?scNo=" + $("#scNo").val()
					})
					
					$("#repInsert").click(function(){
						var option = "width = 700, height = 530, top = 100, left = 200, location = no";
						window.open("insertForm.bizRep?scNo=" + $("#scNo").val(), "업무 보고하기", option);
						self.close();
					})
				})
			</script>
		</div>
	</div>
</body>
</html>