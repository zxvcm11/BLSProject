<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CRAWING을 이용한 SCREEN</title>
<style type="text/css">

.info_mid{
margin-left: 360px;
margin-bottom: 50px;
margin-right : 360px;
width : 1200px;
height : 500px;
display:none;
}
.info_menu {
	width: 1200px;
	margin-left: 10px;
}
.info_menu_su {
	width: 200px;
	height: 50px;
}
.info_su {
	float: left;
	width: 120px;
	margin-left: 50px;
}
.info_con {
	margin-left: 400px;
	width: 360px;
}
.info_img {
	border-top-left-radius: 1px; border : solid;
	border-color: gray;
	align-content: center;
	width: 200px;
	height: 200px;
	border: solid;
}
.info_top{
margin-top : 50px;
margin-left: 660px;
margin-right: 360px;
width : 1200px;
height: 150px;

}
.info_top_menu{
border : 1px solid gray;
width : 200px;
height : 80px;
float: left;
padding-left: 20px;
padding-right: 20px;
font-size: 18px;
text-align :center;
}
.info_full{
width : 840px;
padding: 100px 20px 20px 20px;
background: #bababa url("${path}/picture/teams/team_bg.jpg") no-repeat 0 0;
overflow: hidden;
margin-left: 180px;
}
.plist {
float: left;
border: outset 0.7px;
margin: 7px;
}
.player_img{

background: no-repeat 0 0;
width: 117px;
padding: 7px 7px 7px 7px;
margin-right: 6px;
}
.info_box{
width: 800px;
padding: 20px;
background: #fff;
}
</style>

<script type="text/javascript">
window.onload=function(){
	document.getElementById("tinfo").style.display = "none";
	document.getElementById("pinfo").style.display = "block";
}
function disp_div(id) {
	document.getElementById("tinfo").style.display = "none";
	document.getElementById("pinfo").style.display = "none";
	document.getElementById(id).style.display = "block";
}
function list_disp(id) {
	var disp = document.getElementById(id);
	if(disp.style.display == 'block') {
		disp.style.display = "none";
	} else {
		disp.style.display = "block";
	}
}
</script>
</head>
<body>
	<div  class="info_top">
		<div><a href="javascript:disp_div('pinfo')">
			<div class="info_top_menu" style="margin-left: 0px; left: 0px;">
			팀소개</div></a>
			<a href="javascript:disp_div('tinfo')">
			<div class="info_top_menu" style="margin-left: 0px; left: 200px;">
			선수소개</div></a>
			<a href="">
			<div class="info_top_menu" style="margin-left: 0px; left: 400px;">
			팀기록실</div></a>
		</div>
	</div>
	
	<div id="pinfo" class="info_mid">
		<div class="info_full">
		<div class="info_box">
			<div style="float: left;">
				<img class="info_img"
					src="${path}/picture/teams/info_logo/logo_${param.tcode}.gif">
			</div>
			<div>
				<div class="info_su">구단주</div>
				<div class="info_con">${teaminfo.infotxt1}</div>
			</div>
			<div>
				<div class="info_su">구단주 대행</div>
				<div class="info_con">
				<c:if test="${teaminfo.infotxt2 == ''}">
				-
				</c:if>
				<c:if test="${teaminfo.infotxt2 != ''}">
				${teaminfo.infotxt2}
				</c:if>
				</div>
				
			</div>
			<div>
				<div class="info_su">단장</div>
				<div class="info_con">${teaminfo.infotxt3}</div>
			</div>
			<div>
				<div class="info_su">감독</div>
				<div class="info_con">${teaminfo.infotxt4}</div>
			</div>
			<div>
				<div class="info_su">코치</div>
				<div class="info_con">${teaminfo.infotxt5}</div>
			</div>
			<div>
				<div class="info_su">주소</div>
				<div class="info_con">${teaminfo.infotxt6}</div>
			</div>
			<div>
				<div class="info_su">연고지 / 모기업</div>
				<div class="info_con">${teaminfo.infotxt7}</div>
			</div>
			<div>
				<div class="info_su">전화 / 팩스</div>
				<div class="info_con">${teaminfo.infotxt8}</div>
			</div>
		</div>
		</div>
</div>
<div id="tinfo"class="info_mid">
							<div style="margin-left: 100px;">
								<c:forEach items="${pCode}" var="pcode">
										<c:if test="${pcode.value==param.tcode}">
											<div class="plist">
											<div class="player_img">
											<img src="${path}/picture/team_players/${pcode.key}.jpg" style="width: 110px; height: 138px;">
											</div>
											</div>
										</c:if>
								</c:forEach>
							</div>
</div>
<div></div>
</body>
</html>