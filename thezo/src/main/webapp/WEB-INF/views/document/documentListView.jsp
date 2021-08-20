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
<body class="body">
	<jsp:include page="../common/header.jsp"/>
    
    <section>
    	<div class="outer">
			<!-- -- 문서관리 네비바 --->
			<jsp:include page="documentMenubar.jsp"/>            

		    <br>
		    
			<select style="float:right; margin:15px;" name="dCount" id="dCount" onchange="countChange();">
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
				<option value="15">15개씩</option>
				<option value="20">20개씩</option>
				<option value="30">30개씩</option>
			</select>
			
			<script>
				$(function(){
					$('#dCount').val('${dCount}').prop("selected",true);
				})
				
				function countChange(){
					var para = document.location.href.split("?"); // 현재 파라미터 값 가져오기
					$("#dCount>option").removeAttr("selected");
					if(para.length>=2){ 
						// 파라미터 값 까지 넘겨서 새로고침
						if(para[1].indexOf("keyword") == -1){
							// 검색어가 없다면 list.doc로 dCount, docCategory 값만 전달
							location.href = "list.doc?dCount=" + $("#dCount").val()
											+ "&docCategory=" + '${ docCategory }';
						}else{
							// 검색어가 있다면 search.doc로 검색어 + dCount 전달
							if(para[1].indexOf("dCount") == -1){
								location.href = "search.doc?" + para[1]
												+ "&dCount=" + $("#dCount").val()
												+ "&docCategory=" + '${ docCategory }';
							}else{ 
								// 이미 dCount를 넘겨주었다면, 값을 지우고 다시 전달
								var cut = para[1].split("&dCount");
								location.href = "search.doc?" + cut[0]
												+ "&dCount=" + $("#dCount").val()
												+ "&docCategory=" + '${ docCategory }';
									
							}
						}
					}else{
						location.href = "list.doc?dCount=" + $("#dCount").val() + "&docCategory=" + '${ docCategory }';
					}
				}
			</script>
			
		    <div class="list-area" align="center">
		        <table border="1" class="table table-bordered table-sm text-center" id="list-tb">
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
										<td hidden>${ d.memNo }</td>
										<td><input type="checkbox" class="docCheck"></td>
										<td>${ d.docNo }</td>
										<td>${ d.department } ${ d.docWriter }</td>
										<td>${ d.docContent }</td>
										<td>
											<a data-toggle="tooltip" title='${ d.originName }' href="${ d.changeName }" download="${ d.originName }">
												<i class='far fa-file' style='font-size:20px'></i>
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
					<button class="btn btn-primary" type="button" id="update">수정</button>
					<button class="btn btn-danger" data-toggle="modal" data-target="#deleteDoc">삭제</button>
		            <button class="btn btn-primary" data-toggle="modal" data-target="#insertDoc" style="float:right;">등록</button>
		    	</div>
		    	
				<script>
					$(document).ready(function(){
						$('[data-toggle="tooltip"]').tooltip();   
					});
				</script>
		    	
		    	<%-- update, delete 기능 수행 할 스크립트 -------------------------- --%>
		    	<script>
		    		$(function(){
						
						var arr = [];
		    			
		    			$("#update").click(function(){
			    			$("input[type=checkbox]:checked").each(function(){ // 체크된 게시물 확인
			    				var dno = $(this).parent().next().text(); // 글번호
			    				arr.push(dno);
			    				//console.log(arr);
			    			})
		    				if(arr.length > 1){ // 두 개 이상의 게시물은 수정불가
		    					alert("한 개의 게시물만 수정할 수 있습니다.");
		    					location.reload();
		    				}else{ // 선택된 게시물이 하나라면, 아이디 조건 검사
		    					if('${ loginUser.memNo }' == $("input[type=checkbox]:checked").parent().prev().text()){ // 작성자 아이디 검사
		    						updateDoc();
		    					}else{
		    						alert("작성자만 수정할 수 있습니다.");
		    						arr = [];
									location.reload();
		    					}
		    				}
		    			})
		    			
		    			function updateDoc(){
		    				//console.log(arr[0]);
							$.ajax({
								url : "select.doc",
								data: {arr:arr},
								type: "post",
								success:function(d){
									var doc = Object.values(JSON.parse(d));
									//console.log(doc);
									$("#docNo").val(doc[0]);
									$("#docContent").val(doc[3]);
									$("#docCategory option[value=${ docCategory }]").attr("selected", true);
									
									// 현재 업로드된 파일
									$("#file1").attr("href", doc[7])
									$("#file1").text(doc[6]);
									$("#file1").attr("download", doc[7]);
									$("#originName").val(doc[6]);
									
									$("#changeName").val(doc[7]);
									$("#updateForm").modal('show');
								},error: function(){
									console.log("문서양식 수정용 조회 ajax 통신실패");
								}
							})
						}
		    			
			    		// 삭제하기 기능
			    		$("#delete").click(function(){
							// 체크박스 체크된 게시글 알아내기
							$("input[type=checkbox]:checked").each(function(){
								var dno = $(this).parent().next().text(); // 글번호
								//console.log(dno);
							
								// 1. 삭제 권한 검사 (로그인한 유저 id == 작성자 id)
								if('${ loginUser.memNo }' == $(this).parent().prev().text()){  // 작성자와 로그인한 사람의 아이디가 같다면
									arr.push(dno); // 배열에 담기
									// 컨트롤러로 배열값 넘겨주기
									//console.log("arr값 : " + arr)
									
									// 삭제 함수 실행
									deleteAjax();
													
			    				}else{ // 아이디가 다르면
									alert("작성자만 삭제할 수 있습니다.");
			    					arr = [];
									location.reload();
								}
							})
						})
						
						// 삭제 기능
						function deleteAjax(){
			    			$.ajax({
								url: "delete.doc",
								type: "GET",
								data: {arr:arr},
								success:function(status){
									if(status == "success"){
										alert("해당 문서가 성공적으로 삭제되었습니다.");
										location.reload();
									}
								},error: function(){
									console.log("ajax삭제실패");
								}
							})	
							arr = []; // 데이터 전달 후 배열 초기화
			    		}
			    		
						
		    		})
		    		
		    		// 취소버튼 클릭 시
					$("#cancel").click(function(){
						arr = []; // 배열에 담긴 값 초기화
						$(".modal").modal('hide'); // 모달창 닫기
						location.reload();
					})
		    	</script>
		    		
		        
		        <br>
		        
		        <%-- 문서등록 모달창 --------%>
				<jsp:include page="documentInsertView.jsp"/>
		        
		        <%-- 문서삭제 모달창 ----- --%>
		        <div class="modal" id="deleteDoc">
			        <div class="modal-dialog">
			            <div class="modal-content">
			        
			                <!-- Modal Header -->
			                <div class="modal-header">
				                <b class="modal-title">삭제 확인</b>
				                <button type="button" class="close" data-dismiss="modal">&times;</button>
			                </div>
			        
			                <!-- Modal body -->
			                <div class="modal-body">
			                	선택한 게시글을 삭제하시겠습니까? <br>
			                	<b>*선택한 글이 삭제되고, 복구할 수 없습니다.</b>
			                </div>
			        
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <div class="button-area">
			                        <button type="button" id="delete" class="btn btn-danger">삭제</button>
			                        <button type="button" id="cancel" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                    </div>
			                </div>
			        
			            </div>
			        </div>
			    </div>

				<%-- 문서수정 모달창 -------%>
			    <!-- The Modal -->
				<div class="modal" id="updateForm">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
			
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">문서수정</h4>
								<button type="button" class="close" onclick="window.location.reload();" data-dismiss="modal">&times;</button>
							</div>
			
							<!-- Modal body -->
							<form action="update.doc" id="docUpdateForm" method="post" enctype="multipart/form-data">
								<input type="hidden" value="" name="docNo" id="docNo"> 
								<div class="modal-body">
									<table class="" align="center">
										<tr>
											<th width="120px">작성자</th>
											<td colspan="2"><input type="text" id="docWriter" name="docWriter" value="${ loginUser.memId }" readonly></td>
											<td>
												<select name="docCategory" id="docCategory">
													<option value='공용'>공용</option>
													<c:forEach var="dc" begin="2" items="${ category }">
														<option value='${ dc.depName }'>${ dc.depName }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										
										<tr>
											<th>내용</th>
											<td colspan="2"><textarea name="docContent" id="docContent" cols="50" rows="10" style="text-aling: left; resize: none;" required>${ d.docContent }</textarea></td>
										</tr>
										<tr>
					                        <th><label for="upfile">첨부파일</label></th>
					                        <td>
					                            <input type="file" id="upfile" class="form-control-file border" name="reupfile">
				                            	 <b>현재 업로드된 파일</b> <br>
				                            	<a href="" download="" id="file1"></a>
				                            	<input type="hidden" name="originName" id="originName">
				                            	<input type="hidden" name="changeName" id="changeName">
					                        </td>
					                    </tr>
			
			
									</table>
			
								</div>
								
								<!-- Modal footer -->
								<div class="modal-footer center">
									<div class="button-area">
										<button class="btn btn-secondary" data-dismiss="modal" id="cancel" onclick="window.location.reload();">취소</button>
										<button class="btn btn-primary" type="submit">저장</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				
				<c:if test="${ !empty list }">
			        <%-- 페이징바 ------------------------------------------------------------------------ --%>
			        <div class="paging-area">
			            <ul class="pagination justify-content-center">
			            	<c:choose>
			            		<c:when test="${ pi.currentPage eq 1 }">
				            		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<c:choose>
				            			<c:when test="${ empty condition }">
				                			<li class="page-item"><a class="page-link" href="list.doc?currentPage=${ pi.currentPage - 1 }&dCount=${ dCount }&docCategory=${ docCategory }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="search.doc?currentPage=${ pi.currentPage - 1 }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }&docCategory=${ docCategory }">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </c:otherwise>
				            </c:choose>
				            
	                		<c:choose>
	                			<c:when test="${ empty condition }">
	                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                					<c:choose>
	                						<c:when test="${ pi.currentPage eq p }">
	                							<li class="page-item active"><a class="page-link" href="list.doc?currentPage=${ p }&dCount=${ dCount }&docCategory=${ docCategory }">${ p }</a></li>
	                						</c:when>
	                						<c:otherwise>
	                							<li class="page-item"><a class="page-link" href="list.doc?currentPage=${ p }&dCount=${ dCount }&docCategory=${ docCategory }">${ p }</a></li>
	                						</c:otherwise>
	                					</c:choose>
	                				</c:forEach>
	                			</c:when>
	                		
	                			<c:otherwise>
	                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                					<c:choose>
	                						<c:when test="${ pi.currentPage eq p }">
	                							<li class="page-item active"><a class="page-link" href="search.doc?currentPage=${ p }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }&docCategory=${ docCategory }">${ p }</a></li>
	                						</c:when>
	                						<c:otherwise>
	                							<li class="page-item"><a class="page-link" href="search.doc?currentPage=${ p }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }&docCategory=${ docCategory }">${ p }</a></li>
	                						</c:otherwise>
	                					</c:choose>
	                				</c:forEach>
	                			</c:otherwise>
	               			</c:choose>
				                			
				            <c:choose>
				            	<c:when test="${ pi.currentPage eq pi.maxPage }">
				            		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<c:choose>
					            		<c:when test="${ empty condition }">
						                	<li class="page-item"><a class="page-link" href="list.doc?currentPage=${ pi.currentPage + 1 }&dCount=${ dCount }&docCategory=${ docCategory }">Next</a></li>
					            		</c:when>
					            		<c:otherwise>
					            			<li class="page-item"><a class="page-link" href="search.doc?currentPage=${ pi.currentPage + 1 }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }&docCategory=${ docCategory }">Next</a></li>
					            		</c:otherwise>
				            		</c:choose>
			            		</c:otherwise>
			                </c:choose>
			                
			            </ul>
			        </div>
			        <%------------------------------------------------------------------------------ 페이징바 끝--%>
			        
			        <%-- 검색바 ------%>
					<div class="search-area">
						<form id="searchForm" class="form-inline justify-content-center" action="search.doc" method="Get">
							<input type="hidden" name="docCategory" value=${ docCategory }>
							<select class="form-control" name="condition" id="condition">
								<option value="writer">작성자</option>
								<option value="content">내용</option>
							</select>
							<input type="search" class="form-control" name="keyword" value="${ keyword }" placeholder="검색어를 입력하세요">
							<button type="submit" class="btn btn-primary btn-search">검색</button>
						</form>
						
						<c:if test="${ !empty condition }">
				            <script>
				            	$(function(){
				            		$("#searchForm option[value=${ condition }]").attr("selected", true);
				            	})
				            </script>
			            </c:if>
					</div>
			        
				</c:if>
				
				
			</div>
    	</div>
		
    </section>
</body>
</html>