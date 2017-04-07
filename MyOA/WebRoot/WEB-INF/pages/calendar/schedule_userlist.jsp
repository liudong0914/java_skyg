<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'machina_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/Cookie.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/ss.css">
	
 <script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.js"></script>
 </head>
<style type="text/css"> 
<!--
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
-->
a:link,a:visited{
 text-decoration:none;  /*超链接无下划线*/
}
tr{
cursor: pointer;
}
</style>
 
<script> 
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}
 
function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
 
function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
 
    <script type="text/javascript">
                    function del(){
                 		
                    	if(confirm("你确定要删除吗?")){
						var formObj = $("#myForm");
							formObj.attr("action","calendar/schedule!delete.action");
							formObj.submit();
						}
                    }
   </script>
   
   
 	<script type="text/javascript">
 	var checkid=0;
	var checkname="";
	var checkaddr="";
	function CheckedObj(obj,objid,objname,objaddr){
	
	 for(i=1; i<obj.parentNode.childNodes.length; i++)
	 {
		   obj.parentNode.childNodes[i].className="table-back";
	 }
	 
	 obj.className="event";
	 checkid= objid;
	 checkname = objname;
	 checkaddr= objaddr;
	}

	function Affirm(){
		if(checkid!=""){
		setCookie("userId",checkid);
		
		setCookie("cname",checkname);
		setCookie("detailaddr",checkaddr);
		window.close();
		}else{
		alert("请选择你要操作的记录!");
		}

	}
 	</script>
</head>
 
<body>
<s:form action="machine!list.action" id="myForm" method="post" name="myForm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<s:hidden name="loginUser.userId"></s:hidden>
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[日程管理]-[用户列表]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                 
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                 
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                 
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            
           
            <td width="32%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户名</span></div></td>
            <td width="35%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">所在机构</span></div></td>
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">所在部门</div></td>
          </tr>
          <s:iterator  value="userList" var="user">
          	
          	
          	
          	<tr onClick="CheckedObj(this,'${user.userId}','${user.realName}','${user.dept.deptName}');"onDblClick="Affirm();">
          	
             
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${user.realName}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${user.dept.machine.machineName}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4">${user.dept.deptName}</span></div></td>
          	</tr>
          	
          </s:iterator>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</s:form>
  </body>
</html>
