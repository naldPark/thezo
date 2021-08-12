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
    #content , #address-area, #department{width:50%;}
    #department>table{width: 100%;}

    body{position:relative;}
	.container{position:absolute; top:30%; left:20%;}
	table tbody{cursor:pointer;}
	#sPhoto{border-radius:50%; object-fit:cover;}
    
</style>
</head>
<body>

	<!-- 관리자 : 사원 수정 (이성경) -->

	<jsp:include page="../common/header.jsp" />
	
	<script>	
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>
	<section>
		
	
    <div class="outer">
		<br><br><br><br>
        <div class="innerOuter">
            <h2><b>사원 수정</b></h2>
            <br>

            <div id="content1">

                <div align="center" class="d-flex justify-content-center">
                    <form action="adMemberUpdate.me" method="post" enctype="multipart/form-data">
                        <div class="form-group d-flex justify-content-center">
							<c:choose>
								<c:when test="${ m.originName == null }">
	                        		<img style="width: 200px;border-radius:50%; object-fit:cover;" id="preview-image" src="resources/images/userProfile.png">
	                        		<input style="display: block;" type="file" id="input-image" name="reupfile">
	                        	</c:when>
	                        	<c:otherwise>
	                        		<img style="width: 200px;border-radius:50%; object-fit:cover;" id="preview-image" src="resources/uploadFiles/${ m.originName }">
	                        		<input style="display: block;" type="file" id="input-image" name="reupfile">
	                        	</c:otherwise>
	                        </c:choose>	
                        </div>
                        
                        <script type="text/javascript">
					        $(function(){
					            
					            $("#input-image").hide();
					            $("#preview-image").click(function(){
					                $("#input-image").click();
					            })
					        });
				        
					        function readImage(input) {
					            // 인풋 태그에 파일이 있는 경우
					            if(input.files && input.files[0]) {
					                // 이미지 파일인지 검사 (생략)
					                // FileReader 인스턴스 생성
					                const reader = new FileReader()
					                // 이미지가 로드가 된 경우
					                reader.onload = e => {
					                    const previewImage = document.getElementById("preview-image")
					                    previewImage.src = e.target.result
					                }
					                // reader가 이미지 읽도록 하기
					                reader.readAsDataURL(input.files[0])
					            }
					        }
					        // input file에 change 이벤트 부여
					        const inputImage = document.getElementById("input-image")
					        inputImage.addEventListener("change", e => {
					            readImage(e.target)
					        })
				        </script>
                        
                        
                        
                        <div id="content" class="form-row">
                            <label for="memNo" align="left">사원번호</label>
                            <input type="text" class="form-control" id="memNo" name="memNo" value="${ m.memNo }" readonly><br>

                            <label for="memId">아이디</label>
                            <input type="text" class="form-control" id="memId" name="memId" value="${ m.memId }" readonly><br>

                            <label for="memName">이름</label>
                            <input type="text" class="form-control" id="memName" name="memName" value="${ m.memName }"><br>
						</div>
						
						 
                       <div id="content" class="form-row">
	                       	<label for="gender">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
	                       	<c:choose>
	                       		<c:when test="${ m.gender == 'M' }">
					                <div class="form-check-inline">
					                	<label class="form-check-label">
					                    	<input type="radio" class="form-check-input" name="gender" id="Male" value="M" checked required>남자
					                    </label>
					                    <label class="form-check-label">
					                        <input type="radio" class="form-check-input" name="gender" id="Female" value="F" required>여자
					                    </label><br>
					                </div>   
					            </c:when>
					            <c:otherwise>
					                <div class="form-check-inline">
					                	<label class="form-check-label">
					                    	<input type="radio" class="form-check-input" name="gender" id="Male" value="M" required>남자
					                    </label>
					                    <label class="form-check-label">
					                        <input type="radio" class="form-check-input" name="gender" id="Female" value="F" checked required>여자
					                    </label><br>
					                </div>   
				                </c:otherwise>
			                </c:choose>
                       </div>  
                       
                            

						
						<div id="content" class="form-row">
							<label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${ m.phone }" required><br>
                            	
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email" value="${ m.email }" required><br>
                            
                            <label for="birth">생년월일</label>
                            <input type="text" class="form-control" id="birth" name="birth"  value="${ m.birth }" placeholder="ex)1990-01-01" required><br>
						</div>
						
						
						
						

                        <div id="address-area">
                            <label for="address"  class="form-row" align="left">&nbsp;주소</label>
                            <div id="zip_code" class="form-inline">
                                <input type="text" class="form-control mb-2 mr-sm-2" id="sample6_postcode" name="zipCode" value="${ m.zipCode }" required style="width: 100px;">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn-address"  class="btn btn-primary mb-2">
                            </div>
                            <input type="text"  class="form-control" id="sample6_address" name="address" placeholder="주소" value="${ m.address }" required>
                            <div id="div-name"></div>
                            <input type="text"  class="form-control" id="sample6_extraAddress" name="addressExtra" placeholder="참고항목" value="${ m.addressExtra }">
                            <input type="text" class="form-control" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" value="${ m.addressDetail }" >
                        </div>

                        <div class="form-row" id="content">
                            <label for="emrollDate">입사일</label>
                            <input type="date" class="form-control" id="enrollDate" name="enrollDate" value="${ m.enrollDate }" required><br>
                            <label for="resignDate">퇴사일</label>
                            <input type="date" class="form-control" id="resignDate" name="resignDate" value="${ m.resignDate }"><br>
                            
                          	<label for="status">회원 상태</label>
		                    	<select class="form-control" name="status" id="status">
		                            <option value="Y">Y</option>
		                            <option value="N">N</option>
		                        </select>
                        </div>
                       
                        <div id="department">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">부서</label>
                                            <select class="form-control" name="department" style="width: 100%;" id="department" required>
                                              <option>인사팀</option>
                                              <option>총무팀</option>
                                              <option>회계팀</option>
                                              <option>개발1팀</option>
                                              <option>개발2팀</option>
                                              <option>인프라팀</option>
                                              <option>운영팀</option>
                                              <option>영업팀</option>
                                              <option>구매팀</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><!--직책을 따로..? 만들어야하나..?-->
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1">직책</label>
                                            <select class="form-control" name="job" id="job" align="center">
                                                <option></option>
                                                <option>팀장</option>
                                                <option>본부장</option>
                                                <option>대표이사</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">직급</label>
                                            <select class="form-control" name="rank"  id="rank" align="center">
                                                <option>사원</option>
                                                <option>대리</option>
                                                <option>과장</option>
                                                <option>부장</option>
                                                <option>상무</option>
                                                <option>대표이사</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="extensionNo">내선번호</label>
                                        <input type="text" class="form-control" id="extensionNo" name="extensionNo" value="${ m.extensionNo }"><br>
                                    </td>
                                </tr>
                            </table>
                            
                            <script>
                            	$(function(){
                            		var department = "${ m.department }"
                            		var job = "${ m.job }"
                            		var rank = "${ m.rank }"
                            		
                            		$("#department option").each(function(indext,e){
                            			if(department.indexOf($(this).val()) != -1){
                            				$(this).prop("selected",true);
                            			}
                            		})
                            		$("#job option").each(function(index,e){
                            			if(job.indexOf($(this).val()) != -1){
                            				$(this).prop("selected",true);
                            			}
                            		})
                            		$("#rank option").each(function(index,e){
                            			if(rank.indexOf($(this).val()) != -1){
                            				$(this).prop("selected",true);
                            			}
                            		})
                            
                            </script>
                            
                        </div>


                        <br><br>
                                    
                        <div align="center">
                            <button type="submit" class="btn btn-primary">수정</button>
                        </div>
                                    
                    </form>

                </div>
            </div>


            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>




        </div>

    </div>
    </section>
</body>
</html>