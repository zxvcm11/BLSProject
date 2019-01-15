<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link
	href="https://stackpath.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" type="text/css" />
<head>
<meta charset="EUC-KR">
<link rel='stylesheet' href='/stylesheets/style.css' />
<script src="/javascripts/jquery.js"></script>
<script src="http://localhost:8080/socket.io/socket.io.js"></script>

<script>
	$(document).ready(function() {
		var socket = io.connect("http://211.110.165.201:1005");
		socket.on('connect', function() {
			//최초 접속시
			socket.emit('init', {
				id : 'jdh',
				msg : 'hello'
			});
			//서버에서 메세지가 오면 textarea에 표시
			socket.on('subscribe', function(data) {
				var tmp = $('#txt_out').val();
				$('#txt_out').val(data.id + "," + data.msg + "\n" + tmp);
				var tmp1 = $('#div_out').html();
				$('#div_out').html(data.msg + "<br />" + tmp1);
			});
		});

		$('#btn_msg').click(function() {
			var txt = $('#txt_msg').val();
			socket.emit('publish', {
				msg : String(txt)
			});
		});
	});

</script>
</head>
<body>
	<input type="text" id="txt_msg" />
	<input type="button" id="btn_msg" value="보내기" />
	<textarea rows="10" style="width: 100%" id="txt_out"></textarea>
	<div id="div_out"></div>
</html>