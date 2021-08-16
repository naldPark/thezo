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
    #collegue-search-area{width: 295px; height: 45px; display: flex; position: fixed; align-items: center; justify-content: space-between; background-color: white; }
    #collegue-search-area>span{font-size: 22px; font-weight: bold; line-height: 45px; font-family:'Noto Sans KR', sans-serif; margin-left: 5px;}
    #collegue-search-area>button{height: 35px; font-size: 22px; font-weight: bold; border: none; outline: none; background-color: inherit;}
    #collegue-search-area>button:hover{color:rgb(36, 77, 209); border-radius: 50%; transform: scale(1.1); background-color: rgb(224,224,224);}
    #my-collegue-list{margin-top: 45px;}
    .my-profile-listarea{height: 70px; display: flex; justify-content: flex-start; align-items: center; border-bottom: 3px solid lightgray;}
    .my-profile-listarea>div:first-child, .collegue-profile-listarea>div>div:first-child{width: 58px; height: 58px; overflow: hidden; border-radius: 23px; background-color: lightgray;}
    .my-profile-listarea>div:first-child:hover{cursor: pointer;}
    .my-profile-listarea>div:first-child>img, .collegue-profile-listarea>div>div:first-child>img{width: 58px; height: 58px; object-fit:cover;}
    .my-profile-listarea>div:last-child, .collegue-profile-listarea>div>div:nth-child(2){width: 235px; height: 58px;}
    .my-profile-listarea>div:last-child>p, .collegue-profile-listarea>div>div:nth-child(2)>p{font-weight: bold; font-family:'Noto Sans KR', sans-serif; line-height: 58px; margin: 0px; padding-left: 20px;
        -ms-user-select: none; 
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;}
    .collegue-profile-listarea>p{color: rgb(127,127,127); height: 42px;  line-height: 42px; font-size: 18px; font-weight: bold; font-family:'Noto Sans KR', sans-serif; padding-left: 5px; margin-bottom: 5px;}
    .collegue-profile-listarea>div{height: 60px; margin: 7px 0px; display: flex; align-items: center; justify-content: flex-start;}
    .collegue-profile-listarea>div:hover{cursor: pointer; background-color: lightcyan; color: orange;}
    .collegue-profile-listarea>div:hover>div:first-child{box-shadow: 0 0 3px #fff,0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170);}
</style>
</head>
<body>
    <script>
    	// 재사용을 위해서 선언적함수로 만듬
    	function bringColleageuList(){
            $.ajax({
				url:"selsectCoList.cht",
				data:{ memNo : ${ loginUser.memNo }},
		 		success:function(list){
		 			if(list.length > 0){
			 			// 내 이미지쪽 끝 
			 			$(".my-profile-listarea img").attr("src",(list[0].myImgPath == null) ? "resources/images/basicProfile.png" : list[0].myImgPath);
						$(".my-profile-listarea img").attr("onclick", "oneClickOpenImage(" + '"' + ((list[0].myImgPath == null) ? "resources/images/basicProfile.png" : list[0].myImgPath) + '"' + ");");
			 			$(".my-profile-listarea p").html(list[0].myNameAndRank);
			 			
			 			//동료 리스트 쪽 
			 			$("#colleagueCount").html(list.length)
			 			var value;
			 			value = '<p>나의 동료 <span style="color:rgb(255,165,0);">' + list.length  + '</span></p>';
			 			for(var i in list){		 				
			 				value += '<div ondblclick="clickConnectChatRoom('
			 					   + list[i].coMemNo +');">'
			 				       + '<div><img src="' 
			 				       if(list[i].coImgPath == null){
			 				 		value += "resources/images/basicProfile.png"; 
			 				       }else{
			 				    	  value += list[i].coImgPath;
			 				       }
			 				       value += '" '
			 				       + 'onclick="oneClickOpenImage(' + "'"    
			 				       if(list[i].coImgPath == null){
	  		 				 	      value += "resources/images/basicProfile.png"; 
			 				       }else{
			 				    	  value += list[i].coImgPath;
			 				       }
			 				      value +=  "'" + ');"></div><div><p>'
			 				       + list[i].coNameAndRank
			 				       + '</p></div><input type="hidden" value=""></div>'
			 			}
			 			$(".collegue-profile-listarea").html(value)
		 			}
		 		},error:function(request,status,error){ // 406 에러가 뜬다.... 뭐냐 json(gson)으로 반환하는 타입 맞지않아서 뜨는오류인데 select문에서 resultMap써줬는지 봐라
		 	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		 			console.log("ajax통신 실패");
		 		}				
		 	})
    	};
    	
    	$(function(){
	    	bringColleageuList();    		
    	})
    </script>
	

    <div id="collegue-search-area">
        <span>동료</span>
        <button type="button" onclick="openCreateGroupChat('gc');" style="margin-left:170px;"><i class="fas fa-comment-medical"></i></button>
        <button type="button" onclick="openAddColleague();"><i class="fas fa-search-plus"></i></button>
    </div>

    <div id="my-collegue-list">
        <div class="my-profile-listarea">
            <div>
            	<c:choose>
            		<c:when test="${empty loginUser.path }">
		                <img src="resources/images/basicProfile.png" onclick="oneClickOpenImage('resources/images/basicProfile.png');">
            		</c:when>
            		<c:otherwise>
            			<img src="resources/images/basicProfile.png" onclick="oneClickOpenImage('resources/images/basicProfile.png');">
            		</c:otherwise>
            	</c:choose>
            </div>
            <div>
                <p>${loginUser.memName} [${loginUser.rank}]</p>
            </div>
            
        </div>

        <div class="collegue-profile-listarea">
	        <div><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동료를 추가해 보세요~ ^^ </b></div>
        </div>
    </div>
</body>
</html>