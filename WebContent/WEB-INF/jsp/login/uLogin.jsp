<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="${ctx}/resource/common/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resource/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${ctx}/resource/common/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!-- <link href='http://fonts.useso.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'> -->
<!--//fonts-->
<script type="text/javascript" src="${ctx}/resource/common/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/js/easing.js"></script>
<!--slider-script-->
		<script src="${ctx}/resource/common/js/responsiveslides.min.js"></script>
			<script>
				$(function () {
				  $("#slider1").responsiveSlides({
					auto: true,
					speed: 500,
					namespace: "callbacks",
					pager: true,
				  });
				});
			</script>
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
</head>
<body>
<%@ include file="/common/menu.jsp" %>
<div class="container">
		<div class="account">
			<h2 class="account-in">用户登录</h2>
				<div>
					<span>登录名</span>
					<input type="text" name="loginName" id="loginName">
				</div> 	
				<div> 	
					<span>密 码</span>
					<input type="password" name="passWord" id="passWord"> 
				</div>
					<input type="submit" value="登录" id="submit" name="submit" onclick="check()">
					<input type="submit" value="注册" id="submit" name="submit" onclick="register()"> 
					 <a href="${ctx}/login_forgetPassWord.do" style="margin-left: 222px;">忘记密码</a>
		             <a href="${ctx}/login_login.do?role=2" style="margin-left: 42px;"  target="_blank">管理员登录</a>
		</div>
	</div>
 <div class="footer" style="position: fixed;bottom: 0px;width: 100%">
		<p class="footer-class">Copyright &copy; 2022.Company name All rights reserved.</p>
		<script type="text/javascript">
					$(document).ready(function() {
						$().UItoTop({ easingType: 'easeOutQuart' });
						
					});
				</script>
			<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
		</div>
</body>
 <script>
	//登录验证
	function check(){
		 var loginName= $("#loginName").val();
			var passWord = $("#passWord").val();
	 		$.ajax({
	              url: ctx+'/user_login.do',
	 			type: 'POST',
	 			dataType: 'json',
	 		    data: {loginName:loginName,passWord:passWord},
	 			async: false,
	 			success : function(data) {
	 				if(data.result == 1){
	 					 alert("登录成功");
	 					 window.location.href='${ctx}/login_index.do?role=1';
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
	
	//跳入注册页面
	function register(){
		 window.location.href='${ctx}/login_register.do';
	}	
		
   
	</script>
</html>