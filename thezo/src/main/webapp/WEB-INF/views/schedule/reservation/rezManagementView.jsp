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
	<div class="modal" id="rezManage">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">자원 관리</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table>
	      		<tr>
	      			<th width=120px;>분류</th>
	      			<td>회의실</td>
	      		</tr>
	      		<tr>
	      			<th>자원 이름</th>
	      			<td>회의실A</td>
	      		</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary">저장</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>