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
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
    <tr>
        <th>月份</th>
        <th>利润</th>
    </tr>
    </thead>
     <c:forEach items="${list}" var="list" varStatus="l">
      <tr>
      <c:if test="${list.month!=null}">
       <td>${list.month}</td>
        <td>￥${list.price}</td>
      </c:if>
        </tr>
     </c:forEach>
 </table>
<!--  <div class="panel-foot text-center"> -->
<%--       <pg:pager  url="${ctx}/order_order.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" > --%>
<%-- 		<pg:last>   --%>
<%-- 			共${pagers.total}记录,共${pageNumber}页,   --%>
<%-- 		</pg:last>   --%>
<%-- 			当前第${curPage}页  --%>
  
<%--         <pg:first>   --%>
<%--     		<a href="${pageUrl}">首页</a>   --%>
<%-- 		</pg:first>   --%>
<%-- 		<pg:prev>   --%>
<%--     		<a href="${pageUrl}">上一页</a>   --%>
<%-- 		</pg:prev>   --%>
      
<%--        	<pg:pages>   --%>
<%--         	<c:choose>   --%>
<%--             	<c:when test="${curPage eq pageNumber}">   --%>
<%--                 	<font color="red">[${pageNumber }]</font>   --%>
<%--             	</c:when>   --%>
<%--             	<c:otherwise>   --%>
<%--                		<a href="${pageUrl}">${pageNumber}</a>   --%>
<%--             	</c:otherwise>   --%>
<%--         	</c:choose>   --%>
<%--     	</pg:pages> --%>
             
<%--         <pg:next>   --%>
<%--     		<a href="${pageUrl}">下一页</a>   --%>
<%-- 		</pg:next>   --%>
<%-- 		<pg:last>   --%>
<%-- 			<c:choose>   --%>
<%--             	<c:when test="${curPage eq pageNumber}">   --%>
<!--                 	<font color="red">尾页</font>   -->
<%--             	</c:when>   --%>
<%--             	<c:otherwise>   --%>
<%--                		<a href="${pageUrl}">尾页</a>   --%>
<%--             	</c:otherwise>   --%>
<%--         	</c:choose>  --%>
    		  
<%-- 		</pg:last> --%>
<%-- 	</pg:pager> --%>
<!--     </div> -->
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