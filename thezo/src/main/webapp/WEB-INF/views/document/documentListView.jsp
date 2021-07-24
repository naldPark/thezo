<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style>
	.list-area{width: 900px; height: 800px; margin-left: 50px; float: right;}
	#search{width: 300px; margin: 0; box-sizing: border-box;}
	.btn-search{text-align: left; padding: 10px; margin: 10px;}
	.search-area{margin:auto 0;text-align: center;}
	#condition{text-align: left; margin: 10px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    
    <section>
    	<div class="outer">
			<!-- -- 문서관리 네비바 --->
			<jsp:include page="documentMenubar.jsp"/>            
		    

		    <br>
		    
			<select style="float:right; margin:15px;">
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
				<option value="15" selected>15개씩</option>
				<option value="20">20개씩</option>
				<option value="30">30개씩</option>
			</select>
			
		    <div class="list-area" align="center">
		        <table border="1" class="table table-bordered text-center" id="list-tb">
		            <thead>
		                <tr>
		                    <th width="60px">선택</th>
		                    <th>No</th>
		                    <th>작성자</th>
		                    <th width="400px">내용</th>
		                    <th>파일</th> 
		                    <th>등록일</th>
		                </tr>
		            </thead>
		            <tbody>
						<c:choose>
							<c:when test="${ empty list }">
								<tr>
									<td colspan="6">등록된 문서양식이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="d" items="${ list }">
									<tr>
										<td><input type="checkbox" class="docCheck" value="${ d.docNo }"></td>
										<td>${ d.docNo }</td>
										<td>${ d.docWriter }</td>
										<td>${ d.docContent }</td>
										<td>
											<a href="${ d.changeName }" download="${ d.originName }">
												<div>
													<i class='far fa-file' style='font-size:20px'></i>
												</div>
											</a>
										</td>
										<td>${ d.createDate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
		            </tbody>
		        </table>
		        
		        <div class="button-area" align="left">
					<a href="#" data-toggle="modal" data-target="#updateDoc" class="btn btn-primary">수정</a>
					<a href="#" data-toggle="modal" data-target="#deleteDoc" class="btn btn-danger">삭제</a>
		            <button class="btn btn-primary" data-toggle="modal" data-target="#insertDoc" style="float:right;">등록</button>
		    	</div>
		    	
		    	<%-- update, delete 기능 수행 할 스크립트 -------------------------- --%>
		    	<script>
		    		// checked 된 값 가져오기..ㅠㅠ 왜안됨
		    		/*
			    	var array = Array();
		    		var count = 0;
		    		var chkbox = $(".docCheck");
		    		
		    		for(i=0; i<chkbox.length; i++){
			    		if(chkbox[i].checked == true){
			    			array[count] = chkbox[i].value;
			    			count++;
			    		}
		    		}
		    		// 삭제하기 기능
		    		function deleteDoc(){
			    		console.log(array);
			    		//location.href = "delete.doc";
		    		}
		    		
		    		// 수정하기 기능
		    		function updateDoc(){
		    			if(chkbox.length == 1){
		    				location.href = "update.doc";
		    			}else{
		    				//alert("한 개만 선택해주세요");
		    			}
		    		}
		    		*/
		    		
		    	</script>
		    		
		        
		        <br><br>
		        
		        <%-- 문서등록 모달창 --------%>
				<jsp:include page="documentInsertView.jsp"/>
		        
		        <%-- 문서수정 모달창 -------%>
		        <jsp:include page="documentUpdateView.jsp"/>
		        
		        <%-- 문서삭제 모달창 ----- --%>
		        <jsp:include page="documentDeleteView.jsp"/>



		        <%-- 페이징바 ------------------------------------------------------------------------ --%>
		        <div class="paging-area">
		            <ul class="pagination justify-content-center">
		            	<c:choose>
		            		<c:when test="${ pi.currentPage != 1 }">
			                	<li class="page-item"><a class="page-link" href="list.doc?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
			                </c:when>
			                <c:otherwise>
			                	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
			                </c:otherwise>
			            </c:choose>
			                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                <li class="page-item active"><a class="page-link" href="list.doc?currentPage=${ p }">${ p }</a></li>
			                </c:forEach>
			            <c:choose>
			                <c:when test="${ pi.currentPage != pi.maxPage }">
			                	<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">Next</a></li>
			                </c:when>
			                <c:otherwise>
			                	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
			                </c:otherwise>
		                </c:choose>
		            </ul>
		        </div>
		        <%------------------------------------------------------------------------------ 페이징바 끝--%>

				<%-- 검색바 ------%>
				<div class="search-area">
					<form class="form-inline justify-content-center" action="search.doc">
						<select class="form-control" name="condition" id="condition">
							<option value="docWriter" selected>작성자</option>
							<option value="docContent">내용</option>
						</select>
						<input type="search" class="form-control" placeholder="검색어를 입력하세요" id="search">
						<button type="submit" class="btn btn-primary btn-search">검색</button>
					</form>
				</div>
			</div>
    	</div>
		
    </section>
    
</body>
</html>