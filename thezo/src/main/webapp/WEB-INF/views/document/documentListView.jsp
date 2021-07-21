<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav{
		width: 200px;
		height: 800px; 
		margin: 0;
		float: left;
		background-color:rgb(236, 236, 236);
		box-sizing: border-box;
	}
	
	#nav button{
		margin: 10px;
	}
	
	#nav a{
		color: black;
	}
	
	#nav ul{
		padding: 0;
		list-style-type: none;
	}
	
	.list-area{
		width: 900px;
		height: 800px;
		margin-left: 50px;
		float: right;
	}
	      
	.list-area img:hover {
		cursor: porinter;
	}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    
    <section>
    	<div class="outer">
			<br>
			<%-- -- 문서관리 네비바 ------------------------------%>
            <div id="nav">
            	문서관리 메뉴바 수정 해야함 <br>
                <b style="margin-left: 30px; font-size: 25px;">문서양식</b> 
				<hr>
                <div id="nav">
					<ul align="left">
						<a href="list.doc"><li>공용 문서양식</li></a>
						<a href=""><li>부서별 문서양식</li></a>
						<!-- 클릭 시 부서별 게시판 이름이 나오게 -->
						
						<!-- 홈페이지에서 생성하게 할 수 있을까?-->
						<!-- 각각 a링크를 주지말고 category=""의 조건을 줘서 조회되면 좋겠다 -->
						<ul>
							<a href=""><li>재무팀</li></a>
							<a href=""><li>영업팀</li></a>
							<a href=""><li>총무팀</li></a>
						</ul>
					</ul>
					
					
				</div>
            </div>
            <%------------------------------네비바 끝 ------------------ --%>
		    
		    
		    
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
						                    <td><input type="checkbox" id="${ d.docNo }"></td>
						                    <td>${ d.docNo }</td>
						                    <td>${ d.docWriter }</td>
						                    <td>${ d.docContent }</td>
						                    <td>
												<a href="${ d.changeName }" download="${ d.originName }">
													<div>
														<img style="width:20px; height:20px;" src='${pageContext.request.contextPath}/resources/images/downloadIcon.png');>
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
			            <a href="update.doc" class="btn btn-primary">수정</a>
			            <a href="delete.doc" class="btn btn-danger">삭제</a>
		            
		            
		            <button class="btn btn-primary" data-toggle="modal" data-target="#insertDoc" style="float:right;">등록</button>
		    	</div>
		    	
		    	<%-- update, delete 기능 수행 할 스크립트 수정중 --------------------------- --%>
		    	<script>
		    		var test1 = document.getElementById('fruit1');
		    		var test1 = document.getElementById('fruit1');
		    		$(function(){
		    			if($(input[checkbox]).attr("checked")){
		    				console.log($(this));
		    			}
		    		})
		    	</script>
		    		
		        
		        <br><br>
		        
		        <%-- 문서등록 창 ------------------------------------------------------------------------%>
		        	<form action="insert.doc" id="docEnrollForm" method="post" enctype="multipart/form-data">
						<!-- The Modal -->
						<div class="modal" id="insertDoc">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						
						      <!-- Modal Header -->
						      <div class="modal-header">
						        <h4 class="modal-title">문서등록</h4>
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
							            <td colspan="2"><textarea name="docContent" id="" cols="50" rows="10" style="resize: none;" required></textarea></td>
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
		        
			</div>
    	</div>
    </section>
    
</body>
</html>