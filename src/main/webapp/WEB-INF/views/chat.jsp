<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<style>
	*{
		font-family: 나눔고딕;
	}
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		width:500px;
		height:20px
	}
	#btn-submit{
		background: white;
		background: #F7E600;
		width:60px;
		height:30px;
		color:#607080;
		border:none;
	}
	
	#main-container{
		width:600px;
		height:680px;
		border:1px solid black;
		margin:10px;
		display: inline-block;
		
	}
	#chat-container{
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 600px;
		max-height: 600px;
		overflow: scroll;
		overflow-x:hidden;
		background: #9bbbd4;
	}
	
	.chat{
		font-size: 20px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	
	.notice{
		color:#607080;
		font-weight: bold;
		border : none;
		text-align: center;
		background-color: #9bbbd4;
		display: block;
	}

	.my-chat{
		text-align: right;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	
	#bottom-container{
		margin:10px;
	}
	
	.chat-info{
		color:#556677;
		font-size: 10px;
		text-align: right;
		padding: 5px;
		padding-top: 0px;

	}
	
	.chat-box{
		text-align:left;
	}
	.my-chat-box{
		text-align: right;
	}

</style>

</head>
<body>
<h3>chat</h3>

	<div id="main-container">
		<div id="chat-container">
		</div>
		<div id="bottom-container">
			<input id="inputMessage" type="text">
			<input id="btn-submit" type="submit" value="전송" >
		</div>
	</div>

</body>

<script type="text/javascript">
	
	var textarea = document.getElementById("chat-container");
//	var webSocket = new WebSocket('ws://172.16.4.15:9100/chat9/chat'); //인웅localhost
//	var webSocket = new WebSocket('ws://@172.16.4.17:9100/sprj09/chat'); //오욱localhost
//	var webSocket = new WebSocket('ws://localhost:9100/partners/chat');
	var webSocket = new WebSocket('ws://172.16.4.15:9100/partners/chat');
	
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(e){
		onError(e);
	};
	webSocket.onopen = function(e){
		onOpen(e);
	};
	webSocket.onmessage = function(e){
		onMessage(e);
	};
	
	
	function onMessage(e){
		var chatMsg = event.data;
		var date = new Date();
		var ampm = "오전";
		var hours = String(date.getHours()).padStart(2, "0"); //시계 두자릿수 출력
		var min = String(date.getMinutes()).padStart(2, "0");
		//var sec = String(date.getSeconds()).padStart(2, "0");
		
		//시간 앞에 오전,오후 출력 
		if (hours > 12) {
			hours = hours - 12;
			ampm = "오후";
		}
		if(hours == 0) {
            hours = 12;
         }
		if(hours == 12){
        	ampm = "오후"
        }
		
		var dateInfo = ampm + hours + ":" + min;
		if(chatMsg.substring(0,6) == 'server'){
			var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
			$('#chat-container').append($chat);
		}else{
			var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
			$('#chat-container').append($chat);
		}
		
		
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
	}
	
	function onOpen(e){
		textarea.value += "==== Connected Eric Chat Server ===\n";
	}
	
	function onError(e){
//		alert(e.data);
		alert("연결실패");
	}
	
	function send(){
		var chatMsg = inputMessage.value;
		if(chatMsg == ''){
			return;
		}
		var date = new Date();
		var ampm = "오전";
		var hours = String(date.getHours()).padStart(2, "0");
		var min = String(date.getMinutes()).padStart(2, "0");
		//var sec = String(date.getSeconds()).padStart(2, "0");
		
		if (hours > 12) {
			hours = hours - 12;
			ampm = "오후";
		}
		if(hours == 0) {
            hours = 12;
         }
		if(hours == 12){
        	ampm = "오후"
        }
		
		var dateInfo = ampm + hours + ":" + min;
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");
		$('#chat-container').append($chat);
		webSocket.send(chatMsg);
		inputMessage.value = "";
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
	}
	
</script>

<script type="text/javascript">
	$(function(){
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
				$('#inputMessage').focus();
				send();
			}
		});
		$('#btn-submit').click(function(){
			send();
		});
		
	})
	
	//새로고침 방지
	// Ctrl+R, Ctrl+N, F5 키 막음
	function doNotReload(){
    	if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
        	|| (event.keyCode == 116) )
    	{
      	event.keyCode = 0;
      	event.cancelBubble = true;
      	event.returnValue = false;
 		alert("새로고침 방지");
    	}
	}
	document.onkeydown = doNotReload;
	
</script>
</html>