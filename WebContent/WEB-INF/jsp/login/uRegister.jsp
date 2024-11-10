<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../../../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link href="${ctx}/resource/common/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resource/common/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${ctx}/resource/common/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!--//fonts-->
<script type="text/javascript" src="${ctx}/resource/common/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/js/easing.js"></script>
				<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
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
			<h2 class="account-in">用户注册</h2>
				<div>
					<span>用户名&nbsp;&nbsp;&nbsp;</span>
					<input type="text" name="loginName" id="loginName">
				</div> 	
				<div>			
					<span>姓&nbsp;&nbsp;名&nbsp;&nbsp;</span>
					<input type="text" name="realName" id="realName"> 
				</div>	
				<div> 	
					<span>密&nbsp;&nbsp;码&nbsp;&nbsp;</span>
					<input type="password" name="passWord" id="passWord"> 
				</div>
				<div> 
					<span>确认密码&nbsp;&nbsp;</span>
					<input type="password" name="passWord1"id="passWord1" onblur="checkRspassword()">
				</div>	
				<div> 
					<span>手机号码&nbsp;&nbsp;</span>
					<input type="text" name="phone" id="phone">
				</div>	
				<div> 
					<span>电子邮箱&nbsp;&nbsp;</span>
					<input type="text" name="email" id="email">
				</div>				
				<div> 
					<span>找回密码问题</span>
					<input type="text" name="question" id="question">
				</div>	
				<div> 
					<span>找回密码答案</span>
					<input type="text" name="answer" id="answer">
				</div>				
					<input type="submit" value="注册" style="margin-left: 129px;" onclick="register();"/> 
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
 
 //验证确认密码是否一致
 function checkRspassword(){
	    var password = $("#passWord").val();
	    //获取密码框里内容
	    var password1 = $("#passWord1").val();;
	    if (password != password1) {
	    	alert("两次输入密码不一致！");
	    }
 }
 
 
 
 
	   //注册验证
	function register(){
		   var loginName= $("#loginName").val();
		   var realName= $("#realName").val();
			var passWord = $("#passWord").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var question = $("#question").val();
			var answer = $("#answer").val();
	 		$.ajax({
	              url: ctx+'/user_register.do',
	 			type: 'POST',
	 			dataType: 'json',
	 		    data: {loginName:loginName,passWord:passWord,realName:realName,phone:phone,email:email,question:question,answer:answer},
	 			async: false,
	 			success : function(data) {
	 				if(data.result == 1){
	 					 alert("注册成功");
	 					location.href='${ctx}/login_login.do?role=1';
	 					}else{
	 					     if(data.result == 2){
	 					    	 alert("该用户已经注册过");
	 					     }
	 					}
	 			},
	 				error : function() {
	 					alert("error");
	 				}
	 		});
	   }
			
		
   
	</script>
</html>