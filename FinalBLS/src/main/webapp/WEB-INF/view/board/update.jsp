<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 수정</title>
<script type="text/javascript">
	function file_delete() {
		document.f.file2.value = "";
		file_desc.style.display = "none";
	}
</script>
<style type="text/css">
#f,table {
	width: 1060px;
	margin: auto;
	margin-top: 25px;
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
</style>
</head>
<body>
<hr style="border-top : 1px solid gray;">
	<form:form modelAttribute="board" action="update.shop"
		enctype="multipart/form-data" name="f" id="f">
		<input type="hidden" name="num" value="${board.num}">
		<input type="hidden" name="file2" value="${board.fileurl}">
		<table>
			<tr>
				<td colspan="2" align="center">Team Board Update</td>
			</tr>
			<tr>
				<td align="center">글쓴이</td>
				<td><form:input path="name" /><font color="red"><form:errors
							path="name" /></font></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><form:password path="pass" /><font color="red"><form:errors
							path="pass" /></font></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><form:input path="subject" /><font color="red"><form:errors
							path="subject" /></font></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td><form:textarea path="content" rows="15" cols="80" /> <font
					color="red"><form:errors path="content" /></font></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>&nbsp; <c:if test="${!empty board.fileurl}">
						<div id="file_desc">
							<a href="../file/${board.fileurl}">${board.fileurl}</a> <a
								href="javascript:file_delete()">[첨부파일삭제]</a>
						</div>
					</c:if> <input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:document.f.submit()">[게시물수정]</a> <a
					href="list.shop">[게시물목록]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>