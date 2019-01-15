<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
<fmt:formatDate value="${now}" pattern="E" var="day" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CRAWING을 이용한 SCREEN</title>
<style>
.visual_side {
background: rgba(0, 0, 0, 0.4);
position:relative;
z-index:2;
overflow:hidden;
width:330px;
height:600px;
margin-left: 360px;
z-index:2;
}
.visual_side2 {
background: rgba(0, 0, 0, 0.4);
position:relative;
z-index:2;
overflow:hidden;
width:330px;
height:300px;
margin-left: 360px;
color: white;
}
.visual_side .flexbox {
	background-color: #1a1a1d;
	width: 265px;
	height: 150px;
	margin: 10px 0;
	display: -webkit-flex;
	-webkit-flex-wrap: wrap;
	flex-wrap: wrap;
}
.visual_side .item {
	width: 80px;
	height: 50px;
	color: white;
	font-size: 15px;
	text-align: center;
	line-height: 50px;
	margin: auto;
}
.visual_side .item img {
	width : 80px;
	vertical-align: top;
}
.box1 {
opacity:0.3;
background-color:black;
width : 500px;
height : 1000px;
}
.shp {
color: white;
font-size: 30px;
fon
}
.back {
position:absolute;
height : 900px;
min-width: 1920px;
width:100%;
}
.rank{
font-size: 16px;
}
.r_num{
margin-left: 10px;
}
.r_lose{

}
.rank_main{

}
.sh_gr{
margin-left :690px;
position : absolute;
width : 870px;
height : 600px;
float: right;
font: white;

}
.p_rank{
color: white;
margin-top : 600px;
margin-left : 690px;
position: absolute;
width : 870px;
height:300px;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script> 
$(document).ready(function() {
	//var v_title = "한글";
	$.getJSON('${path}/file/test.json',function(data) {
		var html = [];
		hhh = "";
		$.each(data,function(i,item) {
			//$title =iconv("UTF-8","EUC-KR",$title);
			//alert('${today}')
			
			if('${today}'== item.date) {
				hhh +="<a href=''>";
				if(item.home == 'DB') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_16.png">';
				}else if(item.home == 'LG') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_50.png">';
				}else if(item.home == '삼성') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_60.png">';
				}else if(item.home == 'KCC') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_70.png">';
				}else if(item.home == 'SK') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_55.png">';
				}else if(item.home == '전자랜드') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_65.png">';
				}else if(item.home == '오리온') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_30.png">';
				}else if(item.home == 'KGC') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_70.png">';
				}else if(item.home == '현대모비스') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_10.png">';
				}else if(item.home == 'KT') {
hhh += '<div class="flexbox"><div class ="item"><img src="${path}/picture/teams/logo_06.png">';
				}
				hhh +='<br align="center">'+ item.home+'</div><div class="item">' + item.time +'<br valign="top">VS</div>';
				
				if(item.away == 'DB') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_16.png">';
				}else if(item.away == 'LG') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_50.png">';
				}else if(item.away == '삼성') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_60.png">';
				}else if(item.away == 'KCC') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_70.png">';
				}else if(item.away == 'SK') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_55.png">';
				}else if(item.away == '전자랜드') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_65.png">';
				}else if(item.away == '오리온') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_30.png">';
				}else if(item.away == 'KGC') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_70.png">';
				}else if(item.away == '현대모비스') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_10.png">';
				}else if(item.away == 'KT') {
hhh += '<div class ="item"><img src="${path}/picture/teams/logo_06.png">';
				}
				hhh += item.away+'</div></div></a>';
				console.log("hhh :" + hhh )
				$('#target').html(hhh);
		}
		});
		});
	});
</script>

</head>
<body>

<img class="back" src="${path}/picture/back.jpg" >
<div class="sh_gr">
</div>

<div class="p_rank">
<h1>PLAYER RANKING</h1>

<c:forEach var="i"  begin="0"  end="3">
<div>
${PRank.cont[i]}
${PRank.pname[i]}
${PRank.teamname[i]}
${PRank.score[i]}
</div>
</c:forEach>

</div>
<div class="visual_side" >
	<p class="shp"align="center">${today}(${day})</p>
<div id="target" align="center"></div>
</div>


<div class="visual_side2">
<h1>TEAM RANKING</h1>
<div>
<c:forEach var="i"  begin="0"  end="4">
  <div class="rank_main" >
  <span class="rank r_num">${i+1}</span>
  <span class="rank r_name">${Rank.teamname[i]}</span>
  <span class="rank r_win">${Rank.win[i]}</span><span class="rank"> - </span>
  <span class="rank r_lose">${Rank.lose[i]}</span></div>
</c:forEach>
</div>
</div>

</body>
</html>