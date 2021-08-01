<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#hideRep, #showRep{color: grey;}

</style>
</head>
<body>
	<!-- The Modal -->
	<div class="modal" id="detailSc">
		<div class="modal-dialog">
			<div class="modal-content">
		
			    <!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">일정 정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<table align="center" id="scInfo">
					</table>
				</div>
				
				<br>
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
					<div class="modal-header">
						<h4 class="modal-title">업무 보고</h4>
				    </div>
				    
				    <!-- Modal body -->
					<div class="modal-body">
					    <table id="repInfo" align="center">
						    <div align="center" id="repInsertBtn" hidden>
								작성된 보고서가 없습니다.
								<br><br>
								<button type="button" class="btn btn-primary">등록하기</button>
							</div>
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