<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@include file="/WEB-INF/pages/common/include.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<base href="<%=basePath%>">
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<style type="text/css">

body{
	
	margin: 0px; auto;

}

html {
	scrollbar-face-color:#CCD0DB;
	scrollbar-highlight-color:#fff;
	scrollbar-shadow-color:#fff;
	scrollbar-3dlight-color:#6795B4;
	scrollbar-arrow-color:#20669A;
	scrollbar-track-color:#fff;
	scrollbar-darkshadow-color:#6795B4;
	border:0;
	}
html { overflow-x: hidden; overflow-y: auto; } 

</style>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%"  border=0 style="border-collapse:collapse">
  <TR height=28>
   <td width="5%"><div align="center">
   <img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1">
                <span class="STYLE3">你当前的位置</span>：[业务中心]-[我的邮件]</td>
    </TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/promptimages/shadow_bg.jpg></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TR height=100>
    <TD align=middle width=100><IMG height=100 src="images/promptimages/admin_p.gif" 
      width=90></TD>
    <TD width=60>&nbsp;</TD>
    <TD>
      <TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
        
          <TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px">${user.userName}</TD></TR>
        <TR>
          <TD>欢迎进入网站管理中心！</TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan=3 height=10></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=images/promptimages/title_bg2.jpg>您的相关信息</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
  <TR>
    <TD align=right >登陆帐号：</TD>
    <TD style="COLOR: #880000">${user.userName}</TD></TR>
  <TR>
    <TD align=right>真实姓名：</TD>
    <TD style="COLOR: #880000">${user.realName}</TD></TR>
  <TR>
    <TD align=right>注册时间：</TD>
    <TD style="COLOR: #880000">${user.regTime}</TD></TR>
  <TR>
    <TD align=right>登陆次数：</TD>
    <TD style="COLOR: #880000">${loginCount}</TD></TR>
  <TR>
    <TD align=right>上线时间：</TD>
    <TD style="COLOR: #880000">${sessionScope.loginInfo.loginTime}</TD></TR>
  <TR>
    <TD align=right>IP地址：</TD>
    <TD style="COLOR: #880000">${sessionScope.loginInfo.loginUserIp}</TD></TR>
  <TR>
    <TD align=right>身份过期：</TD>
    <TD style="COLOR: #880000">30 分钟</TD></TR>
    <TD align=right>技术支持网：</TD>
    <TD style="COLOR: #880000">
    <a href="http://www.865171.cn">www.865171.cn</a></TD></TR></TABLE>
   
    
    </BODY></HTML>