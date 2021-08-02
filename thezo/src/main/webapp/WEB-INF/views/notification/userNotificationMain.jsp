<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @Author Jaewon.s --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
    #notification-list-outer{width: 300px; height: 470px; padding: 5px 0px; margin: auto;
        overflow-y: auto;
    }
    #notification-list-outer::-webkit-scrollbar {width: 10px;}
    #notification-list-outer::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(241,197,7);}
    #notification-list-outer::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: lightgrey;}
    .notification-item{width: 100%;}
    .notification-item:hover{cursor: pointer;}
    .notification-item:hover>.notification-item-header{background-color: rgb(238, 172, 113);}
    .notification-item-header{width: 100; height: 26px; display: flex; justify-content: space-around; background-color: rgb(247, 207, 142);}
    .notification-item-header>i{width: 33%; color: white; font-size: 14px; line-height: 28px; padding-left: 10px;}
    .notification-item-header>div{width: 66%; padding-left: 5px;}
    .notification-item-header>div>span{font-size: 17px; font-weight: bold; line-height: 28px;}
    .notification-item>p{margin: 0px; padding-top: 10px; background-color: white;}
    .nf-schedule{padding-left: 15px;}
    .pre-outer{width: 100%; background-color: white;}
    .nf-con{width: 280px; font-size: 15px; margin: 0px; padding: 10px; background-color: white; font-family:'Noto Sans KR', sans-serif;
		white-space:pre-wrap; 
		word-break:keep-all;
		text-overflow:clip;
        line-height: 20px;
    }
</style>
</head>
<body>
	<script>
		function ajaxShowMyNotification(){
		 	$.ajax({
		 		url:"selectList.adnf",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(myNfList){
		 			//console.log(myNfList);
		 			var value ="";
		 			for(var i in myNfList){
		 				value += '<div class="notification-item" onclick="toggleContent(' + myNfList[i].nfNo + ');">'
		 				       + '<div class="notification-item-header">'
		 				       + '<i class="fas fa-lightbulb"></i>' + '<div>'
		 				       + '<span>'
		 				       + myNfList[i].nfDeptName
		 				       + '</span><span>알림</span></div></div>'
		 				       + '<p class="nf-schedule">  일정 : <span>'
		 				       + myNfList[i].nfStartDate
		 				       + '</span> ~ <span>'
		 				       + myNfList[i].nfEndDate
		 				       + '</span></p>'
		 				       + '<div class="pre-outer">'
		 				       + '<pre id="nf-con'
		 				       + myNfList[i].nfNo
		 				       + '" class="nf-con" style="display: none;">' + myNfList[i].nfContent + '</pre></div></div>'
		 			}
					$("#notification-list-outer").html(value);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
		}
	</script>

    <div id="notification-list-outer">
    </div>

    <script>
        function toggleContent(num){
            $("#nf-con"+num).toggle();
        }
    </script>
</body>
</html>