<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- @Author Jaewon.s (기초 뼈대만)-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>TheZo Login</title>
<style>
    .outer{width: 320px; height: 620px;margin: auto;}
    #biglogo-area{display: flex; justify-content: center; padding-top: 68px;}
    #biglogo-area>img{width: 92%; margin-left: 18px;}
    .middle-area{text-align: center; padding-top: 12px;}
    .middle-area>span:nth-child(1){ color: black; font-size: 36px; font-weight: bold; transform: translateY(-10px);}
    .middle-area>span:nth-child(2)>img{width: 50px; transform: translateY(10px);}
    #form-area>table{width: 280px; margin: auto; margin-top: 5px; }
    #form-area div{border: 1px solid rgb(200,200,200); border-radius: 5px; margin: 5px; width: 275px; height: 42px; display: block;  overflow: hidden;}
    #form-area span{width: 55px ; height: 100%; display: inline-block; background-color: rgb(237,237,237) ;}
    #form-area span>img{ width: 45px; height: 42px; margin-left: 5px; margin-top: 1px;}
    input:focus{outline: none;}
    #form-area input{border: none; height: 42px; transform: translateY(-16px); width: 210px;}
    #form-area button{width: 100%; height: 36px; color: white;  font-size: 16px; font-weight: 400; border: none; border-radius: 4px; margin-top: 15px; background-color:rgb(44,62,80) ;}
    /* 임시로 만들어 놓은 페이지 입니다. 
        해당 영역 구현하시는 분이라면!!! 여기 싹다 지우고 편하게 작성하시면 됩니다!!! 

        단지 처음 ! main페이지 가기전에 로그인 조건검사용으로 넣어둔 페이지입니다!! 
    */


</style>
</head>
<body>
    <div class="outer">
        <div id="biglogo-area">
            <img src="resources/images/bigLogo.png">
        </div>

        <div class="middle-area">
            <span>The Zo</span> &nbsp;
            <span><img src="resources/images/smallLogo.png"></span>
        </div>
        
        <form action="test.me" method="POST">
            <div id="form-area">
                <table>
                    <tr>
                        <td>
                            <div>
                                <span><img src="resources/images/loginIcon1.png"></span>
                                <input type="text" name="userId" value="admin">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <span><img src="resources/images/loginIcon2.png"></span>
                                <input type="password" name="userPwd" value="1234">
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit">로그인</button>
            </div>
        </form>
        
        <span style="color: blue; font-weight: bold;">
            바로 로그인 버튼 누르시면 session에 <br> id : admin , pwd : 1234 가 담기면서 <br> main페이지로 넘어갑니다.  
        </span>
        <br>
        <span style="color: red; font-weight: bold;">해당페이지는 main페이지를 가지 전  조건 <br>  검사를 위해서 임시로 만든 페이지입니다. <br> 담당하시는분이 편하게 화면 다시 만드셔도 됩니다!! ^^ 메인페이지에서 작업을 <br> 해야하기에 ! 임시 백단을 만든상태입니다.
        </span>
    </div>

</body>
</html>