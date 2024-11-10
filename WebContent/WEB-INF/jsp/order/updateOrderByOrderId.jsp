<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改订单</title>
<link href="${ctx}/resource/common/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resource/common/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${ctx}/resource/common/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/resource/common/css/cart.css"rel="stylesheet" type="text/css" media="all"/>	
<link rel="stylesheet" href="${ctx}/resource/common/css/tips.css" type="text/css">
<link rel="stylesheet" href="${ctx}/resource/common/css/jquery.datetimepicker.css"   >

<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!--//fonts-->
<script type="text/javascript" src="${ctx}/resource/common/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/js/easing.js"></script>
<!--slider-script-->
		<script src="${ctx}/resource/common/js/responsiveslides.min.js"></script>
		  <script src="${ctx}/resource/common/js/jquery.datetimepicker.js"></script>
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
	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<ul>
					<li class="current"></li>
					 <li style="margin-left: 170px;color: red;font-size: 25px; list-style-type:none">修改订单</li>
				</ul>
			</div>
			<form action="${ctx}/order_exUpdateOrderByOrderId.do" method="post">
			<input type="hidden" name="id" value="${order.id }"/>
			  <table>
				    <tbody>
                             <tr>
                                <th>汽车型号</th>
                                <td>${order.car.carType}</td>
                              </tr> 
                             <tr>
                               <th>汽车品牌</th>
                                <td>${order.car.carCategory.cname}</td>
                              </tr> 
                                <tr>
                                <th>汽车牌号</th>
                                <td>${order.car.carNumber}</td>
                              </tr>
                               <tr>
                                <th>汽油型号</th>
                                <td>${order.car.carOilType}</td>
                              </tr>
                              <tr>
                                <th>行驶里程</th>
                                <td>${order.car.distance}</td>
                              </tr>
                               <tr>
                                <th>单日租金</th>
                                <td>￥${order.car.dailyPrice}</td>
                              </tr>
                             <tr>
                                <th>汽车图片</th>
                                <td><a href="${ctx}/car_uCar.do?id=${order.car.id}"><img src="${order.car.carImage}"/></a></td>
                              </tr> 
                             <tr>
                                <th>租车时间</th>
                                <td><input type="text" name="rentTime" id="rentTime" value="${rentTime}" style="background-color:grey;color:black;border-color:green"/></td>
                              </tr> 
                             <tr>
                               <th>还车时间</th>
                                <td><input type="text" name="returnTime" id="returnTime" value="${returnTime}" style="background-color:grey;color:black;border-color:green"/></td>
                              </tr> 
                                <tr>
                                <th>审批状态</th>
                                 <td>
                                  <c:if test="${order.state==0}">
                                                                                                          未通过
                                  </c:if>
                                  <c:if test="${order.state==1}">
                                                                                                          已通过
                                  </c:if>
                                  </td>
                              </tr> 
                                 <tr>
                                <th></th>
                                 <td>
                                  <button type="submit" style="background-color: red" id="save">确认修改</button>
                                  </td>
                              </tr> 
				</tbody>
		     	</table>
		     	</form>
		</div>
	</div>
	
	
	
<%@ include file="/common/footer.jsp" %>	
</body>
<script type="text/javascript">
//加载日期插件
$('#rentTime').datetimepicker({
	timepicker:false,
	format:'Y-m-d',
	formatDate:'Y-m-d',
	lang:'ch',
});

//加载日期插件
$('#returnTime').datetimepicker({
	timepicker:false,
	format:'Y-m-d',
	formatDate:'Y-m-d',
	lang:'ch',
});
</script>
</html>