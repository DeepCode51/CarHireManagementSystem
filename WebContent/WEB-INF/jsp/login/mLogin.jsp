<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords"
		content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />

	<link href="${ctx}/resource/css/style.css" rel='stylesheet'
		type='text/css' />
    <style type="text/css">
      body{
	background: url(${ctx }/resource/images/bg1.jpg) no-repeat 0px 0px;
	font-family: 'Open Sans', sans-serif;
	background-size:cover;
	-webkit-background-size:cover;
	-moz-background-size:cover;
	-o-background-size:cover;
	min-height:1050px;
}
.wrap{
	margin: 0 auto;
	width: 80%;
}
body a,form li,input[type="submit"],input[type="text"],.sixth-login input[type="submit"],.third-login input[type="submit"]{
	transition: 0.1s all;
	-webkit-transition: 0.1s all;
	-moz-transition: 0.1s all;
	-o-transition: 0.1s all;
}
/*--close--*/
.close{
background: url('${ctx }/resource/images/close.png') no-repeat 0px 0px;
  cursor: pointer;
  width: 20px;
  height: 20px;
  position: absolute;
  left: 20px;
  top: 20px;
  -webkit-transition: color 0.2s ease-in-out;
  -moz-transition: color 0.2s ease-in-out;
  -o-transition: color 0.2s ease-in-out;
  transition: color 0.2s ease-in-out;
}
/*--/close--*/
h1 {
	font-family: 'Exo 2', sans-serif;
	  text-align: center;
	  padding-top: 4em;
	  font-weight: 400;
	  color: #2B2B36;
	  font-size: 2em;
}
.login-form {
	border: 2px solid #fff;
	/*background: #2b2b36;*/
	position: relative;
	width: 30%;
	margin: 3% auto 0 auto;
	text-align: center;
	border-radius: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-o-border-radius: 15px;
}
.head img {
	width: 100%;
}
.avtar img {
  margin: 2em 0 0;
}
.head-info {
  padding: 5px 0;
  text-align: center;
  font-weight: 600;
  font-size: 2em;
  color: #fff;
  /*background: #23232e;*/
  height: 50px;
	border-top-left-radius: 10px;
	-webkit-border-top-left-radius: 10px;
	-moz-border-top-left-radius: 10px;
	-o-border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	-webkit-border-top-right-radius: 10px;
	-moz-border-top-right-radius: 10px;
	-o-border-top-right-radius: 10p
}
input[type="text"] {
	  width: 70%;
	  padding: 1em 2em 1em 3em;
	  color: #9199aa;
	  font-size: 18px;
	  outline: none;
	  background: url(${ctx }/resource/images/adm.png) no-repeat 10px 15px;
	  border: none;
	  font-weight: 100;
	  border-bottom: 1px solid#484856;
	  margin-top: 2em;
}
 input[type="password"]{
	  width: 70%;
	  padding: 1em 2em 1em 3em;
	  color: #dd3e3e;
	  font-size: 18px;
	  outline: none;
	  background: url(${ctx }/resource/images/key.png) no-repeat 10px 23px;
	  border: none;
	  font-weight: 100;
	  border-bottom: 1px solid#484856;
	  margin-bottom: 3em;
 }
.key {
   background: url(${ctx }/resource/images/pass.png) no-repeat 447px 17px;
}
input[type="submit"]{
  font-size: 30px;
  color: #fff;
  outline: none;
  border: none;
  background: #a4c8cc;
  width: 100%;
  padding: 18px 0;
  border-bottom-left-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-o-border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-o-border-bottom-right-radius: 15px;
	cursor: pointer;
}
input[type="submit"]:hover {
	background: #ff2775;
  border-bottom-left-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-o-border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-o-border-bottom-right-radius: 15px;
  	transition: 1s all;
	-webkit-transition: 1s all;
	-moz-transition: 1s all;
	-o-transition: 1s all;
}
label.lbl-1 {
  /*background: #6756ea;*/
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
  margin: 16px 10px 0px 0px;
}
label.lbl-2 {
  /*background: #ea569a;*/
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
   margin: 16px 10px 0px 0px;
}
label.lbl-3 {
  /*background: #f1c85f;*/
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
  margin: 16px 10px 0px 0px;
}
/*--copyrights--*/
.copy-rights{
	text-align: center;
	margin-top: 8em;
}
.copy-rights p{
	color:#FFF;
	font-size: 1em;
	line-height:1.8em;
}
.copy-rights p a{
	color:#ff2a75;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
	text-decoration:none;
}
.copy-rights p a:hover{
	color:#3faa53;
	text-decoration:none;
		transition: 0.1s all;
	-webkit-transition: 0.1s all;
	-moz-transition: 0.1s all;
	-o-transition: 0.1s all;
}
/*--/copyrights--*/
/*--start-responsive-design--*/
@media (max-width:1440px){
	.key {
	  background: url(${ctx }/resource/images/pass.png) no-repeat 376px 17px;
	}
	
	body {
	  min-height: 811px;
	}
}
@media (max-width:1366px){
	.key {
	  background: url(${ctx }/resource/images/pass.png) no-repeat 358px 19px;
	}
	.copy-rights {
	  margin-top: 3em;
	}
	body {
	  min-height: 768px;
	}
}
@media (max-width:1280px){
	.key {
	   background: url(${ctx }/resource/images/pass.png) no-repeat 336px 18px;
	}
	body {
	  min-height: 711px;
	}
	.copy-rights {
	  margin-top: 0.5em;
	}
}
@media (max-width:1024px){
	.login-form {
	  width: 37%;
	}
	.key {
	   background: url(${ctx }/resource/images/pass.png) no-repeat 339px 18px;
	}
	.copy-rights {
	  margin-top: 3em;
	}
	h1 {
	  padding-top: 2em;
	}
	body {
	  min-height: 675px;
	}
}
@media (max-width:768px){
	.login-form {
	  width: 50%;
	    margin: 12% auto 0 auto;
	}
	.key {
	  background: url(${ctx }/resource/images/pass.png) no-repeat 342px 18px;
	}
	body {
	  min-height: 929px;
	}
}
@media (max-width:640px){
	.login-form {
	  width: 60%;
	  margin: 20% auto 0 auto;
	}
	.key {
	  background: url(${ctx }/resource/images/pass.png) no-repeat 342px 19px;
	}
}
@media (max-width:480px){
	.login-form {
	  width: 80%;
	}
}
@media (max-width:320px){
	h1 {
	  padding-top: 1em;
	  font-size: 1.5em;
	}
	.login-form {
	  width: 90%;
	  margin: 10% auto 0 auto;
	}
	input[type="text"] {
	  width: 62%;
	  padding: 1.2em 2em .5em 2.5em;
	  font-size: 17px;
	  margin-top: .5em;
	}
	input[type="password"] {
		width: 62%;
		padding: 1.2em 2em .5em 2.5em;
		font-size: 17px;
		margin-top: .5em;
		margin-bottom: 2em;
		  background: url(${ctx }/resource/images/key.png) no-repeat 8px 23px;
	}
	.key {
	  background: url(${ctx }/resource/images/pass.png) no-repeat 235px 27px;
	}
	.avtar img {
	  margin: 1.1em 0 0;
	}
	.head-info {
	  height: 35px;
	  }
	label.lbl-1 {
	  margin: 8px 10px 0px 0px;
	}
	label.lbl-2 {
	  margin: 8px 10px 0px 0px;
	}
	label.lbl-3 {
	  margin: 8px 10px 0px 0px;
	}
	.close {
	  left: 16px;
	  top: 13px;
	}
	.copy-rights {
	  margin-top: 2em;
	}
	body {
	    min-height: 504px;
	}
	input[type="submit"] {
	  font-size: 28px;
	  padding: 10px 0;
	}
}
    </style>  
</head>
<body>
	<h1>未央汽车租赁后台登录页面</h1>
	<div class="login-form">
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
<%--			<img src="${ctx}/resource/images/avtar.png" />--%>
		</div>
<!-- 	     <form class="form-signin" method="post" > -->
			<input  type="text" class="text" name="adminName" id="adminName" placeholder="账号" />
			<div class="key">
				<input type="password" name="passWord" id="passWord" placeholder="密码" />
			</div>
				<div class="signin">
			 <input type="submit" value="登录" onclick="check();"/>
		</div>
<!-- 		</form> -->
	
	</div>
	<div class="copy-rights"></div>
 <script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
 <script type="application/x-javascript">
  addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<script type="text/javascript">
			function check(){
				 var adminName= $("#adminName").val();
					var passWord = $("#passWord").val();
					var params={adminName:adminName,passWord:passWord};
			 		$.ajax({
			            url: ctx+'/admin_index.do',
			 			type: 'POST',
			 			dataType: 'json',
			 		    data: params,
			 			async: false,
			 			success : function(data) {
			 			   if(data.result === 1){
								 alert("登录成功");
								 window.location.href='${ctx}/login_index.do?role=2';
								}else{
								     if(data.result == 2){
								    	 alert("密码输入错误");
								     }else{
								    	 if(data.result == 3){
								    		alert("该用户不存在"); 
								    	 }
								    	
								     }
								}
			 			},
			 				error : function() {
			 					alert("error");
			 				}
			 		});
			   }
	</script>

</body>
</html>

