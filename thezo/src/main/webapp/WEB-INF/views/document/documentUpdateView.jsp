<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#docContent{
		text-align: left;
	}
</style>
<body>
	<form action="insert.doc" id="docEnrollForm" method="post" enctype="multipart/form-data">
		<!-- The Modal -->
		<div class="modal" id="updateDoc">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">문서수정</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<input type="hidden" name="docWriter" value="${ loginUser.userId }">
			    <table class="" align="center">
			        <tr>
			            <th width="120px">작성자</th>
			            <td colspan="2">${ loginUser.userId }</td>
			            <td>
			                <select name="docCategory" id="docCategory">
			                	<option value="공용">공용</option>
			                    <option value="재무팀">재무팀</option>
			                    <option value="영업팀">영업팀</option>
			                    <option value="총무팀">총무팀</option>
			                </select>
			            </td>
			        </tr>
			        
			        <tr>
			            <th>내용</th>
			            <td colspan="2">
			            	<textarea name="docContent" id="docContent" cols="50" rows="10" style="text-aling:left; resize: none;" required>위하여 길지 같이, 인생에 장식하는 얼마나 동산에는 뿐이다. 같으며, 물방아 기쁘며, 굳세게 전인 예가 하였으며, 피는 군영과 황금시대다. 우리 있는 노래하며 광야에서 못할 봄날의 봄바람이다. 수 그것은 사라지지 무엇을 사막이다.</textarea>
			            </td>
			        </tr>
			        <tr>
			            <th>첨부파일</th>
			            <td><input type="file" name="upfile" required></td>
			        </tr>
			        
			
			    </table>
			    
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
	</form>
</body>
</html>