
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>消息管理</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/email/globle_v1.css" type=text/css rel=stylesheet>
<LINK href="css/email/inbox.css" type=text/css rel=stylesheet>
<link href="css/email/skin_blue.css" rel="stylesheet" type="text/css" id="lnkSkin">
  
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
  function che(){
	  var a="${requestScope.cont}";
	if(a!=null&&a!="")
		 $("#lookemail")[0].value=a; 
	  
  }
</script>
</head>
<body onload="che()">
<s:form action="email!list.action" method="post" id="mf">
	<s:hidden name="pager.pageNumber" id="pageNum"></s:hidden>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[消息传递]-[收件箱]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
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
        <td><DIV class=ContentWp>
<DIV class=ContentThemeWp>
<DIV class=gTitle><B class=mTT>收件箱</B>&nbsp;&nbsp;(共&nbsp;<B 
id=oTotal>${allMessage}</B>&nbsp;封，其中&nbsp;<A title="" 
href="javascript:toNoread()">未读邮件</A>&nbsp;<B 
class=fnt_Red id="totalUnRead">${noRead}</B>&nbsp;封)</DIV>
<DIV class="gToolbar gTbrTop">
<INPUT class="Btn BtnNml" hideFocus type=button value="删 除" outClass="Btn BtnNml ImpBtn" onclick="deletebyIds()" overClass="Btn BtnHv ImpBtn" action="move">
<SELECT class=Sel action="mark" onchange="toShow(this)">
  <OPTION value=none selected>标记为...</OPTION>
	<OPTION value="readeds">&nbsp;&nbsp;已读邮件</OPTION>
	<OPTION value="unreads">&nbsp;&nbsp;未读邮件</OPTION>
</SELECT>
  
<SELECT class=Sel action="move">
  	<OPTION value=none selected>移动到...</OPTION>
	<OPTION value=2>&nbsp;&nbsp;草稿箱</OPTION>
	
</SELECT>

<SELECT class=Sel action="view" url="#" id="lookemail" onchange="toActon(this)">
	
	<%--<s:select id="lookemail" onchange="toAction()" list="#{'null':'查看...','all':'全部邮件','none':'-------------','unread':'未读邮件','allRead':'已读邮件'}" name="contype"
							listKey="key" listValue="value"/>
	--%>
	<OPTION value=none selected=selected>查看...</OPTION>
	<OPTION value="all">&nbsp;&nbsp;全部邮件</OPTION>
	<OPTION class=SelOptLine value=none>-------------</OPTION>
	<OPTION value="unread">&nbsp;&nbsp;未读邮件</OPTION>
	<OPTION value="allRead">&nbsp;&nbsp;已读邮件</OPTION>
</SELECT>
</DIV>
<DIV class=Ibx_Main_Wp>
<TABLE class="Ibx_gTable F2Img Ibx_gTable_TT" id=oTableHead>
  <TBODY>
  <script type="text/javascript"> <!-- 按钮操作 -->
  function toShow(obj){               //标记为
	  var toshow=obj.value;
	    var checked=$("#tablecount :checked");
	   if(checked.size()==0){
		   alert("请选择要标记的邮件!");
	   }
	   else{
		   $("#mf").attr("action","message/email!toShow.action?toShow="+toshow);
	     $("#mf")[0].submit();
	   }
  }
  function deletebyIds(){            //通过Id批量删除
	  
	   var checked=$("#tablecount :checked");
	   if(checked.size()==0){
		   alert("请选择要删除的邮件!");
	   }
	    else{ $("#mf").attr("action","message/email!deletebyIds.action");
	     $("#mf")[0].submit();
	  }
  }
  function toActon(obj){
	var contype=obj.value;
	 $("#mf").attr("action","message/email!list.action?"+contype+"="+contype);
	     $("#mf")[0].submit();
  }
  
  
  
    function toReaded(){  //跳到已读操作
    	window.location.href="email!list.action?allRead=allRead";
		 // $("#mf").attr("action","message/email!list.action?allRead=a");
		  // $("#mf")[0].submit();
    	
    }
  function toNoread(){                    //跳到 未读操作
	  var countStr=$("#totalUnRead").html();
	  var countNum=parseInt(countStr);
	  if(countNum<1){
		  alert("您没有未读邮件");
	  }
	  else{
		  //$("#mf").attr("action","message/email!list.action?unread=unread");
		  window.location.href="email!list.action?unread=unread";
		   //$("#mf")[0].submit();
	  }
  }
  function  checkAll(obj){               //全选 与不选
	  if(obj.checked==true)
	  $("#tablecount input").attr("checked",true);
	  else{
		   $("#tablecount input").attr("checked",false);
	  }
  }
  
  function noCheck(){                  //不选
	  $(":checkbox").attr("checked",false);
  }
  function  oppCheck(){                 //反选
	  $("#FormCheckAll").attr("checked",false);     //把选按钮关闭
	 var checked=$("#tablecount :checked");       //已经选中的
     $("#tablecount input").attr("checked", true);       //把所有 复选框 选中
     checked.attr("checked",false);     //再把已经选中的 改为不选中
	  
  }
  </script>   
  <TR>
    <TH class=Ibx_Th_F></TH>
    <TH class=Ibx_Th_Chkbx><INPUT id="FormCheckAll"  onclick="checkAll(this)" title=全选/不选　本页所有邮件 
      type=checkbox></TH>
    <TH class=Ibx_Th_icoInfo><B class=icoIbx title=邮件类型></B></TH>
    <TH class=Ibx_Th_From>发件人</TH>
    <TH class=Ibx_Th_icoFlag><B class=icoIbx title=邮件标签></B></TH>
    <TH class=Ibx_Th_Subject>主题</TH>
    <TH class=Ibx_Th_Date>日期</TH>
    <TH  style="width:7%; color:#000000; padding-left:5px">紧急程度</TH>
    </TR>
  <TBODY></TBODY></TABLE>
<DIV class="Ibx_Lst_dWp dWpOpen">

<TABLE class="Ibx_gTable Ibx_gTable_Con" id="tablecount" action="list">
  <TBODY>
  
  <!-- -循环开始了-- -->
  <s:iterator value="pager.list" var="item">
  <TR class="I_Mark0 I_UnRd" style="font-size: 13px;">
    <TD class=Ibx_Td_F>&nbsp;</TD>
    <TD class=Ibx_Td_Chkbx><INPUT title=选择/不选 type=checkbox 
                value="${item.id}"          name="messagetouserIds" time="1236882334000" index="5" 
      read="false"></TD>
    <TD class=Ibx_Td_icoInfo ><s:if test="#item.ifRead==0">
    
    <img src="images/index1_78.gif" onclick="showCenter(${item.id},'${item.message.title}','${item.message.messagetype.messageTypeName}','${item.message.content}','${item.message.users.realName}','${item.message.recordTime}')" id="${item.id}" title="未读邮件"></s:if>
    <s:else>
     <img src="images/index1_75.gif" onclick="showCenter(${item.id},'${item.message.title}','${item.message.messagetype.messageTypeName}','${item.message.content}','${item.message.users.realName}','${item.message.recordTime}')" title="已读邮件">
    </s:else>
    
    </TD>
    <TD class=Ibx_Td_From  style="font-size: 12px;">
    <A><s:date name=""/>${item.message.users.realName}</A></TD>
    <TD class=Ibx_Td_icoFlag ><B class=icoIbx></B></TD>
    <TD class=Ibx_Td_Subject 
     style="font-size: 12px;">
     <A   href="javascript:showCenter(${item.id},'${item.message.title}','${item.message.messagetype.messageTypeName}','${item.message.content}','${item.message.users.realName}','${item.message.recordTime}')">${item.message.title}</A></TD>
    <TD class=Ibx_Td_Date style="font-size: 12px;"><%--
    <s:date name="${item.message.recordTime}" format="yyyy-MM-dd hh:mm:ss"/>
    --%>
    <f:formatDate value="${item.message.recordTime}" pattern="MM月dd日 hh点" />
    </TD>
    <TD style="width:7%; color:#000000; padding-left:5px;font-size: 12px;" >${item.message.messagetype.messageTypeName}</TD>
   </TR>
   </s:iterator>
     <!-- -循环结束了-- -->
   
  <TBODY></TBODY></TABLE></DIV>

<H4 class=Ibx_Lst_bExtra id=oH4Check>选择：<A href="message/email!list.action" 
type=all>全部</A>&nbsp;-&nbsp;
<A href="javascript:toNoread()" type=unread>未读</A>
&nbsp;-&nbsp;<A href="javascript:toReaded()" 
type=read>已读</A>&nbsp;-&nbsp;<A href="javascript:oppCheck()" 
type=reverse>反选</A>&nbsp;-&nbsp;<A href="javascript:noCheck()" 
type=no>不选</A></H4></DIV>
</DIV></DIV></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>	<%@include file="/WEB-INF/pages/common/page.jsp"%></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</s:form>
<div id="win1" class="mini-window" title="消息详情" style="width:650px;height:500px;" 
    showMaxButton="true"
    showToolbar="true" showFooter="true"  showModal="true" allowResize="true" allowDrag="true"  >
    <div property="toolbar" style="padding:5px;"></div>
    <div property="footer" style="text-align:right;padding:5px;padding-right:15px;">
        <input type='button' value='关闭' onclick="hideWindow()" style='vertical-align:middle;'/>
    </div>
    <table cellpadding="10" cellspacing="10"  >
    <tr><td align="right" width="15%" style="font-size: 13px;">主题:</td><td width="70%" id="title"></td><td width="15%"></td></tr>
      <tr><td align="right">紧急程度:</td><td id="type">&nbsp;</td><td></td></tr>
        <tr><td valign="top" align="right"width="15%">内容</td><td width="70%">
        <textarea  cols="70" rows="20" id="content" style="overflow-x:hidden;overflow-y:hidden; padding-top: 15px; padding-left: 10px"  ></textarea></td><td width="15%">&nbsp;</td></tr>
         <tr><td align="right" width="15%">发件人:</td><td width="70%" id="user">&nbsp;</td><td width="15%"></td></tr>
          <tr><td align="right" width="15%">发送时间:</td><td width="70%" id="time"></td><td width="15%"></td></tr>
        
    </table>

</div>


<!-- -消息详细显示内容 -->
<script type="text/javascript">
    mini.parse();
    function showCenter(id,title,type,content,user,time) {
    	 $.ajax({
			type:"post",
			url:"message/email!doLook.action?userId="+${sessionScope.loginUser.userId},
			 data: "id="+id,
			 dataType: "json",
			 success:function(data){
				var num=data.success;
    		   $("#"+id).attr("src","images/index1_75.gif");
    		 var total=$("#totalUnRead").html(num);
			 	},
			 	 error:function(){
			 		alert("错了");
			 	 
			 	 }
			 });
    					$("#title").html(title);
    					$("#type").html(type);
    					$("#content").html(content);
    					$("#user").html(user);
    					var newtime=time.substring(0,time.length-2);
    						$("#time").html(newtime);
    					
        var win = mini.get("win1");
        win.show();
        
    
    }
    function hideWindow() {
        var win = mini.get("win1");
        win.hide();
    }

</script>

</body>
</html>
