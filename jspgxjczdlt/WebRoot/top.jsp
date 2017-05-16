
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校网上教材征订系统</title>
   <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style>


  </head>

  <body >
  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="195" height="56" align="center" background="images/line_t1_client.gif">&nbsp;</td>
    <td width="*" background="images/line_t1_client.gif">
	
	<table width="100%" height="52" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td nowrap width="64" height="56" >&nbsp;</td>
		   <td nowrap width="64" height="56" align="right" background="/images/pic_bl_client.gif" ><img src="images/pic_xx_client.gif" width="64" height="56"></td>
          <td nowrap width="301" background="images/pic_bl_client.gif">&nbsp;</td>
          <td nowrap width="2" align="right"><img src="images/pic_ll_client.gif" width="2" height="56"></td>
           <td nowrap width="60" align="center" valign="middle"><img src="images/pic_help_client.gif" width="25" height="32"><br>
            <a href="#" onClick="window.open ('inform.htm', 'newwindow', 'height=400, width=600, toolbar=yes, menubar=no, scrollbars=no, resizable=no, location=no, status=no') ">帮    助</a></td>          
          <td nowrap width="60" align="center" valign="middle"><img src="images/pic_tc_client.gif" width="29" height="31"><br>
            <a href='logout.jsp' target=_parent>退    出</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>	
	 <td colspan="2" height="28" background="images/line_t2_client.gif">
	<table width="100%" border="0" cellspacing="0">
        <tr>
          <td width="5%" align="center"><img src="images/pic_welcome_client.gif" width="23" height="19"></td>
         <td  width="25%" height="26"><strong><font color=white>欢迎您,<%=request.getSession().getAttribute("username")%>,您的权限：<%=request.getSession().getAttribute("cx")%></font></strong></td>
		<td  width="%70" height="26" class="style1"></td>
        </tr>
      </table>

	  </td>
  </tr>
</table>
  </body>
</html>

