<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
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
<!--fonts-->
<!--//fonts-->
<script type="text/javascript" src="${ctx}/resource/common/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/js/easing.js"></script>
<!--slider-script-->
		<script src="${ctx}/resource/js/responsiveslides.min.js"></script>
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
  <!--header-->
		<div class="header">
		<div class="header-top">
			<div class="container">	
			<div class="header-top-in">			
				<div class="logo">
						<a href=""></a>
					<h1><span style="color: white;">未央租车网</span></h1>
				</div>
				<div class="header-in">
					<ul class="icon1 sub-icon1">
					<c:if test="${session.loginName==null }">
							<li  ><a href="${ctx}/login_login.do?role=1">登录</a> </li>
							<li  ><a href="${ctx}/login_register.do">注册</a></li>
				    </c:if>
				        <c:if test="${session.loginName!=null }">
				        	<li  ><a>你好！：${loginName}</a></li>
				        </c:if>
							<li ><a href="${ctx}/login_login.do?role=2"  target="_blank">管理员登录</a></li>
							<li > <a href="${ctx}/login_tuichu.do?role=1" >退出</a> </li>	
						</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
		</div>
		<div class="header-bottom">
		<div class="container">
			<div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="${ctx}/login_index.do?role=1"><i> </i>首页</a></li>
					  <li ><a href="#" ></a></li> 	
					   <li style="margin-left: 100px;"><a href="${ctx}/user_myInfo.do" >个人中心</a></li>            
						<li style="margin-left: 100px;"><a href="${ctx}/order_findOrderByUserId.do" >我的订单</a></li>						  				 
						<li style="margin-left: 100px;"><a href="${ctx}/order_rentInfoList.do" >租车记录</a></li>
					<div style="float: left;padding: 1.93em">
						<div class="header-can">
							<div class="search" style="width: 35%">
								<form action="${ctx }/login_index.do?role=1" method="post">
									<input type="text" placeholder="车名"  name="keyword" onfocus="this.value = '';" value="${a}" />
									<input type="submit" value="">
								</form>
							</div>

							<div class="clearfix"> </div>
						</div>
					</div>
				</ul>
				<script type="text/javascript" src="${ctx}/resource/js/nav.js"></script>
			</div>
		</div>
		</div>
<%--		<div class="header-bottom-in">--%>
<%--			<div class="container">--%>
<%--			<div class="header-bottom-on">--%>

<%--			<div class="clearfix"></div>--%>
<%--		</div>--%>
<%--		</div>--%>
<%--		</div>--%>
	</div>
		<!---->
		<div class="container">
		
<!-- 		<div class="clearfix"></div> -->
		<div class="container">
			<div class="products">
					<h2 class=" products-in">租车推荐 &nbsp;&nbsp;<a href="${ctx}/car_uCarList.do"><span style="color: #a4c8cc">租车列表>></span></a></h2>
						 <c:forEach items="${newestList}" var="newest" varStatus="l">
						 <c:if test="${(l.index) % 4 == 0 }">
						  <div class="top-products">
						 </c:if>
						  <div class="col-md-3 md-col">
							<div class="col-md">
								<a href="${ctx}/car_uCar.do?id=${newest.id}" class="compare-in"><img  src="${newest.carImage}" alt="${newest.carType}" style="width: 239.21px;height: 150.71px"/></a>	
								<div class="top-content">
									<div class="white">
										<p class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "><span class="in-dollar">${newest.carType}</span></p>
										<p class="dollar"><span class="in-dollar">￥${newest.dailyPrice}</span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
						 	</div>
						  </div>
					     	<c:if test="${(l.index+1) % 4 == 0 }">
						       <div class="clearfix"></div>
						       </div>
						   </c:if>
						</c:forEach>	
			 </div>
			 
				<div class="clearfix"></div>
<%--				<div class="products">--%>
<%--					<h2 class="products-in">好车推荐 &nbsp;&nbsp;<a href="${ctx}/car_uCarList.do?isRecommend=1"><span style="color: red">更多>>></span></a></h2>--%>
<%--					 <c:forEach items="${recommendList}" var="recommend" varStatus="l">--%>
<%--						 <c:if test="${(l.index) % 4 == 0 }">--%>
<%--						  <div class="top-products">--%>
<%--						 </c:if>--%>
<%--						  <div class="col-md-3 md-col">--%>
<%--							<div class="col-md">--%>
<%--								<a href="${ctx}/car_uCar.do?id=${recommend.id}"><img  src="${recommend.carImage}" alt="${recommend.carType}" style="width: 239.21px;height: 150.71px"/></a>	--%>
<%--								<div class="top-content">--%>
<%--									<div class="white">--%>
<%--									<p class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "><span class="in-dollar">${recommend.carType}</span></p>--%>
<%--										<p class="dollar"><span class="in-dollar">￥${recommend.dailyPrice}</span></p>--%>
<%--										<div class="clearfix"></div>--%>
<%--									</div>--%>
<%--								</div>							--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<c:if test="${(l.index+1) % 4 == 0 }">--%>
<%--						       <div class="clearfix"></div>--%>
<%--						       </div>--%>
<%--						   </c:if>--%>
<%--						</c:forEach>	--%>
<%--					</div>--%>
					
				<div class="clearfix"></div>
<%--					<div class="products">--%>
<%--					<h2 class="products-in">打折优惠 &nbsp;&nbsp;<a href="${ctx}/car_uCarList.do?isDiscount=1"><span style="color: red">更多>>></span></a></h2>--%>
<%--					 <c:forEach items="${discountList}" var="discount" varStatus="l">--%>
<%--						 <c:if test="${(l.index) % 4 == 0 }">--%>
<%--						  <div class="top-products">--%>
<%--						 </c:if>--%>
<%--						  <div class="col-md-3 md-col">--%>
<%--							<div class="col-md">--%>
<%--								<a href="${ctx}/car_uCar.do?id=${discount.id}"><img  src="${discount.carImage}" alt="${discount.carType}" style="width: 239.21px;height: 150.71px"/></a>	--%>
<%--								<div class="top-content">--%>
<%--									<div class="white">--%>
<%--										<p class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "><span class="in-dollar">${discount.carType}</span></p>--%>
<%--										<p class="dollar"><span class="in-dollar">￥${discount.dailyPrice}</span></p>--%>
<%--										<div class="clearfix"></div>--%>
<%--									</div>--%>
<%--								</div>							--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<c:if test="${(l.index+1) % 4 == 0 }">--%>
<%--						       <div class="clearfix"></div>--%>
<%--						       </div>--%>
<%--						   </c:if>--%>
<%--						</c:forEach>	--%>
<%--					</div>--%>
					
					
				</div>	
			</div>
		</div>
		<%@ include file="/common/footer.jsp" %>
</body>
</html>