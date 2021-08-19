<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기-나의예약목록</title>
<style>
    #myList{
        width: 950px;
        margin: 0;
        float: left;
        box-sizing: border-box;
        padding: 25px;
        float:right;
    }
    #myList>table{text-align: center; width: 800px;}
    #myList>table th{width: 10%;}  
    
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp"/>
    <section>
        <div class="outer">
			<!-- 예약관리 메뉴바 -->
            <jsp:include page="rezMenubar.jsp"/>
            <div id="myList">
                &nbsp;&nbsp;&nbsp;
                <b>나의 예약 목록</b>
                <hr>
                &nbsp;&nbsp;&nbsp;
                <b>예약 현황</b><br><br>
                <table class="table table-hover table-sm" id="myRez" align="center">
                    <thead class="thead-light">
                        <tr>
                            <th width="100px">분류</th>
                            <th>자원명</th>
                            <th>예약시간</th>
                            <th>상태</th>
                        </tr>
                    </thead>

                    <tbody>
                    	<c:choose>
                    		<c:when test="${ empty myRezList }">
                    			<tr><td>예약 내역이 없습니다.</td></tr>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach var="r" items="${ myRezList }">
	                    			<tr>
		                    			<input type="hidden" id="rezNo" value="${ r.rezNo }">
		                    			<td>${ r.categoryName }</td>
		                    			<td>${ r.resourceName }</td>
		                    			<td>${ r.rezDate } ${ r.startTime } ~ ${ r.endTime }</td>
		                    			<td>
		                    				<button class="btn" onclick="delete1(${r.rezNo});">삭제</button>
		                                	| 
		                                	<button class="btn" onclick="detail(${r.rezNo});">상세보기</button>
		                                </td>
		                    		</tr>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </tbody>
                </table>
                <br>
				<c:if test="${ !empty myRezList }">
			        <%-- 페이징바 ------------------------------------------------------------------------ --%>
			        <div class="paging-area">
			            <ul class="pagination justify-content-center">
			            	<c:choose>
			            		<c:when test="${ pi.currentPage eq 1 }">
				            		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				            	</c:when>
				            	<c:otherwise>
		                			<li class="page-item"><a class="page-link" href="myList.rez?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage - 1 }">Previous</a></li>
				                </c:otherwise>
				            </c:choose>
				            
		               		<c:choose>
		               			<c:when test="${ empty condition }">
		               				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		               					<c:choose>
		               						<c:when test="${ pi.currentPage eq p }">
		               							<li class="page-item active"><a class="page-link" href="myList.rez?memNo=${ loginUser.memNo }&currentPage=${ p }">${ p }</a></li>
		               						</c:when>
		               						<c:otherwise>
		               							<li class="page-item"><a class="page-link" href="myList.rez?memNo=${ loginUser.memNo }&currentPage=${ p }">${ p }</a></li>
		               						</c:otherwise>
		               					</c:choose>
		               				</c:forEach>
		               			</c:when>
		               		
	              			</c:choose>
				                			
				            <c:choose>
				            	<c:when test="${ pi.currentPage eq pi.maxPage }">
				            		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				            	</c:when>
				            	<c:otherwise>
				                	<li class="page-item"><a class="page-link" href="myList.rez?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage + 1 }">Next</a></li>
			            		</c:otherwise>
			                </c:choose>
			            </ul>
	        		</div>
	        	</c:if>
			        <%------------------------------------------------------------------------------ 페이징바 끝--%>
            </div>
        </div>

    </section>
    
    <script>
    	function detail(num){
    		var option = "width = 700, height = 350, top = 100, left = 200, location = no";
			window.open("detail.rez?rezNo=" + num, "자원예약 상세조회", option);
    	}
    	
    	function delete1(num){
    		$("#rez-del").modal(num);
    		$("#num").val(num);
    	}
    	
    	function deleteRez(){
    		location.href = "delete2.rez?memNo=${ loginUser.memNo }&rezNo="+ $("#num").val();
    		$("#num").val('');
    	}
    </script>

    <!-- The Modal -->
	<div class="modal" id="rez-del">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">삭제 확인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">해당 예약을 취소하고 삭제하시겠습니까?</div>
				
				<!-- Modal footer -->
				<div class="modal-footer" align="center">
					<input type="hidden" id="num" value="">
					<button class="btn btn-danger" onclick="deleteRez();">삭제</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
       
</body>
</html>