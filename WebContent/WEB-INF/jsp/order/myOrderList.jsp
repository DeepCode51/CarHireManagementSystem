<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单列表</title>
<link href="${ctx}/resource/common/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resource/common/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="${ctx}/resource/common/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/resource/common/css/cart.css"rel="stylesheet" type="text/css" media="all"/>	
<link rel="stylesheet" href="${ctx}/resource/css/tips.css" type="text/css">

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

<script>
//弹出框
var orderId=null;
function showDialog(id){
	orderId=id;
	$('#tip_newComment').show();
}
//取消弹出框
function cancel(){
	 var comment= $("#comment").val('');
	$('#tip_newComment').hide();
}

//提交评论
function addComment(){
	var content = $("#content").val();
	$.ajax({
         url: ctx+'/comment_exAdd.do',
		type: 'POST',
		dataType: 'json',
	    data: {content:content,orderId:orderId},
		async: false,
		success : function(data) {
			if(data.result == 1){
				  alert("评论成功,谢谢下次光临");
				  cancel();
				 window.location.href='${ctx}/order_findByUserId.do';
				}else{
				}
		},
			error : function() {
				alert("error");
			}
	});
}
</script>



</head>
<body>
<%@ include file="/common/menu.jsp" %>
	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<ul>
					<li class="current"></li>
					 <li style="margin-left: 170px;color: #a4c8cc;font-size: 20px;margin-top: 2px; list-style-type:none">租车记录</li>
				</ul>
			</div>
			<form action="${ctx }/order_findOrderByUserId.do" method="post">
			<div class="step step1">
				<ul>
					<input type="text" placeholder="订单编号"  name="code" onfocus="this.value = '';" value="${code}" />
					<input type="submit" value="查询" />
				</ul>
			</div>
			</form>
			<table>
				<tbody>
				
                              <tr>
                                <th>订单编号</th>
						        <th>汽车品牌</th>
						        <th>汽车型号</th>
						        <th>审批状态</th>
						        <th>汽车牌号</th>
						        <th>汽车图片</th>
						        <th>租车时间</th>
						        <th>还车时间</th>
                                <th>操作</th>
                              </tr>  
                               <c:forEach items="${pagers.datas}" var="order" varStatus="l"> 
                                 <tr>
                                 <td>${order.code}</td>
                                 <td>${order.car.carCategory.cname}</td>
                                  <td>${order.car.carType}</td>
                                  <td>
                                  <c:if test="${order.state==0}">
                                                                                                          未通过
                                  </c:if>
                                  <c:if test="${order.state==1}">
                                                                                                          已通过
                                  </c:if>
                                  </td>
                                  <td>${order.car.carNumber}</td>
                                 <td><a href="${ctx}/car_uCar.do?id=${order.car.id}"><img src="${order.car.carImage}"/></a></td>
                                 <td><fmt:formatDate value="${order.rent.rentTime}" pattern="yyyy-MM-dd"/></td>
                                 <td><fmt:formatDate value="${order.rent.returnTime}" pattern="yyyy-MM-dd"/></td>
                                 <td><a href="${ctx}/order_getByOrderId.do?id=${order.id}&flag=1">点击详情</a></td>
                                 </tr>                         
                               </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="panel-foot text-center" style="margin: 0 auto; width: 350px" >
      <pg:pager  url="${ctx}/order_findOrderByUserId.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
			<pg:param name="code" value="${order.code}"/>
		<pg:last>  
			共${pagers.total}记录,共${pageNumber}页,  
		</pg:last>  
			当前第${curPage}页 
  
        <pg:first>  
    		<a href="${pageUrl}">首页</a>  
		</pg:first>  
		<pg:prev>  
    		<a href="${pageUrl}">上一页</a>  
		</pg:prev>  
      
       	<pg:pages>  
        	<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">[${pageNumber }]</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">${pageNumber}</a>  
            	</c:otherwise>  
        	</c:choose>  
    	</pg:pages>
             
        <pg:next>  
    		<a href="${pageUrl}">下一页</a>  
		</pg:next>  
		<pg:last>  
			<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">尾页</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">尾页</a>  
            	</c:otherwise>  
        	</c:choose> 
    		  
		</pg:last>
	</pg:pager>
    </div>
	
<%@ include file="/common/footer.jsp" %>	
</body>
</html>