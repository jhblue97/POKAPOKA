<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   


<!DOCTYPE html>
<html>
<head>
<title>WebSocket</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,
         initial-scale=1.0">

<script type="text/javascript">

	var uri = "ws://localhost:8091/chat/"+${userid};
	var websocket = null;
	var message = "";
	//console.log(uri);/*"wss://websocket.cfapps.eu10.hana.ondemand.com/chat/"+username*/
	websocket = new WebSocket(uri);
	function openConnection() {
		//console.log(websocket);
		websocket.onmessage = function(event) {
			console.log("event"+event.data);
			var node = document.getElementById('fromServer');
			var newNode = document.createElement('h1');
			newNode.appendChild(document.createTextNode(event.data));
			node.appendChild(newNode);
			console.log("in event");
		};
	//	console.log(websocket.onmessage);
	}

	function closeConnection() {
		websocket.close();
	}

	function sendMessage() {
		var msg = document.getElementById('messageText').value;
		console.log(msg);
		//var json = JSON.Stringi
		var json = JSON.stringify({

			"content" : msg

		});
		websocket.send(json);
		console.log(json);
	}
</script>

</head>
<body onload="openConnection();" onunload="closeConnection();">
	<div>
		<p>
			Client Message: <input id="messageText" type="text" /> <input
				id="sendButton" type="button" value="Send" onclick="sendMessage();" />
		</p>
		<div id="fromServer"></div>
	</div>
</body>
</html>