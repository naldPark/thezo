<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- The Modal -->
	<div class="modal" id="detailSc">
		<div class="modal-dialog">
			<div class="modal-content">
		
			    <!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">일정 내용</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<table align="center">
						<tr>
						    <th width="120px">일정 제목</th>
						    <td colspan="2">
						    	일정제목불러오기
						    	카테고리불러오기
						    </td>
						</tr>
						<tr>
						    <th>일정 시간</th>
						    <td width="350px">
						    	2021-07-01 ~ 2021-07-02
						    </td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>부장 이선영</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="2">
								내용은 이렇습니다
							</td>
						</tr>
					</table>
				</div>
				
				
				<hr>
				<div id="btn-area" align="right">
					<button type="button" class="btn" id="hideRep">업무 보고 접기 <i class='fas fa-angle-double-up' style='font-size:15px'></i></button>
					<button type="button" class="btn" id="showRep" hidden>업무 보고 보기 <i class='fas fa-angle-double-down' style='font-size:15px'></i></button>
				</div>
				<script>
			    	$(function(){
			    		$("#hideRep").click(function(){
			    			$("#bizRepInfo").hide();
			    			$("#hideRep").prop("hidden", true);
			    			$("#showRep").removeAttr("hidden");
			    		})
			    		$("#showRep").click(function(){
			    			$("#bizRepInfo").show();
			    			$("#showRep").prop("hidden", true);
			    			$("#hideRep").removeAttr("hidden");
			    		})
			    	})
			    </script>
				
				<!-- 보고서 영역 -->
				<div id="bizRepInfo">
					<!-- 보고서가 없다면 -->
					<div align="center">
						작성된 보고서가 없습니다.
						<button type="button" class="btn btn-primary">등록하러 가기</button>
					</div>
					
					<div class="modal-header">
						<h4 class="modal-title">업무 보고</h4>
				    </div>
				    
				    <!-- Modal body -->
					<div class="modal-body">
					    <table>
						    <tr>
							    <th width="120px">제목</th>
							    <td colspan="2">
							    	일정제목불러오기
							    	카테고리불러오기
							    </td>
							</tr>
							<tr>
							    <th>보고서 작성자</th>
							    <td width="350px" colspan="2">
							    	사원 김개똥
							    </td>
							</tr>
							<tr>
								<th rowspan="">내용</th>
								<td rowspan="" colspan="2">호엥</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="2">
									첨부파일.....
								</td>
							</tr>
						</table>
					</div>
				    
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer center">
					<div class="button-area">
						<button class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button class="btn btn-primary" type="submit">저장</button>
					</div>
				</div>
					
			</div>
		</div>
	</div>
</body>
</html>