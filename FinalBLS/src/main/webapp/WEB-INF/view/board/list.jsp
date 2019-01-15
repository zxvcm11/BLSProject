<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
<title>Team Board List</title>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if (searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = "1";
			location.href = "list.shop?pageNum=" + pageNum + "&tcode=" + $
			{
				param.tcode
			}
			;
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
<style type="text/css">
div.w3-row {
	width: 1100px;
	margin: auto;
	margin-top: 25px;
	margin-bottom: 25px;
}

div#divT, table {
	width: 1060px;
	margin-left: 410px;
	margin-top: -21px;
	/* 	margin-top: 25px; */
}

img#backImg {
	width: 300px;
	margin-left: 800px;
	margin-top: 170px;
	z-index: 0;
	position: absolute;
}

.f {
	z-index: 1;
	position: relative;
}

table {
	border-collapse: collapse;
	border-top: 1px solid #444444;
	margin-bottom: 25px;
}

th {
	border-top: 3px solid;
	border-bottom: 3px solid;
}

td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.w3-lobster {
	font-family: "Lobster", Sans-serif;
}
</style>
</head>
<body>
	<hr style="border-top: 1px solid gray;">
	<img src="${path}/picture/teams/logo_${param.tcode}.png" id="backImg">
	<!-- 
	<div class="w3-row">
		<c:forEach items="${sessionScope.teamCode}" var="c">
		${c.key}
			<div class="w3-col m3 l3">
				<a href="list.shop?tcode=${c.key}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c.value}
				<img src="${path}/picture/teams/logo_${c.key}.png"
					style="width: 225px; height: 225px;">
					</a>
			</div>
		</c:forEach>
	</div>
	  -->
	<div class="f">
		<table>
			<tr>
				<td colspan="2" align="left" style="padding-top: 30px"
					class="w3-lobster font-effect-brick-sign w3-xxlarge"><c:forEach
						items="${sessionScope.teamCode}" var="test">
						<c:if test="${test.value==param.tcode}"> ${test.key} Team Board </c:if>
					</c:forEach></td>

				<td colspan="3" align="right" style="padding-top: 55px">
					<%-- 검색 기능 --%>
					<form action="list.shop?tcode=${param.tcode}" method="post"
						name="searchform" onsubmit="return list(1)">
						<input type="hidden" name="tcode" value="${param.tcode}">
						<input type="hidden" name="pageNum" value="1"> <select
							name="searchType" id="searchType">
							<option value="0">Find</option>
							<option value="subject">Subject</option>
							<option value="name">Writer</option>
							<option value="content">Content</option>
						</select>&nbsp;
						<script type="text/javascript">
							if ('${param.searchType}' != '') {
								document.getElementById("searchType").value = '${param.searchType}';
							}
						</script>
						<input type="text" name="searchContent"
							value="${param.searchContent}"> <input type="submit"
							value="Search" class="w3-button"
							onmouseover="this.style.backgroundColor='#e5e5e5'"
							onmouseout="this.style.backgroundColor=''">
					</form>
				</td>
			</tr>
			<c:if test="${listcount >0 }">
				<tr align="center" valign="middle" bordercolor="#212121">
					<th width="8%" height="26">Num</th>
					<th width="50%" height="26">Subject</th>
					<th width="14%" height="26">Writer</th>
					<th width="17%" height="26">Date</th>
					<th>Count : ${listcount}</th>
					<c:forEach var="board" items="${boardlist}">
						<tr align="center" valign="middle" bordercolor="#db9130"
							onmouseover="this.style.backgroundColor='#e5e5e5'"
							onmouseout="this.style.backgroundColor=''">
							<td height="23">${boardcnt}<c:set var="boardcnt"
									value="${boardcnt -1}" />
							<td align="left"><c:if test="${!empty board.fileurl}">
									<a href="../file/${board.fileurl}">@</a>
								</c:if> <c:if test="${!empty board.fileurl}">
			&nbsp;
		</c:if> <c:forEach begin="1" end="${board.reflevel}">&nbsp;&nbsp;</c:forEach>
								<c:if test="${board.reflevel > 0}">└</c:if> <a
								href="detail.shop?num=${board.num}">${board.subject}</a></td>
							<td align="center">${board.name}</td>
							<td align="center"><fmt:formatDate value="${board.regdate}"
									pattern="YYYY.MM.HH" /></td>
							<td align="center">${board.readcnt}</td>
						</tr>
					</c:forEach>
				<tr align="center" height="26">
					<td colspan="5"><c:if test="${ pageNum > 1}">
							<a href="javascript:list(${pageNum -1})" class="w3-button"
								onmouseover="this.style.backgroundColor='#e5e5e5'"
								onmouseout="this.style.backgroundColor=''">Before</a>
						</c:if> <c:if test="${ pageNum <=1}">
							<button class="w3-button w3-hover-white">Before</button>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">
								<button class="w3-button w3-brown">${a}</button>
							</c:if>
							<c:if test="${a!=pageNum}">
								<a href="javascript:list(${a})" class="w3-button"
									onmouseover="this.style.backgroundColor='#e5e5e5'"
									onmouseout="this.style.backgroundColor=''">${a}</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum < maxpage}">
							<a href="javascript:list(${pageNum+1})" class="w3-button"
								onmouseover="this.style.backgroundColor='#e5e5e5'"
								onmouseout="this.style.backgroundColor=''">After</a>
						</c:if> <c:if test="${pageNum >= maxpage}">
							<button class="w3-button w3-hover-white">After</button>
						</c:if></td>
				</tr>
			</c:if>
			<%-- 조회할 게시물이 없니? --%>
			<c:if test="${listcount ==0}">
				<tr>
					<td colspan="5">Empty Board.</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" align="left"><c:if test="${!empty param.tcode}">
						<h4 class="w3-col w3-lobster font-effect-brick-sign">
							<c:forEach items="${sessionScope.teamCode}" var="test">
								<c:if test="${test.value==param.tcode}"> ${test.key} Team Board </c:if>
							</c:forEach>
						</h4>
					</c:if> <c:if test="${empty param.tcode}">
			Team Board
		</c:if></td>
				<td colspan="3" align="right"><a
					href="write.shop?tcode=${param.tcode}" class="w3-button"
					onmouseover="this.style.backgroundColor='#e5e5e5'"
					onmouseout="this.style.backgroundColor=''">Write</a></td>
			</tr>
		</table>
	</div>
</body>
</html>