<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
	.notification-innerline button{ width: 80px; height: 28px; color: white; font-size: 12px; font-weight: bold; margin-top: 10px; margin-left: 30% ; border: none; border-radius: 3px; transform: translate(-50%); background-color: rgb(52,152,219);}
	.notification-innerline button:hover{ border: 1px solid rgb(243,156,18); color: rgb(243,156,18);}
	.notification-innerline .skipUnreadNf{
		background:lightgray;
		margin-left: 0px ; 
		transform: translate(0%);
		display: inline-block;
		color: black;
	}
	/*  ↑  건들지 않아도됨 */
	
	/* 구현할 영역!! */
	#notification-mainbox{width: 300px; max-height: 610px; margin: auto; font-family:'Noto Sans KR', sans-serif; background-color: white; overflow: auto;}
	#notification-mainbox:hover{cursor:default;}
	#notification-mainbox::-webkit-scrollbar {width: 10px;}
	#notification-mainbox::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(241,197,7);}
	#notification-mainbox::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: lightgrey;}
	.notification-outerbox{width: 100%; margin-bottom: 5px; border: 2px solid white;}
	.nf-header{width: 100%; height: 40px; line-height: 40px; background-color: rgb(250, 205, 133);}
	.nf-header>i{color: white; font-size: 30px; margin-left: 20px;}
	.nf-header>span{font-size: 24px; font-weight:bolder; padding-left: 40px;}	
	.nf-body{padding: 10px;}
	.nf-body pre{margin: 0px; font-family:'Noto Sans KR', sans-serif;}
</style>

</head>
<body>
	<script>
		$(function(){
		 	$.ajax({
		 		url:"unreadNf.nf",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(unreadNf){
		 			//console.log(unreadNf);
		 			var value ="";
		 			for(var i in unreadNf){
		 				value += '<div class="notification-outerbox">'
		 				       + '<div class="nf-header">'
		 				       + '<i class="fas fa-lightbulb"></i>' + '<span>'
		 				       + unreadNf[i].nfDeptName
		 				       + ' 알림 </span>'
		 				       + '<input type="hidden" name="myUnreadNfNo" value="'
		 				       + unreadNf[i].nfNo
		 				       + '"></div>'
		 				       + '<div class="nf-body">'
		 				       + '<p>일정 : <span> '
		 				       + unreadNf[i].nfStartDate
		 				       + ' ~ '
		 				       + unreadNf[i].nfEndDate
		 				       + '</span></p>'
		 				       + '<pre>'
		 				       + unreadNf[i].nfContent
		 				       + '</pre></div></div>'
		 			}
					$("#notification-mainbox").html(value);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
		})
	</script>
	

	<div id="notification-mainbox">
		<!-- 동적으로 값들이 생성되야 한다.  -->
	</div>
	<button type="button" onclick="updateNfReadStatus();">알림 확인</button>
	<button type="button" class="skipUnreadNf" onclick="invalidateUnreadNf();">다음에 보기</button>

	<!-- ajax scrpit 영역 -->
	<script>
		function invalidateUnreadNf(){
		 	$.ajax({
		 		url:"skipUnreadNf.nf",
		 		success:function(result){
		 			//console.log(result)
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
			$(".notification-outer").css("display","none");
		}

	
		// 나중에 ! ajax 처리하고 실행한 스크립트
		function updateNfReadStatus(){
			// 여기서 !!! session에 AJax 통신하면서 ! session에 담겨있는 unreadNotification 이것도 같이 날려 버려야한다! 
			var  noOfNf = $("#notification-mainbox input:hidden[name=myUnreadNfNo]");
            var multiVal = []; 
            noOfNf.each(function(){
                var item = $(this).val();
                multiVal.push(item)
            })
			//console.log(multiVal);			
	
		 	$.ajax({
		 		url:"updateStatus.nf",
		 		traditional : true,
				data:{nfNoList: multiVal
					 ,memNo : ${ loginUser.memNo }	
				},
		 		success:function(result){
		 			alert(result);
		 			
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})

		 	$("#notifyNewNf").hide();
		 	
			// 메소드 재사용
			invalidateUnreadNf()
		}
		
	</script>

</body>
</html>