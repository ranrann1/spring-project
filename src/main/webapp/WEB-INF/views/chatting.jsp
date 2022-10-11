<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<!-- Font Awesome -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	  />
	<!-- Google Fonts -->
	<link
	  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	  rel="stylesheet"
	/>
	
	<link
	  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	  rel="stylesheet"
	/>
	
	<link
	  href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	  rel="stylesheet"
	/>
	
	<style type="text/css">
	.card-bordered {
	    border: 1px solid #ebebeb;
	}
	
	.card {
	    border: 0;
	    border-radius: 0px;
	    
	    -webkit-box-shadow: 0 2px 3px rgba(0,0,0,0.03);
	    box-shadow: 0 2px 3px rgba(0,0,0,0.03);
	    -webkit-transition: .5s;
	    transition: .5s;
	}
	
	.padding {
	    padding: 3rem !important
	}
	
	body {
	    background-color: #f9f9fa
	}
	
	.card-header:first-child {
	    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
	}
	
	
	.card-header {
	    display: -webkit-box;
	    display: flex;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 15px 20px;
	    background-color: transparent;
	    border-bottom: 1px solid rgba(77,82,89,0.07);
	}
	
	.card-header .card-title {
	    padding: 0;
	    border: none;
	}
	
	h4.card-title {
	    font-size: 17px;
	}
	
	.card-header>*:last-child {
	    margin-right: 0;
	}
	
	.card-header>* {
	    margin-left: 8px;
	    margin-right: 8px;
	}
	
	.btn-secondary {
	    color: #4d5259 !important;
	    background-color: #e4e7ea;
	    border-color: #e4e7ea;
	    color: #fff;
	}
	
	.btn-xs {
	    font-size: 11px;
	    padding: 2px 8px;
	    line-height: 18px;
	}
	.btn-xs:hover{
	    color:#fff !important;
	}
	
	.card-title {
	    font-family: Roboto,sans-serif;
	    font-weight: 300;
	    line-height: 1.5;
	    margin-bottom: 0;
	    padding: 15px 20px;
	    border-bottom: 1px solid rgba(77,82,89,0.07);
	}
	
	
	.ps-container {
	    position: relative;
	}
	
	.ps-container {
	    -ms-touch-action: auto;
	    touch-action: auto;
	    overflow: hidden!important;
	    -ms-overflow-style: none;
	}
	
	.media-chat {
	    padding-right: 64px;
	    margin-bottom: 0;
	}
	
	.media {
	    padding: 16px 12px;
	    -webkit-transition: background-color .2s linear;
	    transition: background-color .2s linear;
	}
	
	.media .avatar {
	    flex-shrink: 0;
	}
	
	.avatar {
	    position: relative;
	    display: inline-block;
	    width: 36px;
	    height: 36px;
	    line-height: 36px;
	    text-align: center;
	    border-radius: 100%;
	    background-color: #f5f6f7;
	    color: #8b95a5;
	    text-transform: uppercase;
	}
	
	.media-chat .media-body {
	    -webkit-box-flex: initial;
	    flex: initial;
	    display: table;
	}
	
	.media-body {
	    min-width: 0;
	}
	
	.media-chat .media-body p {
	    position: relative;
	    padding: 6px 8px;
	    margin: 4px 0;
	    background-color: #f5f6f7;
	    border-radius: 3px;
	    font-weight: 100;
	    color:#9b9b9b;
	}
	
	.media>* {
	    margin: 0 8px;
	}
	
	.media-chat .media-body p.meta {
	    background-color: transparent !important;
	    padding: 0;
	    opacity: .8;
	}
	
	.media-meta-day {
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-bottom: 0;
	    color: #8b95a5;
	    opacity: .8;
	    font-weight: 400;
	}
	
	.media {
	    padding: 16px 12px;
	    -webkit-transition: background-color .2s linear;
	    transition: background-color .2s linear;
	}
	
	.media-meta-day::before {
	    margin-right: 16px;
	}
	
	.media-meta-day::before, .media-meta-day::after {
	    content: '';
	    -webkit-box-flex: 1;
	    flex: 1 1;
	    border-top: 1px solid #ebebeb;
	}
	
	.media-meta-day::after {
	    content: '';
	    -webkit-box-flex: 1;
	    flex: 1 1;
	    border-top: 1px solid #ebebeb;
	}
	
	.media-meta-day::after {
	    margin-left: 16px;
	}
	
	.media-chat.media-chat-reverse {
	    padding-right: 12px;
	    padding-left: 64px;
	    -webkit-box-orient: horizontal;
	    -webkit-box-direction: reverse;
	    flex-direction: row-reverse;
	}
	
	.media-chat {
	    padding-right: 64px;
	    margin-bottom: 0;
	}
	
	.media {
	    padding: 16px 12px;
	    -webkit-transition: background-color .2s linear;
	    transition: background-color .2s linear;
	}
	
	.media-chat.media-chat-reverse .media-body p {
	    float: right;
	    clear: right;
	    background-color: #48b0f7;
	    color: #fff;
	}
	
	.media-chat .media-body p {
	    position: relative;
	    padding: 6px 8px;
	    margin: 4px 0;
	    background-color: #f5f6f7;
	    border-radius: 3px;
	    color: #464646;
	}
	
	
	.border-light {
	    border-color: #f1f2f3 !important;
	}
	
	.bt-1 {
	    border-top: 1px solid #ebebeb !important;
	}
	
	.publisher {
	    position: relative;
	    display: -webkit-box;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 12px 20px;
	    background-color: #f9fafb;
	}
	
	.publisher>*:first-child {
	    margin-left: 0;
	}
	
	.publisher>* {
	    /*margin: 0 8px;*/
	}
	
	.publisher-input {
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    border: none;
	    outline: none !important;
	    background-color: transparent;
	}
	
	button, input, optgroup, select, textarea {
	    font-family: Roboto,sans-serif;
	    font-weight: 300;
	}
	
	.publisher-btn {
	    background-color: transparent;
	    border: none;
	    color: #8b95a5;
	    font-size: 16px;
	    cursor: pointer;
	    overflow: -moz-hidden-unscrollable;
	    -webkit-transition: .2s linear;
	    transition: .2s linear;
	}
	
	.file-group {
	    position: relative;
	    overflow: hidden;
	} 
	
	.publisher-btn {
	    background-color: transparent;
	    border: none;
	    color: #cac7c7;
	    font-size: 16px;
	    cursor: pointer;
	    overflow: -moz-hidden-unscrollable;
	    -webkit-transition: .2s linear;
	    transition: .2s linear;
	} 
	
	.file-group input[type="file"] {
	    position: absolute;
	    opacity: 0;
	    z-index: -1; 
	    width: 20px;
	}
	
	.text-info {
	    color: #48b0f7 !important;
	}
	</style>
	<script type="text/javascript">
		var id_list = [];
		var cur_id = '${userid.id}';
		console.log(cur_id);
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(str) {
				var arr = null;
				var sessionId = null;
				var msg = null;
				
				if(str.includes(":")) {
					arr = str.split(":");
					sessionId = arr[0];
					msg = arr[1];
					
					if(cur_id == sessionId) {
						var tmp = "<div class='media media-chat media-chat-reverse'>";
						tmp += "<div class='media-body'>";
						tmp += "<p>" + str + "</p>";
						tmp += "</div></div>";
						
						$('#chat-content').append('<div>' + tmp + '</div>');	
					}
					else {
						var tmp = "<div class='media media-chat'>";
						tmp += "<div class='media-body'>";
						tmp += "<p>" + str + "</p>";
						tmp += "</div></div>";
						
						$('#chat-content').append('<div>' + tmp + '</div>');	
					}
				}
				else {
					sessionId = str.split(" ")[0];
					msg = str.split(" ")[1] +" " + str.split(" ")[2];
					if(str.includes("입장")){
						id_list.push(sessionId);
					}
					if(str.includes("퇴장")){
						for(var i=0;i<id_list.length;i++) {
							if(id_list[i] === sessionId) {
								id_list.splice(i,1);
								i--;
							}
						}
					}
					
					$('#chat-content').append('<div style="text-align:center;">'+ sessionId + msg + '</div>');	
				}
				console.log(id_list);
			},
			closeMessage: function(str) {
				$('#chat-content').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(str) {
				this._socket.send(str);
			}
		};
		
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
		
		function endChat() {
			// 방장일때만 전체참가자의 아이디가 보임
			console.log(id_list);
			document.getElementById("p_list").value = id_list;
			f.action = "<c:url value="/chat?bnum=${board.num}" />";
			f.submit();
			
			setTimeout(function() {
				opener.parent.location.reload();
	             window.close();
	        }, 100);
		}
	</script>
</head>
<body>
	<!-- 
	<div class="page-content page-container" id="page-content">
	  
	    <div class="row container d-flex justify-content-center" style="margin-left:auto; margin-right:auto;">
		  <div class="col-md-6"> 
		  -->
		    <div class="card card-bordered">
		    
		      <!-- header -->
		      <div class="card-header">
		        <h4 class="card-title"><strong>Chat</strong></h4>
		        <form id="f" method="post">
		        	<input type="hidden" name="p_list" id="p_list">
		        </form>
		        <c:if test="${userid.id eq board.uid}">
		        	<button class="btn btn-xs btn-secondary" onclick="endChat();">모집 종료</button>
		        </c:if>
		      </div>
		      
		      <!-- body -->
		      <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:600px !important;">
		      
		        <!-- 채팅창 추가될 자리 -->
		      
		        <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
		          <div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
		        </div>
		        <div class="ps-scrollbar-y-rail" style="top: 0px; height: 0px; right: 2px;">
		          <div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 2px;"></div>
		        </div>
		      </div>
		      
		      <!-- footer -->
		      <div class="publisher bt-1 border-light" style="height: 60px;">
                <input class="publisher-input" id="message" type="text" placeholder="Write something" onkeypress="if(event.keyCode==13){webSocket.sendChat();}">
                <input class="publisher-btn text-info" id="btnSend" value="Enter" type="button" onclick="webSocket.sendChat()" />
              </div>
              
		    </div>
		<!-- 
		  </div>
	    </div>
	</div>
	-->
</body>
</html>