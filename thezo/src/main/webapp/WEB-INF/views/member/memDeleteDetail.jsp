<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
   .innerOuter{
        width: 1000px;
        margin:auto;
        padding:5% 5%;
        background:white;
    }

    #content1{
        width:80%;
        margin:auto;
    }
    #content , #address-area{width:50%;}

</style>
</head>
<body>

	<!-- 관리자 : 사원 삭제(이성경) -->

	<jsp:include page="../common/header.jsp" />
	
	<script>	
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>
	<section>
		
	
    <div class="outer">
		<br><br><br><br>
        <div class="innerOuter">
            <h2><b>사원 삭제</b></h2>
            <br>

            <div id="content1">

                <div align="center" class="d-flex justify-content-center">
                	<form action="adminMemDelete.me" id="postForm" method="post">
                		<input type="hidden" name="mno" value="${ m.memNo }">
                        <div class="form-group d-flex justify-content-center">
                        	<c:choose>
                        		<c:when test="${ m.originName == null }">
                        			<img style="width: 200px;border-radius:50%; object-fit:cover;" id="preview-image" src="resources/images/userProfile.png">
                        		</c:when>
                        		<c:otherwise>
                        			<img style="width: 200px;border-radius:50%; object-fit:cover;" id="preview-image" src="${ m.originName }">
                        		</c:otherwise>
							</c:choose>
							
                        </div>
                        
                        <div id="content" class="form-row">
                            <label for="memNo" align="left">사원번호</label>
                            <input type="text" class="form-control" id="memNo" name="memNo" value="${ m.memNo }" readonly><br>

                            <label for="memId">아이디</label>
                            <input type="text" class="form-control" id="memId" name="memId" value="${ m.memId }" readonly><br>

                            <label for="memName">이름</label>
                            <input type="text" class="form-control" id="memName" name="memName" value="${ m.memName }" readonly><br>
						</div>
						
						 
                       <div id="content" class="form-row">
	                       	<br>
	                       	<c:choose>
	                       		<c:when test="${ m.gender == 'M' }">
					                <label for="gender">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <input type="text" class="form-control" name="gender" id="Male" value="남" readonly>
					                
					            </c:when>
					            <c:otherwise>
					            	<label for="gender">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <input type="text" class="form-control" name="gender" id="Female" value="여" readonly>
					               
				                </c:otherwise>
			                </c:choose>
                       </div>  
                       
						
						<div id="content" class="form-row">
							<label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${ m.phone }"readonly><br>
                            	
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email" value="${ m.email }" readonly><br>
                            
                            <label for="birth">생년월일</label>
                            <input type="text" class="form-control" id="birth" name="birth"  value="${ m.birth }" placeholder="ex)1990-01-01" readonly><br>
						</div>
						

                        <div id="address-area">
                            <label for="address"  class="form-row" align="left">&nbsp;주소</label>
                            <div id="zip_code" class="form-inline">
                                <input type="text" class="form-control mb-2 mr-sm-2" id="sample6_postcode" name="zipCode" value="${ m.zipCode }" readonly style="width: 100px;">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn-address"  class="btn btn-primary mb-2" disabled>
                            </div>
                            <input type="text"  class="form-control" id="sample6_address" name="address" placeholder="주소" value="${ m.address }" readonly>
                            <div id="div-name"></div>
                            <input type="text"  class="form-control" id="sample6_extraAddress" name="addressExtra" placeholder="참고항목" value="${ m.addressExtra }" readonly>
                            <input type="text" class="form-control" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" value="${ m.addressDetail }" readonly>
                        </div>

                        <div class="form-row" id="content">
                            <label for="emrollDate">입사일</label>
                            <input type="date" class="form-control" id="enrollDate" name="enrollDate" value="${ m.enrollDate }" readonly><br>
                            
                            <label for="resignDate">퇴사일</label>
                            <input type="date" class="form-control" id="resignDate" name="resignDate" value="${ m.resignDate }" readonly><br>
                            
                            <c:choose>
	                       		<c:when test="${ m.status == 'Y' }">
					                <label for="status">회원 상태</label>
					                <input type="text" class="form-control" name="status" id="status" value="재직" readonly>
					                
					            </c:when>
					            <c:otherwise>
					            	<label for="status">회원 상태</label>
					                <input type="text"class="form-control" name="status" id="status" value="퇴직" readonly>
				                </c:otherwise>
			                </c:choose>
		                    
                        </div>
                        
                        
                        <div class="form-row" id="content">
                            <label for="department">부서</label>
                            <input type="text" class="form-control" id="department" name="department" value="${ m.department }" readonly><br>
                            
                            <label for="job">직책</label>
                            <input type="text" class="form-control" id="job" name="job" value="${ m.job }" readonly><br>
                            
                            <label for="rank">직급</label>
                            <input type="text" class="form-control" id="rank" name="rank" value="${ m.rank }" readonly><br>
                          	
                        </div>


                        <br><br>
                        
                                 
                        <div align="center">
                        	<button type="submit" class="btn btn-primary">삭제</button>
                        </div>
            			
					</form>
                </div>
            </div>


        </div>

    </div>
    </section>
</body>
</html>