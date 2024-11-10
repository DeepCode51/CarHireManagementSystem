<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
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
				</ul>
				<script type="text/javascript" src="${ctx}/resource/common/js/nav.js"></script>
			</div>
		</div>
		</div>
	</div>