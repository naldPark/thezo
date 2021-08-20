<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
    .outer-wrap{height: 200px;}
    .sub-menu{float: left; width: 30%; height: 100%;}
    #sub-name{
        width: 80%;
        text-align: left;
        margin-top: 10%;
        margin-left: 10%;
        float: left;
        font-weight: bold;
        font-size: 30px;  
    }
    .content{height: 800px;}
    /*기본적으로 적용해야할 스타일*/
    
    .form-check{margin-left: 0% !important; position: static !important; margin-top: 0% !important; padding-left: 0% !important;}
    .form-check-input{margin-left: 20% !important; position: static !important; margin-top: 0% !important; padding-left: 0% !important;}
    #dept-table{width: 70%; margin-top: 10%;}
    #dept-table a{font-weight: 400; color: black;}
    #dept-table tr, #dept-table td, #dept-table th{border-bottom: 1px solid rgb(177, 177, 177); text-align: center;}
    #dept-table th{background-color: lightgray;}
    #deletebtn{float: left; margin-left: 15%; margin-top: 20%;}
    #createbtn{float: right; margin-right: 15%; margin-top: 20%;}
    #pagingArea{width:fit-content; margin-top: 30px;}
    .modal-lg{max-width: 320px !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}

    .dept-modal{color:black; text-decoration: none;}
    #myModalheader{background-color: rgb(94,94,94);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    #dept-form{
        font-weight: bold;
        width: 100%;
    }
    #no_check{height: 23px;}
    #dept-form td input[type="text"], #dept-form td input[type="number"]{text-align: right;}
    #codeUse, #codecUse{font-size: 13px;}

	#dept_add, #cancel, #dept_modi, #cancel2 {border: none; background-color:transparent;}
	#dept_add:hover, #cancel:hover, #dept_modi:hover, #cancel2:hover {font-weight: bold;}
    .modal-footer{font-size: 13px;}
    .modal-footer>a:hover{text-decoration: none; font-weight: bold;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		$(function(){
			var adminNav = document.getElementById("admin-header");
			$("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
		})
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>
    <section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="fas fa-building"></i> 부서관리</div>
                </div>
            </div>
            <div class="content form-check">
                <div class="content-table">
                    <table id="dept-table">
                        <thead>
                            <tr>
                                <th width="17%">부서코드</th>
                                <th width="17%">부서명</th>
                                <th width="17%">부서순위</th>
                                <th width="17%">상위부서</th>
                                <th width="17%">상위부서순위</th>
                                <th width="10%">사용구분</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="d" items="${ list }">
	                            <tr>
	                                <td style="text-align: center;"><a class="dept-code" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#deptcode-modal">${ d.depNo }</a></td>
	                                <td style="text-align: center;">${ d.depName }</td>
	                                <td>${ d.depClass }</td>
	                                <td>${ d.parentDep }</td>
	                                <td>${ d.parDepclass }</td>
	                                <td>
	                                	<c:choose>
	                                		<c:when test="${ d.depStatus == 'Y' }">
	                                			사용
	                                		</c:when>
	                                		<c:otherwise>
	                                			미사용
	                                		</c:otherwise>
	                                	</c:choose>
	                                </td>
	                            </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <button id="createbtn" class="btn btn-secondary dept-modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#dept-modal">신규등록</button>
                    
                    <!-- 페이징바 -->
                    <div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
				                   		<li class="page-item disabled"><a class="page-link">Previous</a></li>
				                    </c:when>
				                    <c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="adminDept.ma?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			                    	</c:otherwise>
			                    
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    			<li class="page-item"><a class="page-link" href="adminDept.ma?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <li class="page-item disabled"><a class="page-link">Next</a></li>
				                </c:when>
				                <c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="adminDept.ma?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                </c:otherwise>    
				            </c:choose>        
		                </ul>
		            </div>
			               
			      <br clear="both"><br>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- 부서등록 모달-->
    <div class="modal fade" id="dept-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 부서 등록</div>
                </div>
                    <form action="deptAdd.dept" method="post" id="deptAdd">
						<div class="modal-body">
					        <div id="dept-form">
					            <table>
					                <tr>
					                    <th width="130px">부서 코드</th>
					                    <td width="180px">
					                        <div class="input-group mb-3" style="margin-bottom: 0% !important;">
					                            <input type="text" name="depNo" id="depNo" class="form-control form-control-sm" required>
					                            <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon" onclick="noCheck();">중복여부</button>
					                        </div>
											<span id="no_check"></span>                                        
					                    </td>
					             	</tr>
			                      	<tr>
			                          	<th>부서명</th>
			                          	<td><input type="text" name="depName" class="form-control form-control-sm" required></td>
				                    </tr>
			                      	<tr>
			                          	<th>부서순위</th>
			                          	<td><input type="number" name="depClass" class="form-control form-control-sm" required></td>
			                      	</tr>
			                      	<tr>
			                          	<th>상위부서</th>
			                          	<td><input type="text" name="parentDep" class="form-control form-control-sm"></td>
			                      	</tr>
			                      	<tr>
	                          			<th>상위부서순위</th>
			                          	<td><input type="number" name="parDepclass" class="form-control form-control-sm"></td>
				                      </tr>
				                      <tr>
			                          	<th>사용여부</th>
			                          	<td>
				                           	<select id="codeUse" class="form-select" name="depStatus">
				                           		<option value="used" selected>사용</option>
					                           	<option value="unused">미사용</option>
				                           	</select>
			                          	</td>
			                      	</tr>
			                  </table>
			              </div>
				      </div>
				      <div class="modal-footer">
				          <button type="submit" id="dept_add" style="color: rgb(26,188,156);">등록</button>&nbsp;
				          <button type="button" id="cancel" data-dismiss="modal" style="color: lightslategray;">취소하기</button>
					</div>
                </form>
            </div>
        </div>
    </div>
    <!-- 부서수정 모달-->
    <div class="modal fade" id="deptcode-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 부서 수정</div>
                </div>
                    <form action="deptModi.dept" method="post">
		                <div class="modal-body">
	                        <div id="dept-form">
	                        	<table>
	                                <tr>
	                                    <th width="130px">부서 코드</th>
	                                    <td width="150px">
	                                    	<div class="input-group mb-3" style="margin-bottom: 0% !important;">
					                            <input type="text" id="depNo2" name="depNo" class="form-control form-control-sm" readonly>
					                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>부서명</th>
	                                    <td><input type="text" id="depName2" name="depName" class="form-control form-control-sm"></td>
	                                </tr>
	                                <tr>
	                                    <th>부서순위</th>
	                                    <td><input type="number" id="depClass2" name="depClass" class="form-control form-control-sm"></td>
	                                </tr>
	                                <tr>
	                                    <th>상위부서</th>
	                                    <td><input type="text" id="parentDep2" name="parentDep" class="form-control form-control-sm"></td>
	                                </tr>
	                                <tr>
	                                    <th>상위부서순위</th>
	                                    <td><input type="number" id="parDepclass2" name="parDepclass" class="form-control form-control-sm"></td>
	                                </tr>
	                                <tr>
	                                    <th>사용여부</th>
	                                    <td>
		                                    <select id="codecUse" class="form-select" name="depStatus">
		                                    	<option value="used">사용</option>
		                                    	<option value="unused">미사용</option>
		                                    </select>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
		                </div>
		                <div class="modal-footer">
		                    <button type="submit" id="dept_modi" style="color: rgb(26,188,156);">수정</button>&nbsp;
		                    <button type="button" id="cancel2" data-dismiss="modal" style="color: lightslategray;">취소하기</button>
		                </div>
                </form>
            </div>
        </div>
    </div>
    <!--모달 기능-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function(){
            $('.modal-dialog').draggable({
                "handle":".modal-header"
            });
        });
        
        $(document).on("click", ".dept-code", function(){
        	var depNo = $(this).text();
        	var depName = $(this).parent().next().text();
        	var depClass = $(this).parent().next().next().text();
        	var parentDep = $(this).parent().next().next().next().text();
        	var parDepclass = $(this).parent().next().next().next().next().text();
        	var depStatus = $(this).parent().next().next().next().next().next().text();
        	
        	$(".modal-body #depNo2").val( depNo );
        	$(".modal-body #depName2").val( depName );
        	$(".modal-body #depClass2").val( depClass );
        	$(".modal-body #parentDep2").val( parentDep );
        	$(".modal-body #parDepclass2").val( parDepclass );
        	if(depStatus.trim() == "사용"){
        		$("#codecUse").val('used').prop("selected",true);
        	}else{
        		$("#codecUse").val('unused').prop("selected",true);
        	}
        })
        
              
        //부서 코드 중복 조회 기능
        function noCheck(){
        	
        	var depNo = $("#depNo").val();
        	
        	$.ajax({
        		url:"noCheck.dep",
        		type:"post",
        		data: {"depNo":depNo},
        		success:function(checkNo){
        			if(checkNo == 0){ // 사용가능
        				$("#no_check").css("margin-bottom", "16px");
        				$("#no_check").css("font-size", "12px");
        				$("#no_check").css("color", "#7BC379");
        				$("#no_check").text("사용가능한 부서번호입니다.");
        				$("#dept_add").removeAttr("disabled");
        			}else{  	     // 사용불가능
        				$("#no_check").css("margin-bottom", "16px");
        				$("#no_check").css("font-size", "12px");        			
        				$("#no_check").css("color", "red");
        				$("#no_check").text("사용중인 부서코드입니다.");
        				$("#dept_add").attr("disabled", "true");
        			}
        		},error:function(){
        			console.log("부서코드중복체크용 ajax 통신실패");
        		}
        	});
        }
    </script>
		
		
		
</body>
</html>