<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리 - 일정수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	#hideRep, #showRep{color: grey;}
	.scColorBox{width:15px; height: 15px; border-radius:5px; display: inline-block;}
	.report-area{width: 80%; margin:0 auto; text-align: center; border: 1px solid black; padding: 30px;}
	.detail-area{width: 80%; margin:0 auto; text-align: center; border: 1px solid black; padding: 30px;}
	table th{height:50px;}
</style>
</head>
<body>
	<form action="update.sc" method="post" style="font-family:'Noto Sans KR', sans-serif;" >
		<br>
		<input type="hidden" name="scWriter" value="${ loginUser.memNo }"> <!-- 현재 로그인한 유저 아이디 전달 -->
		<input type="hidden" name="scNo" value="${ sc.scNo }">
		<div class="detail-area w3-panel w3-border w3-round text-left">
			<h4>&nbsp;&nbsp;일정 수정</h4>
			<hr>
		    <table align="center" class="text-left">
		        <tr>
		            <th width="100px">일정제목</th>
		            <td>
		            	<input class="w3-input w3-border w3-round" type="text" name="title" id="title" value="${ sc.title }">
		            </td>
		            <td>
		            	<select class="w3-border w3-round" name="scType" id="scType" value="${ sc.scType }">
		                    <option value="개인"><div class="scColorBox" style="background-color: #148CFF; margin-left:5px;"></div>개인</option>
		                    <option value="부서">부서<div class="scColorBox" style="background-color: #7B68EE;; margin-left:5px;"></div></option>
		                    <option value="회사">회사<div class="scColorBox" style="background-color: #378006; margin-left:5px;"></div></option>
		                </select>
		                
		                <script>
		                	$(function(){
		                		if($("select").val() == $("option").val()){
		                			$(this).attr("selected", true);
		                		}
		                	})
		                </script>
		            </td>
		        </tr>
		        
		        <tr>
		            <th>시작일</th>
		            <td width="350px">
		            	<input class="w3-border w3-round" type="date" name="start" id="startDate" value="${ sc.start }"> 
		            	<input class="w3-border w3-round" type="time" name="start" id="startTime" value="${ sc.start }" hidden>
		            </td>
		            <td rowspan="2">
						<input type="checkbox" id="timeCheck">
						<input type="hidden" id="allday" name="allday" value="${ sc.allday }">
						<label for="timeCheck">시간설정</label>
					</td>
		        </tr>
		        
		        <tr>
		            <th>종료일</th>
		            <td>
			            <input class="w3-border w3-round" type="date" name="end" id="endDate" value=${ sc.end }> 
			            <input class="w3-border w3-round" type="time" name="end" id="endTime" value=${ sc.end } hidden>
		            </td>
		        </tr>
		        <tr>
		            <th>내용</th>
		            <td colspan="2">
		            	<textarea class="w3-border w3-round" name="scContent" cols="45" rows="10" style="resize: none;" required>${ sc.scContent }</textarea>
		            </td>
		        </tr>
		    </table>
		</div>
		
	    <c:if test="${ !empty sc.reportTitle }">
		    <br>
			<div id="btn-area" align="right">
				<button type="button" class="btn" id="hideRep">
					업무 보고 접기 <i class='fas fa-angle-double-up' style='font-size: 15px'></i>
				</button>
				<button type="button" class="btn" id="showRep" hidden>
					업무 보고 보기 <i class='fas fa-angle-double-down'
						style='font-size: 15px'></i>
				</button>
			</div>
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
			<br><br>
		    <div class="report-area w3-panel w3-border w3-round text-left">
			    <!-- 보고서 영역 -->
				<h4 class="modal-title">업무 보고</h4>
				<hr>
				<table id="repInfo" align="center" class="text-left">
			 		<tr> 
						<th width='100px'>제목</th> 
						<td width='250px'><input class="w3-input w3-border w3-round" name="reportTitle" type="text" value="${ sc.reportTitle }"></td> 
				    </tr>
				    <tr>
				    	<th>최종 작성자</th>
				    	<td><input class="w3-input w3-border w3-round w3-light-grey" type="text" value="${ sc.reportWriter }" readonly></td>
				    	<input type="hidden" name="reportWriter" value="${ loginUser.memNo }">
				    </tr>
				    <tr> 
 	 	 				<th>내용</th> 
				 	  	<td>
				 	  		<textarea class="w3-border w3-round" name="reportContent" cols="45" rows="10" style="resize: none;" required>${ sc.reportContent }</textarea>
				 	  	</td> 
				    </tr> 
				    <tr> 
				 	  	<th><label for="upfile">첨부파일</label></th>
						<td>
							<input type="file" id="upfile" class="form-control-file border" name="reupfile">
								<b>현재 업로드된 파일</b> <br>
							<a href="${ sc.originName }" download="${ sc.changeName }" id="file1">${ sc.originName }</a>
							<input type="hidden" name="originName" id="originName">
							<input type="hidden" name="changeName" id="changeName">
						</td>
				    </tr> 
				</table>
			</div>
		</c:if>
		
		    
		<script>
	    	// 시간설정 -> 기본을 체크로 두고, 체크해제시 시간설정 input을 hidden처리하고 입력받지않는다.
	    	// 시간 input의 value값을 지우는 설정도 해야될듯 안그러면 값입력하고 hidden 처리시 값이 넘어오니까
	    	// => 체크해제시 하루종일 'Y'로 되게
			$(function(){
				$("#timeCheck").change(function(){
					if($(this).is(":checked")){ // 시간설정 체크시 => 하루종일 일정이 아님
						$("input[type=time]").removeAttr("hidden");
						$("input[type=time]").attr("required", true);
						$("#allday").val('N');
					}else{
						$("input[type=time]").attr("hidden", true);
						$("input[type=time]").removeAttr("required");
						$("input[type=time]").val("");
						$("#allday").val('Y');
					}
				})
				if($("#allday").val() = 'N'){
        			// 하루종일이 아니라면
        			// 시간설정이 checked
        			$("#timeCheck").attr("checked", true);
        		}else{
        			$("timeCheck").attr("checked", false);
        		}
				
			})
	    	
        </script>
        <hr>
		<div class="button-area" align="center">
			<button class="btn btn-secondary" onclick="window.close();">취소</button>
			<button class="btn btn-primary" type="submit">저장</button>
		</div>
		<br>
	</form>
</body>
</html>