<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<style>

a {
	text-decoration: none;
}
#head {
	background: #FFF;
	height: 150px;
	top: 150px;
}
#head .img {	
}

.menu1 {
background-color: white;
margin-left: 360px;
margin-right: 360px;
widht : 1200px;
height : 70px;
}

.menu1 .main_menu{
float: left;
width : 200px;
text-align: center;
font-size: 22px;
font-family: 'Noto Sans KR', sans-serif;
margin-top: 19px;
position: absolute;
align-content: center;
width : 235px;
}
.menu2 {
margin-left: 360px;
margin-right: 360px;
background-color: white;
widht : 1200px;
height : 320px;
display: none;
z-index:2;
position: absolute; 
/* relative가 안쪽의 앱솔루트를 잡아준다. */
}
div.visual_side {
z-index:0;
}
.menu2 .sub_menu{
/* position: absolute; */
float: left;
width : 235px;
text-align: center;
font-size : 15px;
font-family: 'Noto Sans KR', sans-serif;
margin-top: 15px;
z-index:300;
}
.menu2 .sub_menu div{
padding-top : 5px;
}
header{
margin-left: 360px;
width: 1200px;
align-content: center;
}
hr{
margin: 0px;
}
.fo1{
	background-color: #0d141f;
	height: 50px;
	padding-bottom: 0;
	margin-bottom: auto;
}
.fo2{
	background-color: #1b2637;
	height: 150px;
	padding-bottom: 0;
	margin-bottom: auto;
}
</style>
<decorator:head />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).on('mouseover', '.menu1', function () {
    $('.menu2').slideDown(50);
});
$(document).on('mouseover', 'section,header,footer', function () {
    if (!$(this).hasClass('.menu1')) {
        $('.menu2').slideUp(50);
    }
});
</script>
</head>
<body>
	<script type="text/javascript"></script>
	<header>
		<div class="head" align="center">
			<div align="right">
				<c:if test="${empty sessionScope.loginUser}">
					<a href="${path}/user/login.shop">로그인</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="#">로그아웃</a>
				</c:if>
			</div>
			<a href="${path}/team/mainPage.shop"><img src="${path}/picture/logo.jpg"
				style="width: 200px; height: 100px;"></a>
		</div>
	</header>
<hr style="border-top : 2px solid gray;">
<div class="menu1">
<div class="main_menu" style="margin-left: 0px;">경기일정 및 순위정보</div>
<div class="main_menu" style="margin-left: 240px;"><a href="${path}/team/tInfo.shop?tcode=06">구단정보</a></div>
<div class="main_menu" style="margin-left: 480px;"><a href="${path}/board/list.shop?pcode=06">게시판</a></div>
<div class="main_menu" style="margin-left: 720px;"><a href="${path}/item/list.shop">굿즈</a></div>
<div class="main_menu" style="margin-left: 960px;"><a href="${path}/chat/chat.shop">실시간 중계</a></div>

</div>
<div class="menu2">
<div class="sub_menu" style="margin-left: 0px;"> <!-- 경기일정 및 경기기록 -->
<div><a href="${path}/team/teamMain.shop" >팀 순위</a></div>
<div><%-- <a href="${path}/team/teamMain.shop"> --%>선수 순위</a></div>
<div><a href="${path}/chat/test1.shop">t1</a></div>
<div><a href="${path}/chat/test2.shop">t2</a></div>
</div>
<div class="sub_menu" style="left:240px;"> <!-- 구단정보 -->
<c:forEach items="${teamCode}" var="c">
<div ><a href="${path}/team/tInfo.shop?tcode=${c.value}">${c.key}</a></div>
</c:forEach>
</div>
<div class="sub_menu" style="left:480px;"> <!-- 게시판 -->
<c:forEach items="${teamCode}" var="c">
<div><a href="${path}/board/list.shop?tcode=${c.value}">${c.key}</a></div>
</c:forEach>
</div>
<div class="sub_menu" style="left:720px;"> <!-- 굿즈 -->
</div>
<div class="sub_menu" style="left:960px;"> <!-- 실시간 중계 -->
</div>
</div>
<section>
	<decorator:body />
</section>
	<footer>
	<div class="fo1"></div>
	<div class="fo2"></div>
	</footer>
</body>
</html>