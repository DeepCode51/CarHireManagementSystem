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
</head>
<body>
<form action="car_exUpdate.do" method="post" class="definewidth m20" id="hh" enctype="multipart/form-data">
<table class="table table-bordered table-hover definewidth m10">
      <tr>
        <td width="10%" class="tableleft">汽车编号ID</td>
        <td><input type="text" name="id" id="id" value="${car.id}" disabled="disabled"/>
           <input type="hidden" name="id" value="${car.id}">
        </td>
     </tr>
     <tr>
        <td width="10%" class="tableleft">汽车型号</td>
        <td><input type="text" name="carType" id="carType" value="${car.carType}"/>
        </td>
     </tr>
     <tr>
        <td width="10%" class="tableleft">汽车品牌</td>
        <td> <select name="carCategory.id" >
            <c:forEach  items="${carCatList}" var="cl" varStatus="l">
             <option value="${cl.id }">${cl.cname }</option>
            </c:forEach>
        </select>
        </td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">车牌号</td>
        <td><input type="text" name="carNumber" id="carNumber" value="${car.carNumber}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">汽油型号</td>
        <td><input type="text" name="carOilType" id="carOilType" value="${car.carOilType}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">单日租金</td>
        <td><input type="text" name="dailyPrice" id="dailyPrice" value="${car.dailyPrice}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">行驶里程</td>
        <td><input type="text" name="distance" id="distance" value="${car.distance}"/></td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">图片</td>
        <td><input type="file" name="file" id="" value="${car.carImage}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">是否推荐</td>
          <td> <input type="radio" name="isRecommend" value="1" <c:if test="${car.isRecommend == 1 }"> checked="checked" </c:if>/>&nbsp;&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="isRecommend" value="0" <c:if test="${car.isRecommend == 0 }"> checked="checked" </c:if>/>&nbsp;&nbsp;&nbsp;否&nbsp;&nbsp;&nbsp;&nbsp;
          </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">是否优惠</td>
          <td> <input type="radio" name="isDiscount" value="1" <c:if test="${car.isDiscount == 1 }"> checked="checked" </c:if>/>&nbsp;&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="isDiscount" value="0" <c:if test="${car.isDiscount == 0 }"> checked="checked" </c:if>/>&nbsp;&nbsp;&nbsp;&nbsp;否&nbsp;&nbsp;&nbsp;
          </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-primary" id="save" type="button">保存</button> &nbsp;&nbsp;
        </td>
    </tr>
</table>
</form>
</body>
<script>
    $(function () { 
    	$("#save").click(function(){
    		$("#hh").submit();
    	});
    	

    });
</script>