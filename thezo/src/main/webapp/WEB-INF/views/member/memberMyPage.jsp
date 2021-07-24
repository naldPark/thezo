<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 주소 api-->
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
    #content{width:50%;}   /*얘를 뺄지 말지(주소)*/
    body{position:relative;}
	.container{position:absolute; top:30%; left:20%;}
	table tbody{cursor:pointer;}
	#sPhoto{border-radius:50%; object-fit:cover;}
    

</style>
</head>
<body>
	<!-- 사용자 내 정보 수정 페이지 : 이성경 -->
	<!-- 일단 주소 api 적용되는지만 확인 (화면은 나중에 붙이기)-->
	<!-- 주소 api적용은 되는데 입력이 안됨 -->
	<!-- 화면 손보기...ㅠㅠ엉망진창-->
	<jsp:include page="../common/header.jsp" />
	

    <div class="outer">

        <div class="innerOuter">
            <h2><b>내 정보 수정</b></h2>
            <br>

            <div id="content1">
                <h5>필수 입력 사항</h5>
              
                <div align="center" class="d-flex justify-content-center">
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="form-group d-flex justify-content-center">
                            <!-- 프로필 사진이 비어있지 않은 경우-->
                            <input type="hidden" name="path" value="path">
                            <input type="hidden" name="originName" value="origin">
                            <!-- if( 사진(사원정보) != null ){ 처리 }-->
                            <input id="reUpfile" type="file" name="reUpfile" onchange="loadImg(this);">
                            <img id="sPhoto" width="200" height="200" src="">
                        </div>
                        <div id="content" class="form-row">
                            <label for="userId" align="left">사원번호</label>
                            <input type="text" class="form-control" id="memNo" name="memNo" value="101" readonly><br>

                            <label for="userName">아이디</label>
                            <input type="text" class="form-control" id="memId" name="memId" value="user02" readonly><br>

                            <label for="userName">이름</label>
                            <input type="text" class="form-control" id="memName" name="memName" value="김춘식" readonly><br>

                            
                            <label for="userName">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="010-1111-2222"><br>

                            <label for="userName">이메일</label>
                            <input type="text" class="form-control" id="email" name="email" value="user02@thezo.com"><br>
                            
                            <label for="userName">생년월일</label>
                            <input type="date" class="form-control" id="memName" name="memName" value="1980-11-11"><br>
                        </div>    

                        <div id="address-area" class="col" align="center">
                            <div id="div-name">주소</div>
                            <input type="text" class="form-control" id="sample6_postcode" name="zipCode" placeholder="우편번호" required style="width: 50px;">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn-address" class="btn btn-primary btn-sm"><br>
                            <div style="width:130px; display:inline-block;"></div>
                            <input type="text"  class="form-control" id="sample6_address" name="addressS" placeholder="주소" required><br>
                            <div id="div-name"></div>
                            <input type="text" class="form-control" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" required>
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