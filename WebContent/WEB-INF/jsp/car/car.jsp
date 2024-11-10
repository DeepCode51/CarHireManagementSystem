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
    <script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/ckform.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/common.js"></script>
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
 
<form class="form-inline definewidth m20" action="car_car.do" method="post">  
 车名：<input type="text" name="carType" id="carType"class="abc input-default" placeholder="" value="${car.carType}">&nbsp;&nbsp;
         <select name="carCategory.id" >
           <option value="" selected="">请选择车辆品牌</option>
            <c:forEach  items="${carCatList}" var="cl" varStatus="l">
                  <c:choose>
                  <c:when test="${car.carCategory.id == cl.id}">
                      <option value="${cl.id }" selected="selected">${cl.cname }</option>
                   </c:when>
                  <c:otherwise>
                            <option value="${cl.id }">${cl.cname }</option>
                  </c:otherwise>
                  </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
      <input type="radio" name="isRecommend" value="1" <c:if test="${car.isRecommend == 1 }"> checked="checked" </c:if>/>只看推荐 &nbsp;&nbsp;
      <input type="radio" name="isDiscount" value="1" <c:if test="${car.isDiscount == 1 }"> checked="checked" </c:if>/>只看优惠 &nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="add">新增车辆</button>
</form>
<table class="table table-bordered table-hover definewidth m10" align="center">
    <thead>
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
    <tr>
        <th>车辆编号ID</th>
        <th>车名</th>
        <th>车牌号</th>
        <th>汽油型号</th>
        <th>单日价格</th>
        <th>行驶里程</th>
        <th>图片</th>
        <th>是否优惠</th>
        <th>是否推荐</th>
<!--         <th>状态</th> -->
        <th>操作</th>
    </tr>
    </thead>
     <c:forEach items="${pagers.datas}" var="car" varStatus="l">
      <tr >
            <td align="center">${car.id}</td>
            <td>${car.carType}</td>
            <td>${car.carNumber}</td>
            <td>${car.carOilType}</td>
            <td>￥${car.dailyPrice}</td>
            <td>${car.distance}</td>
            <td><img src="${car.carImage}" style="height: 30px;width: 50px"></td>
             <td>
               <c:if test="${car.isDiscount == 0 }">
                                               无优惠                               
               </c:if>
               <c:if test="${car.isDiscount == 1 }">
                                              是优惠
               </c:if>
            </td>
            <td>
               <c:if test="${car.isRecommend == 0 }">
                                          无推荐                         
               </c:if>
               <c:if test="${car.isRecommend == 1 }">
                                             是推荐
               </c:if>
            </td>
<!--             <td> -->
<%--                <c:if test="${car.isDelete == 0 }"> --%>
<!--                                               正常 -->
<%--                </c:if> --%>
<%--                <c:if test="${car.isDelete == 1 }"> --%>
<!--                                              删除 -->
<%--                </c:if> --%>
<!--             </td> -->
             <td>
                   <a id="update" href="${ctx}/car_update.do?id=${car.id}">修改</a>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <a id="update" href="${ctx}/car_delete.do?id=${car.id}" onclick= "if(confirm( '是否删除！ ')==false)return   false; ">删除</a>
            </td>
        </tr>
     </c:forEach>
 </table>
 <div class="panel-foot text-center">
      <pg:pager  url="${ctx}/car_car.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:param name="carType" value="${carType}"/>
		<pg:param name="carCategory.id" value="${carCategory.id}"/>
		<pg:param name="isRecommend" value="${isRecommend}"/>
		<pg:param name="isDiscount" value="${isDiscount}"/>
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
			window.location.href="${ctx}/car_add.do";
		 });
    });

//     function del(id)
// 	{
// 		if(confirm("确定要删除吗？"))
// 		{
// 			url="${ctx}/userlogin/delnode?id="+id;
//     		$.ajax({
//     			//cache: true,
//     			type : "post",
//     			url : url,
//     			dataType :'json',
//     			async : false,
//     			error : function(request) {
//     				return false;
//     			},
//     			success : function(data) {
//     				console.log(data)
//     				if(data.status ==1){
// 						 alert(data.desc);
// 						 window.location.href="${ctx}/userlogin/Node";
// 					 }else{
// 						 alert(data.desc);
// 				 }
//     			}
//     		});		
// 		}
// 	}
</script>