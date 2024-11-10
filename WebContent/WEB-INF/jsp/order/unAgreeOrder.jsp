<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>后台管理系统</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
      <link rel="stylesheet" href="${ctx}/resource/css/jquery.datetimepicker.css"   >
    <script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/ckform.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/common.js"></script>
    <script src="${ctx}/resource/js/jquery.datetimepicker.js"></script>
</head>
  <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
       td{text-align:center;}
    </style>
<body>
<form class="form-inline definewidth m20" action="order_order.do" method="post">  
  订单时间：
    <input type="text" name="startTime" id="startTime"class="abc input-default" placeholder="" value="${startTime}">-- 
     <input type="text" name="endTime" id="endTime"class="abc input-default" placeholder="" value="${endTime}"> 
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="unAgreeOrder">查看未审批订单</button>
    &nbsp;&nbsp;<button type="button" class="btn btn-success" id="unFinishOrder">查看未完成订单</button>
</form>
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
    <tr>
        <th>订单编号</th>
        <th>订单时间</th>
        <th>租车用户名</th>
        <th>租车用户姓名</th>
        <th>手机号</th>
        <th>汽车编号</th>
        <th>租车时间</th>
        <th>还车时间</th>
        <th>交易金额</th>
        <th>订单审批情况</th>
        <th>订单完成情况</th>
<!--         <th>状态</th> -->
         <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="order" varStatus="l">
      <tr>
            <td>${order.code}</td>
            <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd"/></td>
            <td>${order.user.loginName}</td>
            <td>${order.user.realName}</td>
            <td>${order.user.phone}</td>
            <td>${order.car.id}</td>
            <td><fmt:formatDate value="${order.rent.rentTime}" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${order.rent.returnTime}" pattern="yyyy-MM-dd"/></td>
            <td>￥${order.totalPrice}</td>
              <td>
               <c:if test="${order.state == 0 }">
                                            未审核
               </c:if>
               <c:if test="${order.state == 1 }">
                                           已审核
               </c:if>
            </td>
             <td>
               <c:if test="${order.isDeal == 0 }">
                                            未交易
               </c:if>
               <c:if test="${order.isDeal == 1 }">
                                           已交易
               </c:if>
            </td>
<!--               <td> -->
<%--                <c:if test="${order.isDelete == 0 }"> --%>
<!--                                               正常 -->
<%--                </c:if> --%>
<%--                <c:if test="${order.isDelete == 1 }"> --%>
<!--                                              删除 -->
<%--                </c:if> --%>
<!--             </td> -->
               <td>
                <c:if test="${order.state == 0 }">
                 <a id="update" href="${ctx}/order_view.do?id=${order.id}&flag=2">修改审批情况</a>
                   &nbsp;&nbsp;
               </c:if>
                <c:if test="${order.state==1&&order.isDeal == 0 }">
                 <a id="update" href="${ctx}/order_view.do?id=${order.id}&flag=3">修改交易情况</a>
                   &nbsp;&nbsp;
                 </c:if>
                 <a id="update" href="${ctx}/order_view.do?id=${order.id}&flag=1">详情</a>
                 &nbsp;&nbsp;
                 <a id="update" href="${ctx}/order_delete.do?id=${order.id}" onclick= "if(confirm( '是否删除！ ')==false)return   false; ">删除</a>
               
            </td>
        </tr>
     </c:forEach>
 </table>
 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/order_order.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
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
</body>
<script>
    $(function () {
		$('#add').click(function(){
			window.location.href="${ctx}/order_add.do";
		 });
    });
    //未通过审批
    $(function () {
		$('#unAgreeOrder').click(function(){
			window.location.href="${ctx}/order_unAgreeOrder.do";
		 });
    });
  //未完成交易
    $(function () {
		$('#unFinishOrder').click(function(){
			window.location.href="${ctx}/order_unFinishOrder.do";
		 });
    });
  //加载日期插件
    $('#startTime').datetimepicker({
    	timepicker:false,
    	format:'Y-m-d',
    	formatDate:'Y-m-d',
    	lang:'ch',
    });
    //加载日期插件
    $('#endTime').datetimepicker({
    	timepicker:false,
    	format:'Y-m-d',
    	formatDate:'Y-m-d',
    	lang:'ch',
    });
</script>