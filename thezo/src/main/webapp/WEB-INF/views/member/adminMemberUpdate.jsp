<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 관리자 : 사원 수정 (이성경) -->

	<jsp:include page="../common/header.jsp" />
	
	<script>
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>

    <div class="outer">

        <div class="innerOuter">
            <h2><b>사원 수정</b></h2>
            <br>

            <div id="content1">

                <div align="center" class="d-flex justify-content-center">
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="form-group d-flex justify-content-center">
                            <!-- 프로필 사진이 비어있지 않은 경우-->
                            <input type="hidden" name="path" value="path">
                            <input type="hidden" name="originName" value="origin">
                            <!-- if( 사원정보 != null ){ 처리 }-->
                            <input id="reUpfile" type="file" name="reUpfile" onchange="loadImg(this);">
                            <img id="sPhoto" width="200" height="200" src="">
                        </div>
                        <div id="content" class="form-row">
                            <label for="memNo" align="left">사원번호</label>
                            <input type="text" class="form-control" id="memNo" name="memNo" value="101" readonly><br>

                            <label for="memId">아이디</label>
                            <input type="text" class="form-control" id="memId" name="memId" value="user01" readonly><br>

                            <label for="memName">이름</label>
                            <input type="text" class="form-control" id="memName" name="memName" value="김춘식"><br>

                            <label for="gender">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="form-check-inline">
                                <label class="form-check-label">
                                  <input type="radio" class="form-check-input" name="gender" id="Male" value="M">남자
                                </label>
                              </div>
                              <div class="form-check-inline">
                                <label class="form-check-label">
                                  <input type="radio" class="form-check-input" name="gender" id="Female" value="F">여자
                                </label>
                            </div>

                            <label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="010-1111-2222" required><br>

                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email"  value="user02@thezo.com" required><br>
                            
                            <label for="birth">생년월일</label>
                            <input type="date" class="form-control" id="birth" name="birth" value="1980-11-11" required><br>
                        </div>    

                        <div id="address-area">
                            <label for="address"  class="form-row" align="left">&nbsp;주소</label>
                            <div id="zip_code" class="form-inline">
                                <input type="text" class="form-control mb-2 mr-sm-2" id="sample6_postcode" name="zipCode"  value="01342" required style="width: 100px;">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn-address"  class="btn btn-primary mb-2"><br>
                            </div>
                            <div style="width:130px; display:inline-block;"></div>
                            <input type="text"  class="form-control" id="sample6_address" name="addressS" value="서울시 강남" required>
                            <div id="div-name"></div>
                            <input type="text" class="form-control" id="sample6_detailAddress" name="addressDetail" value="kh"required>
                        </div>

                        <div class="form-row" id="content">
                            <label for="birth">입사일</label>
                            <input type="date" class="form-control" id="enrollDate" name="enrollDate" value="2014-11-11" required><br>
                        </div>

                        <div id="department">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">부서</label>
                                            <select class="form-control" id="sel1" required>
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
                                            <select class="form-control" id="sel1" style="width: 90%;" align="center">
                                                <option></option>
                                                <option>팀장</option>
                                                <option>본부장</option>
                                                <option>대표이사</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group" class="form-row" align="left">
                                            <label for="sel1" align="left">부서</label>
                                            <select class="form-control" id="sel1" style="width: 90%;" align="center">
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
                                        <input type="text" class="form-control" id="extensionNo" name="extensionNo"><br>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <br><br>
                                    
                        <div align="center">
                            <button type="submit" class="btn btn-primary">수정</button>
                        </div>
                                    
                    </form>

                </div>
            </div>


            <script>
                $(function(){
                   
                    $("#reUpfile").hide();
                    $("#sPhoto").click(function(){
                        $("#reUpfile").click();
                    })
                });
                function loadImg(inputFile){
                    if(inputFile.files.length == 1){
                        var reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0])
                        reader.onload = function(e){
                            $("#sPhoto").attr("src", e.target.result).show();
                        }
                    } else {
                        $("#sPhoto").attr("src", null);
                    }
                }
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
</body>
</html>