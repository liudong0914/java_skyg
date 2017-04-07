  <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@include file="/WEB-INF/pages/common/include.jsp" %> 
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
	 <meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">  
		 <link rel="Shortcut Icon" href="user_login.jsp"/> 
<title>用户登录</title>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.js"></script>
<style type="text/css">

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #016aa9;
	overflow:hidden;
}
.STYLE1 {
	color: #000000;
	font-size: 12px;
}
.ui-state-error { padding: .3em; }
.validateTips { border: 1px solid transparent red; padding: 0.3em; }

 .username_style{
 border:"1px solid transparent red";
  padding:"0.3em";
  font-weight:"bold" ;
  }
  #username{
 width:105px;
  height:17px; background-color:#292929; 
  border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff;}

</style>
<script type="text/javascript">
  function dologin(){
   if(document.loginForm.onsubmit()==true){   //验证通过 才能 登录

  document.loginForm.submit();
  }
  }
  function checkForm(){  //表单验证  包括用户 和密码的 验证
   $("#username").css({border:"solid 1px #7dbad7","font-size":"12px",color:"#6cd0ff" });
   $("#err").text("");
   if(checkName()&&checkPass())
     return true;
     return false;  
  }
   function checkName(){  // 用户名 验证
    var name=$("#username");
     if(name.val()==null||name.val()==""){
  name.css({border:"1px solid transparent red"});
     var err=$("#err");
     name.focus();
     err.text("输入用户!");
      return false;
     }
     return true;
   }
   function checkPass(){  // 密码验证
      var password=$("#password");
     
     if(password.val()==null||password.val()==""){
       
  password.css({border:"1px solid transparent red" });
     var err=$("#err");
       password.focus();
     err.text("输入密码!");
   
      return false;
     }
     return true;
   }
   function focusLogin(){
   $("#username").focus();
   }
</script>
</head>
<body  onload="focusLogin()">
<s:form action="main!doLogin.action" name="loginForm"  method="post" onsubmit="return checkForm();" >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="235" background="<%=basePath %>images/login_03.gif"> <br></td>
      </tr>
      <tr>
        <td height="53"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="394" height="53" background="<%=basePath %>images/login_05.gif">&nbsp;</td>
            <td width="206" background="<%=basePath %>images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="16%" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
                <td width="57%" height="25"><div align="center">
 <input type="text" id="username" name="user.userName"   />
                </div></td>
                <td width="27%" heig3ht="25" id="err" style="color: red;font-size: 12px;"><%=request.getParameter("err")==null?"":"登录错误" %></td>
              </tr>
              <tr>
                <td height="25">
                <div align="right"><span class="STYLE1">密码</span></div></td>
                <td height="25">
                <div align="center">
                  <s:password id="password" name="user.password" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff"></s:password>
                </div></td>
                <td height="25">
                <div align="left"><a href="javascript:dologin()">
                <img src="<%=basePath %>images/dl.gif" width="49" height="18" border="0"></a>
                </div></td>
              </tr>
            </table></td>
            <td width="362" background="<%=basePath %>images/login_07.gif"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="213" background="<%=basePath %>images/login_08.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</s:form>
</body>
</html>
