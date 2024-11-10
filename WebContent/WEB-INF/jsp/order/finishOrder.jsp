<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/style.css" />
    <script type="text/javascript" src="${ctx }/resource/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/ckform.js"></script>
    <script type="text/javascript" src="${ctx }/resource/js/common.js"></script>
	<title>管理后台登陆</title>
  <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
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

.table th,
.table td {
  padding: 8px;
  line-height: 20px;
  text-align: left;
  vertical-align: top;
  border-top: 1px solid #dddddd;
}
    </style>
 <!--   p private int id;
    private String carType;//汽车型号
    private CarCategory carCategory;//汽车品牌
    private String carNumber;//车牌号
    private String carOilType;//汽油型号
    private String dailyPrice;//单日租金
    private String  distance;//行驶里程
    private String carImage;//图片
    private int isRecommend;//是否推荐：0:无推荐  1:是为推荐
    private int isDiscount;//是否优惠：0:无推荐 1：是为优惠
    private int  isDelete; //0:不删除 1：删除-->
</head>
<body>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">汽车编号</td>
        <td>${order.car.id}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">汽车型号</td>
        <td>${order.car.carType}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">汽车品牌</td>
        <td>${order.car.carCategory.cname}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">车牌号</td>
        <td>${order.car.carNumber}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">汽油型号</td>
        <td>${order.car.carOilType}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">单日租金</td>
        <td>${order.car.dailyPrice}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">行驶里程</td>
        <td>${order.car.distance}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">租车时间</td>
        <td><fmt:formatDate value="${order.rent.rentTime}" pattern="yyyy-MM-dd"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">还车时间</td>
        <td><fmt:formatDate value="${order.rent.returnTime}" pattern="yyyy-MM-dd"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">交易状态</td>
        <td>
         <c:if test="${order.isDeal == 0 }">
                                     未交易
         </c:if>
         <c:if test="${order.isDeal == 1 }">
                                     已交易
         </c:if>
        </td>
           <tr>
        <td width="10%" class="tableleft">用户ID</td>
        <td>${order.user.id}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">用户名</td>
        <td>${order.user.loginName}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">用户姓名</td>
        <td>${order.user.realName}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">手机号</td>
        <td>${order.user.phone}</td>
    </tr>
      <tr>
        <td width="10%" class="tableleft">电子邮箱</td>
        <td>${order.user.email}</td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">交易金额</td>
        <td>${order.totalPrice}</td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-primary" id="save" type="button">完成交易</button> &nbsp;&nbsp;
        </td>
    </tr>
</table>
</body>
<script>
    $(function () { 
    	$("#save").click(function(){
    		 window.location.href='${ctx}/order_finishOrder.do?id='+${order.id};
    	});
    });
</script>