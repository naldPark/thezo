<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav{width: 200px; height: 800px; margin: 0; float: left; background-color:rgb(236, 236, 236);	box-sizing: border-box;}
	#nav button{margin: 10px;}
	#nav a{color: black;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large;text-align: center;}
	hr {
	    margin-top: 1rem;
	    margin-bottom: 1rem;
	    border: 0;
	    border-top: 1px solid rgba(0,0,0,.1);
	}
</style>
</head>
<body>
	<div id="nav">
		<br>
		<div class="subject">
			<i class='fas fa-archive' style='font-size:20px'></i>
			<b>문서양식</b> 
		</div>
		
		<hr>
		<ul align="left" id="docCategory">
			<li><a href="list.doc" id="public" class="w3-button w3-left-align">공용 문서양식</a></li>
			<li><label for="dep"><span id="dep" class="w3-button w3-left-align" onclick="dep('depDoc');">부서별 문서양식</span></label>
				
				<ul id="depDoc" class="w3-hide w3-show">
					<!-- 클릭 시 부서별 게시판 이름이 나오게 -->
					<!-- 각각 a링크를 주지말고 category=""의 조건을 줘서 조회되게 -->
					<c:forEach var="doc" begin="2" items="${ category }">
						<li><a class="w3-button w3-block w3-left-align" href="list.doc?docCategory=${ doc.depName }">${ doc.depName }</a></li>
					</c:forEach>
				</ul>
				
			</li>
			
		</ul>
		
	</div>
	
	<script>
		$(function(){
			//var category = decodeURI(window.location.href).split('=')[1];
			var category = '${ docCategory }';
			//console.log(category);
			$.each($("#depDoc>li>a"), function(index, value){
				if($(this).text() == category){
					$(this).css('color', 'rgb(243,156,18)');
					$(this).css('font-weight', 'bold');
					
					$("#dep").css('color', 'rgb(243,156,18)');
					$("#dep").css('font-weight', 'bold');
				}
			})
			
			if(category == '공용'){ // 공용
				$("#public").css('color', 'rgb(243,156,18)');
				$("#public").css('font-weight', 'bold');
			}
			
		})
		
		function dep(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
			  x.className += " w3-show";
			} else { 
			  x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>
	
</body>
</html>