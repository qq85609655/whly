<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>图标选择</title>
<meta name="decorator" content="blank" />
<style type="text/css">
.page-header {
	clear: both;
	margin: 0 20px;
	padding-top: 20px;
}

.the-icons {
	padding: 25px 10px 15px;
	list-style: none;
}

.the-icons li {
	float: left;
	width: 22%;
	line-height: 25px;
	margin: 2px 5px;
	cursor: pointer;
}

.the-icons i {
	margin: 1px 5px;
	font-size: 16px;
}

.the-icons li:hover {
	background-color: #efefef;
}

.the-icons li.active {
	background-color: #0088CC;
	color: #ffffff;
}

.the-icons li:hover i {
	font-size: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#icons li").click(function() {
			$("#icons li").removeClass("active");
			$("#icons li i").removeClass("icon-white");
			$(this).addClass("active");
			$(this).children("i").addClass("icon-white");
			$("#icon").val($(this).text());
		});
		$("#icons li").each(function() {
			if ($(this).text() == "${value}") {
				$(this).click();
			}
		});
		$("#icons li").dblclick(function() {
			top.$.jBox.getBox().find("button[value='ok']").trigger("click");
		});
	});
</script>
<link
	href="/static/${whlyPage}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<input type="hidden" id="icon" value="${value}" />
	<div id="icons">

		<h2 class="page-header">Web 应用的图标</h2>

		<ul class="the-icons">
			<li><i class="icon-user"></i> icon-user</li>
			<li><i class="icon-user-female"></i> icon-user-female</li>
			<li><i class="icon-users"></i> icon-users</li>
			<li><i class="icon-user-follow"></i> icon-user-follow</li>
			<li><i class="icon-user-following"></i> icon-user-following</li>
			<li><i class="icon-user-unfollow"></i> icon-user-unfollow</li>
			<li><i class="icon-trophy"></i> icon-trophy</li>
			<li><i class="icon-speedometer"></i> icon-speedometer</li>
			<li><i class="icon-social-youtube"></i> icon-social-youtube</li>
			<li><i class="icon-social-twitter"></i> icon-social-twitter</li>
			<li><i class="icon-social-tumblr"></i> icon-social-tumblr</li>
			<li><i class="icon-social-facebook"></i> icon-social-facebook</li>
			<li><i class="icon-social-dropbox"></i> icon-social-dropbox</li>
			<li><i class="icon-social-dribbble"></i> icon-social-dribbble</li>
			<li><i class="icon-shield"></i> icon-shield</li>
			<li><i class="icon-screen-tablet"></i> icon-screen-tablet</li>
			<li><i class="icon-screen-smartphone"></i>
				icon-screen-smartphone </i>
			<li><i class="icon-screen-desktop"></i> icon-screen-desktop</li>
			<li><i class="icon-plane"></i> icon-plane</li>
			<li><i class="icon-notebook"></i> icon-notebook</li>
			<li><i class="icon-moustache"></i> icon-moustache</li>
			<li><i class="icon-mouse"></i> icon-mouse</li>
			<li><i class="icon-magnet"></i> icon-magnet</li>
			<li><i class="icon-magic-wand"></i> icon-magic-wand</li>
			<li><i class="icon-hourglass"></i> icon-hourglass</li>
			<li><i class="icon-graduation"></i> icon-graduation</li>
			<li><i class="icon-ghost"></i> icon-ghost</li>
			<li><i class="icon-game-controller"></i> icon-game-controller</li>
			<li><i class="icon-fire"></i> icon-fire</li>
			<li><i class="icon-eyeglasses"></i> icon-eyeglasses</li>
			<li><i class="icon-envelope-open"></i> icon-envelope-open</li>
			<li><i class="icon-envelope-letter"></i> icon-envelope-letter</li>
			<li><i class="icon-energy"></i> icon-energy</li>
			<li><i class="icon-emoticon-smile"></i> icon-emoticon-smile</li>
			<li><i class="icon-disc"></i> icon-disc</li>
			<li><i class="icon-cursor-move"></i> icon-cursor-move</li>
			<li><i class="icon-crop"></i> icon-crop</li>
			<li><i class="icon-credit-card"></i> icon-credit-card</li>
			<li><i class="icon-chemistry"></i> icon-chemistry</li>
			<li><i class="icon-bell"></i> icon-bell</li>
			<li><i class="icon-badge"></i> icon-badge</li>
			<li><i class="icon-anchor"></i> icon-anchor</li>
			<li><i class="icon-action-redo"></i> icon-action-redo </i>
			<li><i class="icon-action-undo"></i> icon-action-undo</li>
			<li><i class="icon-bag"></i> icon-bag</li>
			<li><i class="icon-basket"></i> icon-basket</li>
			<li><i class="icon-basket-loaded"></i> icon-basket-loaded</li>
			<li><i class="icon-book-open"></i> icon-book-open</li>
			<li><i class="icon-briefcase"></i> icon-briefcase</li>
			<li><i class="icon-bubbles"></i> icon-bubbles</li>
			<li><i class="icon-calculator"></i> icon-calculator</li>
			<li><i class="icon-call-end"></i> icon-call-end</li>
			<li><i class="icon-call-in"></i> icon-call-in</li>
			<li><i class="icon-call-out"></i> icon-call-out</li>
			<li><i class="icon-compass"></i> icon-compass</li>
			<li><i class="icon-cup"></i> icon-cup</li>
			<li><i class="icon-diamond"></i> icon-diamond</li>
			<li><i class="icon-direction"></i> icon-direction</li>
			<li><i class="icon-directions"></i> icon-directions</li>
			<li><i class="icon-docs"></i> icon-docs</li>
			<li><i class="icon-drawer"></i> icon-drawer</li>
			<li><i class="icon-drop"></i> icon-drop</li>
			<li><i class="icon-earphones"></i> icon-earphones</li>
			<li><i class="icon-earphones-alt"></i> icon-earphones-alt</li>
			<li><i class="icon-feed"></i> icon-feed</li>
			<li><i class="icon-film"></i> icon-film</li>
			<li><i class="icon-folder-alt"></i> icon-folder-alt</li>
			<li><i class="icon-frame"></i> icon-frame</li>
			<li><i class="icon-globe"></i> icon-globe</li>
			<li><i class="icon-globe-alt"></i> icon-globe-alt</li>
			<li><i class="icon-handbag"></i> icon-handbag</li>
			<li><i class="icon-layers"></i> icon-layers</li>
			<li><i class="icon-map"></i> icon-map</li>
			<li><i class="icon-picture"></i> icon-picture</li>
			<li><i class="icon-pin"></i> icon-pin</li>
			<li><i class="icon-playlist"></i> icon-playlist</li>
			<li><i class="icon-present"></i> icon-present</li>
			<li><i class="icon-printer"></i> icon-printer</li>
			<li><i class="icon-puzzle"></i> icon-puzzle</li>
			<li><i class="icon-speech"></i> icon-speech</li>
			<li><i class="icon-vector"></i> icon-vector</li>
			<li><i class="icon-wallet"></i> icon-wallet</li>
			<li><i class="icon-arrow-down"></i> icon-arrow-down</li>
			<li><i class="icon-arrow-left"></i> icon-arrow-left</li>
			<li><i class="icon-arrow-right"></i> icon-arrow-right</li>
			<li><i class="icon-arrow-up"></i> icon-arrow-up</li>
			<li><i class="icon-bar-chart"></i> icon-bar-chart</li>
			<li><i class="icon-bulb"></i> icon-bulb</li>
			<li><i class="icon-calendar"></i> icon-calendar</li>
			<li><i class="icon-control-end"></i> icon-control-end</li>
			<li><i class="icon-control-forward"></i> icon-control-forward</li>
			<li><i class="icon-control-pause"></i> icon-control-pause</li>
			<li><i class="icon-control-play"></i> icon-control-play</li>
			<li><i class="icon-control-rewind"></i> icon-control-rewind</li>
			<li><i class="icon-control-start"></i> icon-control-start</li>
			<li><i class="icon-cursor"></i> icon-cursor</li>
			<li><i class="icon-dislike"></i> icon-dislike</li>
			<li><i class="icon-equalizer"></i> icon-equalizer</li>
			<li><i class="icon-graph"></i> icon-graph</li>
			<li><i class="icon-grid"></i> icon-grid</li>
			<li><i class="icon-home"></i> icon-home</li>
			<li><i class="icon-like"></i> icon-like</li>
			<li><i class="icon-list"></i> icon-list</li>
			<li><i class="icon-login"></i> icon-login</li>
			<li><i class="icon-logout"></i> icon-logout</li>
			<li><i class="icon-loop"></i> icon-loop</li>
			<li><i class="icon-microphone"></i> icon-microphone</li>
			<li><i class="icon-music-tone"></i> icon-music-tone</li>
			<li><i class="icon-music-tone-alt"></i> icon-music-tone-alt</li>
			<li><i class="icon-note"></i> icon-note</li>
			<li><i class="icon-pencil"></i> icon-pencil</li>
			<li><i class="icon-pie-chart"></i> icon-pie-chart</li>
			<li><i class="icon-question"></i> icon-question</li>
			<li><i class="icon-rocket"></i> icon-rocket</li>
			<li><i class="icon-share"></i> icon-share</li>
			<li><i class="icon-share-alt"></i> icon-share-alt</li>
			<li><i class="icon-shuffle"></i> icon-shuffle</li>
			<li><i class="icon-size-actual"></i> icon-size-actual</li>
			<li><i class="icon-size-fullscreen"></i> icon-size-fullscreen</li>
			<li><i class="icon-support"></i> icon-support</li>
			<li><i class="icon-tag"></i> icon-tag</li>
			<li><i class="icon-trash"></i> icon-trash</li>
			<li><i class="icon-umbrella"></i> icon-umbrella</li>
			<li><i class="icon-wrench"></i> icon-wrench</li>
			<li><i class="icon-ban"></i> icon-ban</li>
			<li><i class="icon-bubble"></i> icon-bubble</li>
			<li><i class="icon-camcorder"></i> icon-camcorder</li>
			<li><i class="icon-camera"></i> icon-camera</li>
			<li><i class="icon-check"></i> icon-check</li>
			<li><i class="icon-clock"></i> icon-clock</li>
			<li><i class="icon-close"></i> icon-close</li>
			<li><i class="icon-cloud-download"></i> icon-cloud-download</li>
			<li><i class="icon-cloud-upload"></i> icon-cloud-upload</li>
			<li><i class="icon-doc"></i> icon-doc</li>
			<li><i class="icon-envelope"></i> icon-envelope</li>
			<li><i class="icon-eye"></i> icon-eye</li>
			<li><i class="icon-flag"></i> icon-flag</li>
			<li><i class="icon-folder"></i> icon-folder</li>
			<li><i class="icon-heart"></i> icon-heart</li>
			<li><i class="icon-info"></i> icon-info</li>
			<li><i class="icon-key"></i> icon-key</li>
			<li><i class="icon-link"></i> icon-link</li>
			<li><i class="icon-lock"></i> icon-lock</li>
			<li><i class="icon-lock-open"></i> icon-lock-open</li>
			<li><i class="icon-magnifier"></i> icon-magnifier</li>
			<li><i class="icon-magnifier-add"></i> icon-magnifier-add</li>
			<li><i class="icon-magnifier-remove"></i> icon-magnifier-remove
			</li>
			<li><i class="icon-paper-clip"></i> icon-paper-clip</li>
			<li><i class="icon-paper-plane"></i> icon-paper-plane</li>
			<li><i class="icon-plus"></i> icon-plus</li>
			<li><i class="icon-pointer"></i> icon-pointer</li>
			<li><i class="icon-power"></i> icon-power</li>
			<li><i class="icon-refresh"></i> icon-refresh</li>
			<li><i class="icon-reload"></i> icon-reload</li>
			<li><i class="icon-settings"></i> icon-settings</li>
			<li><i class="icon-star"></i> icon-star</li>
			<li><i class="icon-symbol-female"></i> icon-symbol-female</li>
			<li><i class="icon-symbol-male"></i> icon-symbol-male</li>
			<li><i class="icon-target"></i> icon-target</li>
			<li><i class="icon-volume-1"></i> icon-volume-1</li>
			<li><i class="icon-volume-2"></i> icon-volume-2</li>
			<li><i class="icon-volume-off"></i> icon-volume-off</li>

		</ul>



	</div>
</body>