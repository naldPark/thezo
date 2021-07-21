<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<!-- 문서관리 네비바 -->
            <div id="nav">
                <b style="margin-left: 30px; font-size: 25px;">문서양식</b> 
				<hr>
                <div id="nav">
					<ul align="left">
						<a href=""><li>공용 문서양식</li></a>
						<a href=""><li>부서별 문서양식</li></a>
						<!-- 클릭 시 부서별 게시판 이름이 나오게 -->
						
						<!-- 홈페이지에서 생성하게 할 수 있을까?-->
						<ul>
							<a href=""><li>재무팀</li></a>
							<a href=""><li>영업팀</li></a>
							<a href=""><li>총무팀</li></a>
						</ul>
					</ul>
					
					
				</div>
            </div>
			

			
            <!-------------------------------네비바 끝-->
		    
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
		                <tr>
		                    <td><input type="checkbox"></td>
		                    <td>3</td>
		                    <td>사원 김개똥</td>
		                    <td>개정된 회의록 양식입니다.</td>
		                    <td> <!-- 클릭시 => 문서다운로드 => a링크였나..? -->
								<div><img style="width:20px; height:20px;" src='${pageContext.request.contextPath}/resources/images/downloadIcon.png');></div>
							</td>
		                    <td>21.07.11</td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox"></td>
		                    <td>2</td>
		                    <td>사원 김개똥</td>
		                    <td>개정된 회의록 양식입니다.</td>
		                    <td>
								<div><img style="width:20px; height:20px;" src='${pageContext.request.contextPath}/resources/images/downloadIcon.png');></div>
							</td>
		                    <td>21.07.05</td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox"></td>
		                    <td>1</td>
		                    <td>사원 김개똥</td>
		                    <td>개정된 회의록 양식입니다.</td>
		                    <td><div><img style="width:20px; height:20px;" src='${pageContext.request.contextPath}/resources/images/downloadIcon.png');></div></td>
		                    <td>21.07.02</td>
		                </tr>
		                
		            </tbody>
		        </table>
		        
		        <div class="button-area" align="left">
		
		            <button class="btn btn-primary">수정</button>
		            <button class="btn btn-danger">삭제</button>
		            
		            <button class="btn btn-primary" data-toggle="modal" data-target="#docAdd" style="float:right;">등록</button>
		    	</div>
		    		
		    		<%-- 문서등록 창 --%>
		        	<form action="문서등록url">
						<!-- The Modal -->
						<div class="modal" id="docAdd">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						
						      <!-- Modal Header -->
						      <div class="modal-header">
						        <h4 class="modal-title">문서등록</h4>
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						      </div>
						
						      <!-- Modal body -->
						      <div class="modal-body">
							    <table class="" align="center">
							        <tr>
							            <th width="120px">작성자</th>
							            <td colspan="2"><input type="text" name="scheduleTitle" style="width: 380px;" placeholder="일정 제목을 입력해주세요"></td>
							            <td>
							                <select name="scType" id="scType">
							                    <option value="personal">재무팀</option>
							                    <option value="dep">영업팀</option>
							                    <option value="com">총무팀</option>
							                </select>
							            </td>
							        </tr>
							        
							        <tr>
							            <th>내용</th>
							            <td colspan="2"><textarea name="sheduleContent" id="" cols="50" rows="10" style="resize: none;"></textarea></td>
							        </tr>
							        <tr>
							            <th>첨부파일</th>
							            <td><input type="file" name="endDate"></td>
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
		        
		        <br><br>
		        
		        <div class="paging-area">
		            <ul class="pagination justify-content-center">
		                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                <li class="page-item active"><a class="page-link" href="#">1</a></li>
		                <li class="page-item"><a class="page-link" href="#">2</a></li>
		                <li class="page-item"><a class="page-link" href="#">3</a></li>
		                <li class="page-item"><a class="page-link" href="#">Next</a></li>
		            </ul>
		        </div>
			</div>
    	</div>
    </section>
    
</body>
</html>