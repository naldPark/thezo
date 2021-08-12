<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    #pwdcontent, #content , #address-area, #department{width:50%;}

    #department>table{width: 100%;}


    body{position:relative;}
	.container{position:absolute; top:30%; left:20%;}
	table tbody{cursor:pointer;}
</style>
</head>
<body>

	<!-- 관리자 : 사원 등록 (이성경)  -->
	<jsp:include page="../common/header.jsp" />
	
	<script>
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>
	
	<section>
	
    <div class="outer">
		<br><br><br><br>
        <div class="innerOuter">
            <h2><b>사원 등록</b></h2>
            <br>

            <div id="content1">

                <div align="center" class="d-flex justify-content-center">
                
                    <form action="memberEnroll.me" id="enrollForm" method="post" enctype="multipart/form-data">
                        <div class="form-group d-flex justify-content-center">
                            <img style="width: 200px;border-radius:50%; object-fit:cover;" id="preview-image" src="resources/images/userProfile.png">
				    		<input style="display: block;" type="file" id="input-image" name="upfile">
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
                        	<label for="memId">아이디</label>
                            <input type="text" class="form-control" id="memId" name="memId" required><br>
                            <div id="checkResult"  display:none"></div><br>
                        </div>
                        	
                        <div id="content" class="form-row">
                            <label for="memName">이름</label>
                            <input type="text" class="form-control" id="memName" name="memName" required><br>
						</div>
						
						<div id="pwdcontent" class="form-row">
							<label for="memPwd">비밀번호</label>
                            <input type="password" class="form-control" id="memPwd" name="memPwd" required><br>

                            <label for="checkPwd">비밀번호 확인</label>
                            <input type="password" class="form-control" id="checkPwd"" required><br>
                            
                            <div id="checkPwdResult"  display:none"></div><br>
						</div>
						<script>
						    $('#pwdcontent').focusout(function () {
						        var pwd1 = $("#memPwd").val();
						        var pwd2 = $("#checkPwd").val();
						  
						        if ( pwd1 != '' && pwd2 == '' ) {
						            null;
						        } else if (pwd1 != "" || pwd2 != "") {
						            if (pwd1 == pwd2) {
						            	$("#checkPwdResult").show();
		    							$("#checkPwdResult").css("color", "green").text("비밀번호가 일치합니다.");  
						            } else {
						                // 비밀번호 불일치 이벤트 실행
						            	$("#checkPwdResult").show();
		    							$("#checkPwdResult").css("color", "red").text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");  
						            }
						        }
						    });   
						</script>                            
                       
                       
                       
                       <div id="content" class="form-row">
	                       	<label for="gender">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
	                        <div class="form-check-inline">
	                             <label class="form-check-label">
	                             	<input type="radio" class="form-check-input" name="gender" id="Male" value="M" required>남자
	                             </label>
	                        </div>
	                        <div class="form-check-inline">
	                             <label class="form-check-label">
	                                <input type="radio" class="form-check-input" name="gender" id="Female" value="F" required>여자
	                             </label><br>
	                        </div>
                       </div>  
                         
                            

						
						<div id="content" class="form-row">
							<label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" required><br>
                            	
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email" required><br>
                            
                            <label for="birth">생년월일</label>
                            <input type="text" class="form-control" id="birth" name="birth" placeholder="ex)1990-01-01" required><br>
						</div>
                           
                        <div id="address-area">
                            <label for="address"  class="form-row" align="left">&nbsp;주소</label>
                            <div id="zip_code" class="form-inline">
                                <input type="text" class="form-control mb-2 mr-sm-2" id="sample6_postcode" name="zipCode" placeholder="우편번호" required style="width: 100px;">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn-address"  class="btn btn-primary mb-2">
                            </div>
                            
                            <input type="text"  class="form-control" id="sample6_address" name="address" placeholder="주소" required>
                            <div id="div-name"></div>
                            <input type="text"  class="form-control" id="sample6_extraAddress" name="addressExtra" placeholder="참고항목" >
                            <input type="text" class="form-control" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" >
                        </div>

                        <div class="form-row" id="content">
                            <label for="enroll_date">입사일</label>
                            <input type="date" class="form-control" id="enrollDate" name="enrollDate" required><br>
                        </div>

                        <div id="department">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">부서</label>
                                            <select class="form-control" name="department" id="sel1" required>
                                              <option value="인사팀"'>인사팀</option>
                                              <option value="총무팀">총무팀</option>
                                              <option value="회계팀">회계팀</option>
                                              <option value="개발1팀">개발1팀</option>
                                              <option value="개발2팀">개발2팀</option>
                                              <option value="인프라팀">인프라팀</option>
                                              <option value="운영팀">운영팀</option>
                                              <option value="영업팀">영업팀</option>
                                              <option value="구매팀">구매팀</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1">직책</label>
                                            <select class="form-control" name="job" id="sel1" style="width: 90%;" align="center">
                                                <option></option>
                                                <option value="팀장">팀장</option>
                                                <option value="본부장">본부장</option>
                                                <option value="대표이사">대표이사</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">직급</label>
                                            <select class="form-control" name="rank" id="sel1" style="width: 90%;" align="center">
                                                <option value="사원">사원</option>
                                                <option value="대리">대리</option>
                                                <option value="과장">과장</option>
                                                <option value="부장">부장</option>
                                                <option value="상무">상무</option>
                                                <option value="대표이사">대표이사</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="extensionNo">내선번호</label>
                                        <input type="number" class="form-control" id="extensionNo" name="extensionNo"><br>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <br><br>
                                    
                        <div align="center">
                            <button type="submit" class="btn btn-primary" disabled>등록</button>
                            <button type="reset" class="btn btn-secondary"> 초기화</button>
                        </div>
                                    
                    </form>

                </div>
            </div>
            
            <script>
		    	$(function(){
		    		// 아이디 입력하는 input요소객체
		    		var $idInput = $("#enrollForm input[name=memId]");
		    		
		    		$idInput.keyup(function(){
		    			//console.log($idInput.val());
		    			
		    			// 우선 최소 5글자 이상으로 입력했을때만 ajax요청해서 중복체크 하도록
		    			if($idInput.val().length >= 5){
		    				
		    				$.ajax({
		    					url:"idCheck.me",
		    					data:{checkId:$idInput.val()},
		    					success:function(result){
		    						
		    						if(result == "NNNNN"){ // 사용불가능
		    							// => 빨간색 메세지(사용불가능) 출력
		    							$("#checkResult").show();
		    							$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 다시 입력해주세요.");    							
		    							// => 버튼 비활성화
		    							$("#enrollForm :submit").attr("disabled", true);
		    							
		    						}else{ // 사용가능
		    							// => 초록색 메세지(사용가능) 출력
		    							$("#checkResult").show();
		    							$("#checkResult").css("color", "green").text("사용가능한 아이디입니다.");
		    							// => 버튼 활성화
		    							$("#enrollForm :submit").removeAttr("disabled");
		    						}
		    						
		    					},error:function(){
		    						console.log("아이디 중복체크용 ajax 통신 실패");
		    					}
		    				}); 				
		    				
		    				
		    			}else{
		    				// 메세지 보여지지 않고, 버튼 비활성화
		    				$("#checkResult").hide();
		    				$("#enrollForm :submit").attr("disabled", true);
		    			}
		    			
		    		})
		    		
		    	})
		    </script>
            
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