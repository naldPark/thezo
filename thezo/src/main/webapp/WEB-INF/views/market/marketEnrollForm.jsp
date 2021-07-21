<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #enrollForm>table{width:80%;}
   #enrollForm>table *{ margin:5px;}
   .innerOuter{
        width: 1000px;
        margin:auto;
        padding:5% 5%;
        background:white;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<!-- api 적용문제 해결하기 -->
    <div class="outer">

        <div class="innerOuter">
            <h2><b>더조마켓</b></h2>
            <br><br>
            <div id="thumbnail"align="center">
                <img  id="titleImg"src="${ b.titleImg }" width="200" height="200"><br>
                <img id="contentImg1" width="150" height="120">
                <img id="contentImg2" width="150" height="120">
                <img id="contentImg3" width="150" height="120">
            </div>
            <br>


            <form id="enrollForm" method="post" action="" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">품명</label></th>
                        <td><input type="text" id="title" class="form-control" name="" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">가격</label></th>
                        <td><input type="text" id="title" class="form-control" name="" required placeholder="금액 입력"></td>
                    </tr>
                    <tr><!--에디터 api 적용하자-->
                        <th><label for="content">내용</label></th>
                        <th><div id="summernote"></div> </th>
                    </tr>
                    <tr>
                        <th><label for="upfile"></label></th>
                        <td>
                            <div id="file-area">
                                <input type="file" id="upfile" class="form-control-file border" name="file1"  onchange="loadImg(this, 1);" required>
                                <input type="file" id="upfile" class="form-control-file border" name="file2" onchange="loadImg(this, 2);">
                                <input type="file" id="upfile" class="form-control-file border" name="file3" onchange="loadImg(this, 3);">
                                <input type="file" id="upfile" class="form-control-file border" name="file4" onchange="loadImg(this, 4);">
                            </div>
                        </td>
                        
                    </tr>
                </table>

                <script>
            
                    $(function(){
                        $("#file-area").hide();
                        
                        $("#titleImg").click(function(){
                            $("#file1").click();
                        })
                        $("#contentImg1").click(function(){
                            $("#file2").click();
                        })
                        $("#contentImg2").click(function(){
                            $("#file3").click();
                        })
                        $("#contentImg3").click(function(){
                            $("#file4").click();
                        })
                    })
                
    
                    function loadImg(inputFile, num){
                        // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                        // num : 몇번째 input요소인지 확인 후 해당 그영역에 미리보기하기위해서
    
                        //console.log(inputFile.files.length);
                    
                        if(inputFile.files.length == 1){ 
                            // 선택된 파일이 존재할 경우 
                            // => 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
                            
                            // 파일을 읽어들일 FileReader 객체 생성
                            var reader = new FileReader();
                            
                            // 파일을 읽어들이는 메소드 => 해당 파일을 읽어들이는 순간 해당 그 파일만의 고유한 url 부여됨
                            reader.readAsDataURL(inputFile.files[0]);
                            
                            // 파일 읽기가 다 완료되었을 때 실행할 함수를 정의
                            reader.onload = function(e){
                                // 각 영역에 맞춰서 이미지 미리보기
                                switch(num){
                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                case 2: $("#contentImg1").attr("src", e.target.result); break;
                                case 3: $("#contentImg2").attr("src", e.target.result); break;
                                case 4: $("#contentImg3").attr("src", e.target.result); break;
                                }
                            }
                            
                        }else{ // 선택된 파일이 사라졌을 경우 => 미리보기 사라지게
                            switch(num){
                            case 1: $("#titleImg").attr("src", null); break;
                            case 2: $("#contentImg1").attr("src", null); break;
                            case 3: $("#contentImg2").attr("src", null); break;
                            case 4: $("#contentImg3").attr("src", null); break;
                            }
                        }
                        
                    }
                </script>

                
                <br>

            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <button type="submit" class="btn btn-secondary">등록</button>
                <button type="reset" class="btn btn-secondary">취소</button>
            </div><br><br>


            <script>
                $(document).ready(function() {
                        $('#summernote').summernote({
                            lang: 'ko-KR',
                            height: 300,
                        });
                        
                });
            </script>
            </div>
        
        

    </div>
  
	
</body>
</html>