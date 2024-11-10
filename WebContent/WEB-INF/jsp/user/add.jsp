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
<form action="user_exAdd.do" method="post" class="definewidth m20" id="hh">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">用户名</td>
        <td><input type="text" name="loginName" id="loginName" value="${user.loginName}"/>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">用户姓名</td>
        <td><input type="text" name="realName" id="realName" value="${user.realName}"/>
        </td>
    </tr>
     <tr>
        <td width="10%" class="tableleft">密码</td>
        <td><input type="password" name="passWord" id="passWord" value="${user.passWord}"/>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">手机号</td>
        <td><input type="text" name="phone" id="phone" value="${user.phone}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">邮箱</td>
        <td><input type="text" name="email" id="email" value="${user.email}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">找回密码问题</td>
        <td><input type="text" name="question" id="question" value="${user.question}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">找回密码答案</td>
        <td><input type="text" name="answer" id="answer" value="${user.answer}"/></td>
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