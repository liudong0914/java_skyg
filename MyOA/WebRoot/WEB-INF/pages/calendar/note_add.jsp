
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>" />

		<title>登录日志</title>
	<style type="text/css">
<!--
#mytable{
	margin-left: 20%;
}
#mytable2{
	
	margin-left: 20%;
	
}
#mytable3{
	margin-left: 20%;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.button {
	cursor: pointer;
	background: #fff;
	border: 1px solid #C28F27;
	padding: 2px 2px 0px 2px;
	margin: 4px;
	border-width: 1px 3px 1px 3px;
	font-size: 12px;
	color: #A74300;
}
-->
</style>
<!-- 表单验证 -->
<script type="text/javascript">
   function check(){
   	var noteTitle=document.getElementById("noteTitle").value;
   	var noteContent=document.getElementById("noteContent").value; 
   	if(noteTitle.length<=0){
   		alert("标题不能为空！ ");
   		return false;
   	}
   	if(noteContent.length<=0){
   		alert("内容不能为空！");
   		return false;
   	}
   	return true;
   }

</script>

</head>

<body>
<s:form action="note!doadd.action" method="post" name="mf" id="mf" onsubmit="return check();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr></tr>
    <tr>
      <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="95%" class="STYLE1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                          <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[我的便签]-[便签添加]</td>
                        </tr>
                      </table></td>
                      <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                          <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              
                            </tr>
                          </table></td>
                          <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                          <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
        </tr>
      </table></td>
    </tr>
    
    <!--要加的行--->
   <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" bgcolor="#FFFFFF">
            <!------开始---->
           
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" border="0" onmouseover="changeto()"  onmouseout="changeback()">
        
   <input type="hidden" name="memuId" value="${submemu.memuId }" />
    	 <table id="mytable" align="center" border="0">
         	<tr class="STYLE1">
            	<td>便签标题:</td>
            </tr>
            <tr>
            	<td>
                	<s:textfield name="mynote.noteTitle" size="84" 

cssStyle="border: 1px solid #2995CF; font-size:12px;" id="noteTitle"></s:textfield>
                </td>
            </tr>
            <tr class="STYLE1">
            	<td>便签内容:</td>
                
            </tr>
            <tr >
            	<td>
                	<s:textarea name="mynote.noteContent" cols="55" 

rows="10" cssStyle="border: 1px solid #2995CF; font-

size:12px;" id="noteContent"></s:textarea>
                </td>
            </tr>
            </table>
         <table id="mytable3" align="center" border="0">
            <tr class="STYLE1">
            	<td width="58">创建人:</td>
                <td width="200">
                	${sessionScope.loginUser.userName}
                </td>
                
                  <td width="94" align="left">创建时间:</td>
                <td width="76">
                	${mynote.createTime }
                </td>
            </tr>
         </table>
       	<br />
        <table  border="0" align="center" style="padding-left: 200px;">
            <tr class="STYLE1">
            	<td width="246" >
                	<s:submit  cssClass="button"  value="保存"  

></s:submit>
                </td>
                <td width="200" >
                	<input  type="submit" value="删除当前便签" 

disabled="disabled"  style="font-size:12px;" class="button"/>	
                </td>
               
            </tr>
         </table>

        </table>
            
            
            <!------结束------->
            
            
            </td>
           
          </tr>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   
   
   
   
    
    <tr>
      <td height="35" background="images/tab_19.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
          <td>&nbsp;</td>
          <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
        </tr>
      </table></td>
    </tr>
  </table></td>
</tr>
</table>
  </s:form>
</body>
</html>
