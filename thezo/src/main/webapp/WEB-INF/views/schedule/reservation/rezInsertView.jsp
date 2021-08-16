<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약하기</title>
</head>
<body>
	<form action="insert.rez">
		<input type="hidden" name="rezWriter" value="${ loginUser.memNo }">
	    <!-- The Modal -->
	    <div class="modal" id="insertRez">
	        <div class="modal-dialog">
	            <div class="modal-content">
	        
	                <!-- Modal Header -->
	                <div class="modal-header">
		                <b class="modal-title">예약하기</b>
		                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	        
	                <!-- Modal body -->
	                <div class="modal-body">
		                <table class="" align="center">
		                    <tr>
		                        <th width="120px">자원 이름</th>
		                        <td colspan="2">
	                                <select name="resourceName" id="resourceName">
	                                	<c:forEach var="r" items="${ reList }">
	                                    	<option value="${ r.resourceNo }">${ r.resourceName }</option>
	                                    </c:forEach>
	                                </select>
	                            </td>
		                    </tr>
		                    <tr>
	                            <th>예약 날짜</th>
	                            <td><input type="date" name="rezDate" id="rezDate"></td>
	                        </tr>
		                    <tr>
		                        <th>예약 시간</th>
		                        <td><input type="time" name="startTime" id="startTime" step="900"> ~ <input type="time" name="endTime" id="endTime" step="900"></td>
	                            <td></td>
		                    </tr>
		                   
		                    <tr>
		                        <th>사용 용도</th>
		                        <td><textarea name="useFor" cols="40" rows="5" style="resize:none"></textarea></td>
		                    </tr>
		                </table>
	                </div>
	                
	        
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <div class="button-area">
	                        <button class="btn btn-primary" type="submit">확인</button>
	                        <button class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    </div>
	                </div>
	        
	            </div>
	        </div>
	    </div>
	</form>

</body>
</html>