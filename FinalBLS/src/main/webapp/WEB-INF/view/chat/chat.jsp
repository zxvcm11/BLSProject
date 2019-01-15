<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WebSocket Client</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<c:set var="port" value="${pageContext.request.localPort}" />
<c:set var="server" value="${pageContext.request.serverName}" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	$(function() {
		//new WebSocket() : 자바스크립트 객체.
		// ws://localhost:8080/mavenshop3/chatting.shop : 채팅 서버 url
		var ws = new WebSocket("ws://${server}:${port}${path}/chatting.shop");
		ws.onopen = function() {
			$("#chatStatus").text("info: connection opened.");
			$("input[name=chatInput]").on("keydown", function(evt) {
				if (evt.keyCode == 13) {//Enter 키
					var msg = $("input[name=chatInput]").val();
					ws.send(msg);
					$("input[name=chatInput]").val("");
				}
			});
		}
		//서버에서 메세지 수신된 경우
		ws.onmessage = function(event) {
			//evnet.data : 서버에서 전송된 메세지. 수신된 메세지
			//prepend : 앞쪽에 출력하기
			//append : 뒤쪽에 출력하기
			$("textarea").eq(0).prepend(event.data + "\n");
		}
		//서버와 연결이 끊어 진 경우
		ws.onclose = function(event) {
			$("#chatStatus").text("info:connection closed.");
		}
	})
</script>
</head>
<body>

	<p>
	<div id="chatStatus"></div>
	<textarea rows="15" cols="40" name="chatMsg"></textarea>
	<br> 메세지입력:
	<input type="text" name="chatInput">
<!-- 
	============================================================================
	<div class='j-message'></div>
	<div class='j-footer'>
		<table>
			<tr>
				<td width='100%'><input id='message-input' type='text'>
				</td>
				<td width='20%'>
					<button id='message-button' type='submit'>전송</button>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript"
		src="http://chat.socket.io/socket.io/socket.io.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script>
		var serverURL = 'localhost:50000';
		var name = 'jin';
		var room = '100';
		$(document).ready(function() {
			var socket = io.connect(serverURL);
			socket.on('connection', function(data) {
				if (data.type == 'connected') {
					socket.emit('connection', {
						type : 'join',
						name : name,
						room : 100
					});
				}
			});
			socket.on('system', function(data) {
				writeMessage('system', 'system', data.message);
			});
			socket.on('message', function(data) {
				writeMessage('other', data.name, data.message);
			});
			$('#message-button').click(function() {
				var msg = $('#message-input').val();
				socket.emit('user', {
					name : name,
					message : msg
				});
				writeMessage('me', name, msg);
			});
			function writeMessage(type, name, message) {
				var html = '<div>{MESSAGE}</div>';
				var printName = '';
				if (type == 'me') {
					printName = name + ' : ';
				}
				html = html.replace('{MESSAGE}', printName + message);
				$(html).appendTo('.j-message');
			}
		});
	</script>
 -->
</body>





</html>