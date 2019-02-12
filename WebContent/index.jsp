<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp"%>

<SCRIPT language=javascript>
	function reg() {
		window.location = "reg.jsp";
	}
	function lost() {
		window.location = "lost.jsp";
	}
</SCRIPT>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
}

body {
	height: 100%;
	background: #fff url(images/CorporatePersonnel2.jpg) 35% 35% no-repeat;
	background-size: cover;
}

.dowebok {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 430px;
	height: 430px;
	margin: -300px 0 0 -215px;
	border: 1px solid #fff;
	border-radius: 20px;
	overflow: hidden;
}

.logo {
	width: 104px;
	height: 104px;
	margin: 50px auto 80px;
	background: url(images/head2.png) 0 0 no-repeat;
}

.form-item {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.form-item input {
	width: 288px;
	height: 48px;
	padding-left: 70px;
	border: 1px solid #fff;
	border-radius: 25px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
}

.form-item button {
	width: 360px;
	height: 50px;
	border: 0;
	border-radius: 25px;
	font-size: 18px;
	color: #1f6f4a;
	outline: none;
	cursor: pointer;
	background-color: #fff;
}

#username {
	background: url(images/emil.png) 20px 14px no-repeat;
}

#password {
	background: url(images/password.png) 23px 11px no-repeat;
}

.tip {
	display: none;
	position: absolute;
	left: 20px;
	top: 52px;
	font-size: 14px;
	color: #f50;
}

.reg-bar {
	width: 360px;
	margin: 20px auto 0;
	font-size: 14px;
	overflow: hidden;
}

.reg-bar a {
	color: #fff;
	text-decoration: none;
}

.reg-bar a:hover {
	text-decoration: underline;
}

.reg-bar .reg {
	float: left;
}

.reg-bar .forget {
	float: right;
}

.dowebok ::-webkit-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok ::-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-ms-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

@media screen and (max-width: 500px) {
	* {
		box-sizing: border-box;
	}
	.dowebok {
		position: static;
		width: auto;
		height: auto;
		margin: 0 30px;
		border: 0;
		border-radius: 0;
	}
	.logo {
		margin: 50px auto;
	}
	.form-item {
		width: auto;
	}
	.form-item input, .form-item button, .reg-bar {
		width: 100%;
	}
}

.radio {
	display: inline-block;
	position: relative;
	line-height: 18px;
	margin-right: 10px;
	cursor: pointer;
}

.radio input {
	display: none;
}

.radio .radio-bg {
	display: inline-block;
	height: 18px;
	width: 18px;
	margin-right: 5px;
	padding: 0;
	border-radius: 100%;
	vertical-align: top;
	box-shadow: 0 1px 15px rgba(0, 0, 0, 0.1) inset, 0 1px 4px
		rgba(0, 0, 0, 0.1) inset, 1px -1px 2px rgba(0, 0, 0, 0.1);
	cursor: pointer;
	transition: all 0.2s ease;
}

.radio .radio-on {
	display: none;
}

.radio input:checked+span.radio-on {
	width: 10px;
	height: 10px;
	position: absolute;
	border-radius: 100%;
	background: #FFFFFF;
	top: 4px;
	left: 4px;
	box-shadow: 0 2px 5px 1px rgba(0, 0, 0, 0.3), 0 0 1px
		rgba(255, 255, 255, 0.4) inset;
	background-image: linear-gradient(#ffffff 0, #e7e7e7 100%);
	transform: scale(0, 0);
	transition: all 0.2s ease;
	transform: scale(1, 1);
	display: inline-block;
}

#fontStyle {
	font-size: 12px;
	font-weight: bold;
	line-height: 2;
	color:#FFFFFF;
}
</style>

<div class="dowebok">

	<div
		style="width: 400px; height: 90px; padding-left: 175px; padding-top: 10px;">
		<div
			style="width: 74px; height: 74px; float: left; border-radius: 50%; border: 3px solid #eee; overflow: hidden;">
			<img src="images/headline.jpg" width="80" height="80"
				style="margin-top: -6px; margin-left: -6px" />
		</div>
	</div>
	<form name="loginform" method="post" action="<%=basePath %>AdminServlet"> 
	<div class="form-item">
		<input id="username" type="text" placeholder="用户名" name="username" required>
		<input type=hidden name=method value="one"/> 
		<p class="tip">请输入合法的用户名</p>
	</div>
	<div class="form-item">
		<input id="password" type="password"
			placeholder="登录密码" name="password" required>
		<p class="tip">用户名或密码不正确</p>
	</div>
	<div class="form-item" style="margin-left: 90px">
		<!-- <input type="radio" name="sf" value="用户" checked> 用户
             <input type="radio" name="sf" value="高级用户"> 高级用户
              <input type="radio" name="sf" value="管理员" > 管理员 -->
		<label for="user" class="radio" style="font-size:14px;font-weight:bold;color:white;"> <span class="radio-bg"></span>
			<input type="radio" id="user" name="sf" value="用户" checked="checked" />
			用户 <span class="radio-on"></span>
		</label> <label for="vip" class="radio" style="font-size:14px;font-weight:bold;color:white;"> <span class="radio-bg"></span>
			<input type="radio" id="vip" name="sf" value="高级用户" /> 高级用户<span class="radio-on"></span>
		</label> <label for="manager" class="radio" style="font-size:14px;font-weight:bold;color:white;"> <span class="radio-bg"></span>
			<input type="radio" id="manager" name="sf" value="管理员" />管理员 <span class="radio-on"></span>
		</label>
	</div>
	<div class="form-item">
		<button id="submit">登 录</button>
	</div>
	<div class="reg-bar">
		<a class="reg" href="javascript:">立即注册</a> <a class="forget"
			href="javascript:">忘记密码</a>
	</div>
	</form>
</div>
<%@ include file="iframe/foot.jsp"%>