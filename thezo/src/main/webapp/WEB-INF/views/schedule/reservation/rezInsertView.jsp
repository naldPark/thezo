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
    <!-- The Modal -->
    <div class="modal" id="insert">
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
                                <select name="resourceName">
                                    <option value="">회의실A</option>
                                    <option value="">회의실B</option>
                                    <option value="">회의실C</option>
                                    <option value="">차량A</option>
                                    <option value="">자원들 반복문</option>
                                </select>

                            </td>
	                    </tr>
	                    <tr>
                            <th>예약 날짜</th>
                            <td><input type="date" name="rezDate"></td>
                        </tr>
	                    <tr>
	                        <th>예약 시간</th>
	                        <td><input type="time" name="startTime"> ~ <input type="time" name="endTime"></td>
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
                        <a href="delete.rez" class="btn btn-danger" data-toggle="modal" data-target="#rez-del">삭제</a>
                    </div>
                </div>
        
            </div>
        </div>
    </div>


</body>
</html>