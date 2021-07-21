<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	
	

    <div class="outer">
        <div class="innerOuter">
            <h2><b>더조마켓</b></h2>

            <div align="center">
                <a href="">찜하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="" data-toggle="modal" data-target="#reportForm">신고</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">삭제</a> <!-- 글작성자만 보이게-->
            </div>
            <br>
            <div id="thumbnail"align="center">
                <p style="color: green;">판매중</p><br>
                <img src="${ b.titleImg }" width="200" height="200"><br>
                머그컵<br>
                <p style="color: rebeccapurple;">15000원</p>
                <div>
                    <table width="200">
                        <tr>
                            <td rowspan="2" align="center"><img src="${ m.titleImg }" width="50" height="50"></td>
                            <td>user01</td>
                        </tr>
                        <tr>
                            <td>영업팀 김하하 대리</td>
                        </tr>
                    </table>
                    <br>
                    <p style="font-size: small;">
                        작성일 : 2021-08-21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        조회수 : 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        찜 : 1 <!-- 찜: 하트이미지 바꾸기-->
                    </p>
                </div>
                <hr width="700">
            </div>
            <div class="content" align="center">
                <p >좀 깨졌지만 쓸만해용</p>
            </div>
            <div align="center"><a class="btn btn-primary" href="">거래하기</a></div>
            <br>
           <div class="imgs" align="center">
            <img src="${ b.titleImg }" width="200" height="200">
            <img src="${ b.titleImg }" width="200" height="200">
            <img src="${ b.titleImg }" width="200" height="200">
            <hr width="700">
           </div>
           <br>
           <table id="replyArea" class="table-borderless" align="center">
                <thead>
                    <tr>
                        <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                    </tr>
                    <tr>
                        <th>user02</th>
                        <td>댓글입니다.너무웃기다앙</td>
                        <td>2020-04-10</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>많이봐주세용</td>
                        <td>2020-04-08</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다ㅋㅋㅋ</td>
                        <td>2020-04-02</td>
                    </tr>
                </thead>
                
                <tbody>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle">&nbsp;&nbsp;<button class="btn btn-secondary">등록하기</button></th>
                    </tr>
                </tbody>
            </table>
            <br><br><br>


            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <a class="btn btn-secondary" href="">목록</a>
                <a class="btn btn-secondary" href="">수정</a>
            </div>
        
            <br><br>

            <!-- 신고하기 버튼 클릭시 보여질 Modal -->
					<div class="modal" id="reportForm">
                        <div class="modal-dialog">
                          <div class="modal-content">
                      
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">신고하기</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                      
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                                  <form action="" method="post">
                                   <!-- 신고할 내용 입력 -->
                                       <input type="hidden" name="userId" value="">
                                       <input type="hidden" name="boardType" value="">  <!-- 컬럼명확인 -->
                                       <input type="hidden" name="boardNo" value="">
                                       
                                       <b>신고 구분</b><br>
                                       <select id="rpSection" name="rpSection">
                                           <option value="욕설">욕설/비방</option>
                                           <option value="음란">음란/유해</option>
                                           <option value="도배">도배/스팸</option>
                                       </select>
                                       <br><br>
                                       <b>신고 내용 입력</b><br><br>
                                       <textarea name="rpContent" id="rpContent" cols="50" row="1" style="resize:none"></textarea><br><br>
                                      <button type="submit" class="btn btn-danger btb-sm">신고하기</button>
                                 
                                  </form>
                             </div>
              
                            </div>
                           </div>
                          
                      </div>   


        </div>


    </div>
  
	
	
</body>
</html>