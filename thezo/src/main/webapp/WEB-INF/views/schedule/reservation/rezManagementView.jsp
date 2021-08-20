<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<style>
	.manage-area{width:80%; margin:0 auto; text-align: center; padding: 30px; margin-top:30px;}
	body{font-family:'Noto Sans KR', sans-serif;}
	.fas{color:gray;}
	.fas:hover{cursor:pointer; color: rgb(243,156,18);}
</style>
</head>
<body>
	<c:if test="${!empty alertMsg }">
		<script>	
			alert("${alertMsg}");
		</script>
        <!-- 뭔가가 담겨있는 경우 -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	<div class="manage-area w3-panel w3-border w3-round">
		<button type="button" class="close" onclick="window.close();">&times;</button>
		<div class=".col-sm-2" style="font-size:20px;" align="left">
			자원 관리 &nbsp;
			<button class="btn btn-success btn-sm" style="width:150px;" align="left" data-toggle="modal" data-target="#insertModal">+ 자원 추가하기</button>
		</div> 
		<br>
	
      	<table class="text-left">
      		<form action="update.reca" type="POST">
	      		<tr>
	      			<th width=100px; height=50px;>카테고리명</th>
	      			<td width=140px;>
	      				<select class="w3-border" name="categoryNo" style="width: 130px;">
	      					<option value="">선택안함</option>
	      					<c:forEach var="c" items="${ caList }">
	      						<option value="${ c.categoryNo }">${ c.categoryName }</option>
	      					</c:forEach>
	      				</select>
	      			</td>
	      			
	      			<td>
	      				<i style='font-size:18px' class='fas' onclick="update1();">&#xf304;</i>
	      				<i style='font-size:18px' class='fas' data-toggle="modal" data-target="#deleteModal1">&#xf2ed;</i>
	      			</td>
	      		</tr>
	      		
	      		<tr>
	      			<th></th>
	      			<td width=130px;>
	      				<input style="width:120px;" type="text" class="w3-border" id="changeName1" name="changeCaName" placeholder="변경할 이름입력" required hidden>
	      			</td>
	      			
	      			<td>
	      				<button type="submit" class="btn btn-primary btn-sm" id="changeBtn1" hidden>이름 변경</button>
	      			</td>
	      		</tr>
      		</form>
      		
      		<form action="update.re" type="POST">
	      		<tr>
	      			<th height=50px;>자원 이름</th>
	      			
	      			<td>
	      				<select class="w3-border text-center" name="resourceNo" style="width: 130px;">
	      					<option value="">선택안함</option>
	      				</select>
	      			</td>
	      			<td>
	      				<i style='font-size:18px' class='fas' onclick="update2();">&#xf304;</i>
	      				<i style='font-size:18px' class='fas' data-toggle="modal" data-target="#deleteModal2">&#xf2ed;</i>
	      			</td>
		      	</tr>
		      	<tr>
		      		<th></th>
		      		<td>
	      				<input style="width:120px;" type="text" class="w3-border" id="changeName2" name="changeReName" placeholder="변경할 이름입력" required hidden>
	      			</td>
	      				
	      			<td>
	      				<button type="submit" class="btn btn-primary btn-sm" id="changeBtn2" hidden>이름 변경</button>
	      			</td>	
		      	</tr>		
      		</form>
      		
      	</table>
      	<br>
      	
		<button type="button" class="btn btn-primary btn-sm" onclick="window.close();">확인</button>
	</div>
	
	<script>
		$(function(){
			$("select[name=categoryNo]").change(function(){
				// category를 선택할 때마다 그에 따른 resources가 나오도록
				var caNo = $(this).val();
				
				if(caNo != ""){
					// select값이 선택안함이 아니라면 카테고리에 맞는 자원 가져오기
					$.ajax({
						url: "select.re",
						data: {caNo: caNo},
						success: function(list){
							var reList = Object.values(JSON.parse(list));
							$("select[name=resourceNo]").empty();
							for(var i=0; i<reList.length; i++){
								var option = "<option value=" + reList[i].resourceNo + ">"
												+ reList[i].resourceName
											+ "</option>";
								$("select[name=resourceNo]").append(option);
							}
							
							
						}, error: function(){
							console.log("자원조회용 ajax 통신 실패");
						}
					});
				}else{
					$("select[name=resourceNo]").empty();
					$("select[name=resourceNo]").append("<option value=>선택안함</option>");
				}
			})
		})
		// 수정 input 나타나게 하기
		function update1(){
			$("#changeName1").removeAttr("hidden");
			$("#changeBtn1").removeAttr("hidden");
		}
		
		function update2(){
			$("#changeName2").removeAttr("hidden");
			$("#changeBtn2").removeAttr("hidden");
		}
		
		
		
		// 카테고리 삭제 기능
		function deleteBtn1(){
			var caNo = $("select[name=categoryNo] :selected").val();
			location.href = "delete.reca?caNo=" + caNo;
		}
		
		// 자원 삭제 기능
		function deleteBtn2(){
			var reNo = $("select[name=resourceNo] :selected").val();
			location.href = "delete.re?reNo=" + reNo;
		}
	</script>

	
	
	<%-- 자원추가 모달창 ------------------------------------------ --%>
	<!-- The Modal -->
	<div class="modal" id="insertModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">자원추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="text-left">
						<form action="insert.reca" type="POST">
							<tr>
								<th width=100px; height=50px;>카테고리</th>
								
									<td width=190px;>
										<input type="text" class="w3-border" style="width: 180px;" name="categoryName" placeholder="추가할 카테고리명 입력" required>
									</td>
	
									<td>
										<button type="submit" class="btn btn-success btn-sm" style="width: 120px;" id="changeBtn1">카테고리 추가</button>
									</td>
								
							</tr>
						</form>
						
						<form action="insert.re" type="POST" id="insertForm">
							<tr>
								<th height=50px;>자원</th>
								<td width=140px;>
									<select class="w3-border" name="categoryNo" style="width: 130px;">
										<c:forEach var="c" items="${ caList }">
											<option value="${ c.categoryNo }">${ c.categoryName }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<input type="text" class="w3-border" style="width: 180px;" name="resourceName" placeholder="추가할 자원명 입력" required>
								</td>
								<td>
									<button type="submit" class="btn btn-success btn-sm" style="width: 120px;" onclick="insertRe();">자원 추가</button>
								</td>
							</tr>
						</form>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	
	<%-- 카테고리 삭제 모달창 ------------------------------------------------- --%>
	<!-- The Modal -->
	<div class="modal" id="deleteModal1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">카테고리 삭제</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        	선택한 카테고리를 삭제하시겠습니까? <br>
	        	<b>*주의 : 카테고리 내의 자원과 예약내역이 모두 삭제 되며, 복구가 불가능합니다!</b>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" onclick="deleteBtn1();">삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>

	<%-- 자원 삭제 모달창 ------------------------------------------------- --%>
	<!-- The Modal -->
	<div class="modal" id="deleteModal2">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">자원 삭제</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        	선택한 자원을 삭제하시겠습니까? <br>
	        	<b>*주의 : 해당 자원과 관련된 예약내역도 삭제 되며, 복구가 불가능합니다!</b>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" onclick="deleteBtn2();">삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>





</body>
</html>