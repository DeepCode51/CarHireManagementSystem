<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ctx}/resource/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/assets/css/main-min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/bui-min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/js/config-min.js"></script>
<script>
BUI.use('common/main',function(){
    var config = [
{
    "id": "1", 
    "menu": [
        {
            "text": "用户管理", 
            "items": [
                {
                    "id": "101", 
                    "text": "用户管理", 
                    "href": "${ctx}/user_user.do"
                }
            ]
        }
    ]
},
{
    "id": "2", 
    "menu": [
        {
            "text": "管理员管理", 
            "items": [
                {
                    "id": "201", 
                    "text": "管理员管理", 
                    "href": "${ctx}/admin_admin.do"
                }
            ]
        }
    ]
},
{
    "id": "3", 
    "menu": [
        {
            "text": "订单管理", 
            "items": [
                {
                    "id": "301", 
                    "text": "订单管理", 
                    "href": "${ctx}/order_order.do"
                }
            ]
        }
    ]
},
{
    "id": "4", 
    "menu": [
        {
            "text": "利润统计", 
            "items": [
                {
                    "id": "401", 
                    "text": "利润统计", 
                    "href": "${ctx}/order_tongji.do"
                }
            ]
        }
    ]
},
{
    "id": "5", 
    "menu": [
        {
            "text": "交易流水", 
            "items": [
                {
                    "id": "501", 
                    "text": "交易流水", 
                    "href": "${ctx}/order_hasFinishedOrder.do"
                }
            ]
        }
    ]
},
{
    "id": "6", 
    "menu": [
        {
            "text": "车辆管理", 
            "items": [
                {
                    "id": "601", 
                    "text": "车辆管理", 
                    "href": "${ctx}/car_car.do"
                },
                {
                    "id": "602", 
                    "text": "车辆品牌管理", 
                    "href": "${ctx}/carCategory_carCategory.do"
                }
            ]
        }
    ]
}              
              ];
    new PageUtil.MainPage({
        modulesConfig : config
    });
});
</script>
</head>
<body>
<div class="header" style="height: 50px;">
    <div class="dl-title" style="text-align:center;">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
        <span style="font-size:30px ">汽车租赁后台管理系统 </span>
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${adminName}</span><a href="${ctx}/login_tuichu.do?role=2" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">用户管理</div></li>
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">管理员管理</div></li>
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">订单管理</div></li>
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">利润统计</div></li>
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">交易流水</div></li>
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">车辆管理</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
</div>
</body>
