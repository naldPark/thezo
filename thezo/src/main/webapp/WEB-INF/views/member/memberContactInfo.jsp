<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
			.pageTitle{font-size: 20pt; font-weight: bolder; color:rgb(241,196,15)!important; margin-top: 30px; margin-left: 20px; text-align: left; }
    		.pageTitle b{color: rgb(20,70,104); font-size: 25pt;}
			.input-group-text {width: 80px}
			ul,
			#apprOrgTree {list-style-type: none;}
			.currentList{list-style-type:none;}
			#apprOrgTree {
				font-size: 13pt;
				margin: 0;
				padding: 0;
				line-height: 2.3em;
			}		
			.box {
				cursor: pointer;
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
			}		
			.box::before {
				content: "\25B6";
				color: rgb(121, 121, 121);
				display: inline-block;
				margin-right: 6px;
			}		
			.line::before {
				content: "\268A";
				color: lightgray;
				display: inline-block;
				margin-right: 6px;
			}
			.check-box::before {
				-ms-transform: rotate(90deg);
				-webkit-transform: rotate(90deg);
				transform: rotate(90deg);
			}
			.nested { display: none;}
			.active {display: block;}
			label {  margin-bottom: 0rem !important;}
			#ceoCheck,#ceoCheck>label{cursor:pointer}
			#ceoCheck:hover, #ceoCheck>label:hover, .box:hover{
				cursor: pointer;
				background-color: lightgray;
			}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	<section>
		<div class="outer">
			<p class="pageTitle"> contact <b> 조직도(연락처)</b></p>
			<div class="row  justify-content-center">
				<br><br>
				<h3><i class="far fa-building"></i>조직도</h3>
				<hr>
				<div class="p-3" style=" width:300px;">
					<ul id="apprOrgTree">
						<li class="eachPerson" id="ceoCheck"></li>
						<ul>
							<li class="departmentLevel">
								<span class="box">경영관리본부</span>
								<ul class="nested">
									<li>
										<span class="box">인사팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">총무팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">회계팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="departmentLevel">
								<span class="box">개발본부</span>
								<ul class="nested">
									<li>
										<span class="box">개발1팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">개발2팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">인프라팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="departmentLevel">
								<span class="box">운영본부</span>
								<ul class="nested">
									<li>
										<span class="box">운영팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">영업팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
									<li>
										<span class="box">구매팀</span>
										<ul class="nested">
											<li></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</ul>
				</div>
				
				<div class="m-5">
					<div></div>
				</div>
					<div class="p-3" style="width:600px; border-left: 1px solid lightgrey;padding-left: 40px!important;">
						<br><br>
						<input class="form-control" id="searchInput" type="text" placeholder="검색어를 입력하세요"><br>
						<ul class="list-group" id="searchList">
							<c:forEach var="p" items="${ empList }" varStatus="status">
								<li class="w3-bar currentList list-group-item">
									<span onclick="this.parentElement.style.display='none'"
										class="w3-bar-item w3-button w3-xlarge w3-right">&times;</span>
									<c:choose>
										<c:when test="${!empty p.path}">
											<img src="${p.path}" class="w3-bar-item w3-circle"
												style=" max-width: 100px; max-height: 100px;overflow: hidden;">
										</c:when>
										<c:otherwise>
											<img src="resources/images/user.png" class="w3-bar-item w3-circle"
												style=" max-width: 100px; max-height: 100px;overflow: hidden;">
										</c:otherwise>
									</c:choose>
									<div class="w3-bar-item">
										<span class='employee' hidden>${p.department}</span>
										<span class='employee' hidden>${p.parentDep}</span>
										<span class="w3-large">${p.memName} ${p.rank} <c:if test="${!empty p.job}">(${p.job})</c:if></span><br>
										<span>${p.department}</span><br>
										<span><i class="far fa-envelope"></i> ${p.email}</span><br>
										<span><i class="fas fa-mobile-alt"></i> ${p.phone} ( <i class="fas fa-phone"></i> ${p.extensionNo}
											)</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

			</div>
			<!--모달 내 area 끝 -->
		</div>
	
		<script>
			$(document).ready(function(){
			  $("#searchInput").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				console.log($(this).text());
				$("#searchList li").filter(function() {
				  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			  });
			});
			</script>

<script>
	$(".box").click(function(){
		var value = $(this).text();
		$(".currentList").toggle(false);
		$(".employee").each(function(){
			if($(this).text()==value){
				$(this).parent().parent().toggle(true);
			}
		})
	});
	$("#ceoCheck").click(function(){
		$(".currentList").toggle(true);
	})
	</script>
	
	</section>
	<script>
	// 왼쪽 조직트리 클릭시 하위 조직 표시
	var toggler = document.getElementsByClassName("box");
	var i;
	for (i = 0; i < toggler.length; i++) {
	  toggler[i].addEventListener("click", function () {
		this.parentElement.querySelector(".nested").classList.toggle("active");
		this.classList.toggle("check-box");
	  });
	}
	// 조직트리 내 직원 리스트
	$(function () {
		$("#apprOrgTree").find(".box").each(function (index, el) {
		  <c:forEach var="p" items="${ empList }" varStatus="status">
			if("대표이사"=="${p.department}"){
			  var ceoInfo="<label><input type='checkbox' style='display:none' value='${p.memNo}'/> ${p.memName} 대표이사</label>";
			  $("#ceoCheck").html(ceoInfo);
			}
			if($(this).text()=="${p.department}"){                  
			  if($(this).text().includes("본부")){
				var temp=$(this).next();
				$("<li class='eachPerson'><label><span class='employee' hidden>${p.email}</span>${p.memName} ${p.rank} <c:if test='${!empty p.job }'>(${p.job})</c:if></label></li>").prependTo(temp);
			  } else {
				var temp=$(this).parent().find("ul");
				  $("<li class='eachPerson'><label> ${p.memName} ${p.rank} <c:if test='${!empty p.job }'>(${p.job})</c:if> </label></li>").appendTo(temp);
			  }                    
			}
		  </c:forEach>
		})
	})
</script>
</body>
</html>