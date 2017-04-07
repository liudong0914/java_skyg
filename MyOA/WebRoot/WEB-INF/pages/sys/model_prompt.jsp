<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@include file="/WEB-INF/pages/common/include.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<base href="<%=basePath%>">
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<title>个人中心</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px;}
.STYLE1 div{cursor:pointer;}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
.STYLE4 span{cursor:pointer;}
.style5 img{cursor:pointer;}
-->
</style>

<script>
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td height="30" background="images/tab_05.gif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[个人中心]-</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table>
    
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" height="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="100%" background="images/tab_12.gif">&nbsp;</td>
        <td style="padding-bottom: 100px;">
        
        <TABLE cellSpacing=0  cellPadding=0 width="90%" align=center border=0>
  <TR height=100>
    <TD align=middle width=100><IMG height="100px"  width="90px" src="images/user/${user.image}" 
     ></TD>
    <TD width=60>&nbsp;</TD>
    <TD>
      <TABLE height=100 cellSpacing=0  cellPadding=0 width="100%" border=0>
        
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
    <TD style="COLOR: #880000">30 分钟</TD>
  </TR>
    </TABLE>
    
    </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>
    <table width="100%" border="0" height="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="100%" background="images/tab_12.gif">&nbsp;</td>
         <td><table width="100%"><tr style="text-align: center"> 
          <TD >技术支持网：
    <a  href="http://www.cshope.cn">www.cshope.cn</a></TD></tr></table></td>
           <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table>
    
    </td>
  </tr>
  
  

  
  
  
  <tr>
  
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;</td>
            </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
