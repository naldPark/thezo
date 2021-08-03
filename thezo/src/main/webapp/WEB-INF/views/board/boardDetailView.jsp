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
	
	<c:if test="${loginUser.userId eq 'admin' }">
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
					<a href="" data-toggle="modal" data-target="#reportForm">신고</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
							<p style="height: 400px; font-size: 17px;">
								${ b.boardContent }
							</p>
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
							<td colspan="3">댓글 (<span id="rcount">3</span>)
							</td>
						</tr>
						<tr>
							<th>user02</th>
							<td>좋은 내용 댓글~~~</td>
							<td>2020-08-01</td>
						</tr>
						<tr>
							<th>user01</th>
							<td>비방용 댓글~~</td>
							<td>2020-08-02</td>
						</tr>
						<tr>
							<th>user04</th>
							<td>ㅋㅋㅋ</td>
							<td>2020-08-03</td>
						</tr>
					</thead>
	
					<tbody>
						<tr>
							<th colspan="2"><textarea class="form-control" name=""
									id="content" cols="55" rows="2"
									style="resize: none; width: 100%"></textarea></th>
							<th style="vertical-align: middle">&nbsp;&nbsp;
								<button class="btn btn-secondary">등록하기</button>
							</th>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<br>
	
	
				<div align="center">
					<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
					<a class="btn btn-secondary" href="">목록</a> 
					<c:if test="${ loginUser.memId eq b.boardWriter}">
                    	<a class="btn btn-secondary" onclick="postFormSubmit(1);">수정</a>
                    </c:if>
				</div>
				<br><br>
				
				<form id="postForm" action="" method="post">
	            	<input type="hidden" name="bno" value="${ b.boardNo }">
	            	<input type="hidden" name="filePath" value="${ bf.changeName }">
	            </form>
	            
	            <script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // 수정하기 클릭시
	            			$("#postForm").attr("action", "boardUpdate.bo").submit();
	            		}else{ // 삭제하기 클릭시
	            			$("#postForm").attr("action", "boardDelete.bo").submit();
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
									<input type="hidden" name="userId" value=""> <input
										type="hidden" name="boardType" value="">
									<!-- 컬럼명확인 -->
									<input type="hidden" name="boardNo" value=""> <b>신고
										구분</b><br> <select id="rpSection" name="rpSection">
										<option value="욕설">욕설/비방</option>
										<option value="음란">음란/유해</option>
										<option value="도배">도배/스팸</option>
									</select> <br>
									<br> <b>신고 내용 입력</b><br>
									<br>
									<textarea name="rpContent" id="rpContent" cols="50" row="1"
										style="resize: none"></textarea>
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