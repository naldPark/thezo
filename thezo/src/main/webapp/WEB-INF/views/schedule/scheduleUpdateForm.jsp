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
</head>
<body>
	<form action="update.sc" method="post" style="font-family:'Noto Sans KR', sans-serif;" >
		<br>
		<input type="hidden" name="scWriter" value="${ loginUser.memNo }"> <!-- 현재 로그인한 유저 아이디 전달 -->
		<input type="hidden" name="scNo" value="${ sc.scNo }">
		<h4>&nbsp;&nbsp;일정 수정</h4>
		<hr>
	    <table align="center">
	        <tr>
	            <th width="120px">일정제목</th>
	            <td>
	            	<input type="text" name="title" id="title" value="${ sc.title }">
	            </td>
	            <td>
	            	<select name="scType" id="scType" value="${ sc.scType }">
	                    <option value="개인">개인</option>
	                    <option value="부서">부서</option>
	                    <option value="회사">회사</option>
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
	            	<input type="date" name="start" id="startDate" value="${ sc.start }"> 
	            	<input type="time" name="start" id="startTime" value="${ sc.start }">
	            </td>
	            <td rowspan="2">
					<input type="checkbox" id="timeCheck" checked>
					<input type="hidden" id="allday" name="allday" value="${ sc.allday }">
					<label for="timeCheck">시간설정</label>
				</td>
	        </tr>
	        
	        <tr>
	            <th>종료일</th>
	            <td>
		            <input type="date" name="end" id="endDate" value=${ sc.end }> 
		            <input type="time" name="end" id="endTime" value=${ sc.end }>
	            </td>
	        </tr>
	        <tr>
	            <th>내용</th>
	            <td colspan="2">
	            	<textarea name="scContent" cols="45" rows="10" style="resize: none;" required>${ sc.scContent }</textarea>
	            </td>
	        </tr>
	    </table>
		    
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
			<button class="btn btn-secondary" data-dismiss="modal">취소</button>
			<button class="btn btn-primary" type="submit">저장</button>
		</div>
		<br>
	</form>
</body>
</html>