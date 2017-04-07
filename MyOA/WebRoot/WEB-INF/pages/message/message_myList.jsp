
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>" />

		<title>消息管理</title>
		<link rel="stylesheet"
			href="<%=basePath %>js/jquery-ui-1.8.21.custom/development-bundle/themes/base/jquery.ui.all.css">
		<script
			src="<%=basePath %>js/jquery-ui-1.8.21.custom/development-bundle/jquery-1.7.2.js">
</script>
		<script
			src="<%=basePath %>js/jquery-ui-1.8.21.custom/development-bundle/ui/jquery-ui-1.8.21.custom.js">
</script>
		<link rel="stylesheet"
			href="<%=basePath %>js/jquery-ui-1.8.21.custom/development-bundle/demos/demos.css">

		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.imaStyle1 {
	width: 14px;
	height: 14px;
	border: none;
}

.aStyle1 {
	text-decoration: none;
}

-->
</style>

		<script>
var highlightcolor = '#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还

没搞清楚为什么:(
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
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs

[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains

(event.toElement)||source.id=="nc")
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
	</head>
	<body>
		<s:form action="sys/loginlog!list.action" id="mf"  method="post">
			<s:hidden name="pager.pageNumber" id="pageNum"></s:hidden>
			<s:hidden name="memuId" id="memuId"></s:hidden>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" background="images/tab_05.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="30">
									<img src="images/tab_03.gif" width="12" height="30" />
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="46%" valign="middle">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
															<div align="center">
																<img src="images/tb.gif" width="16" height="16" />
															</div>
														</td>
														<td width="95%" class="STYLE1">
															<span class="STYLE3">你当前的位置</span>：[消息传递]-[消息管理]-[我的消息管理]
														</td>
													</tr>
												</table>
											</td>
											<td width="54%">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="60">
															<table width="87%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<input type="checkbox" name="checkboxAll"
																				id="checkboxAll" value="checkbox" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center" id="showText">
																			全选
																		</div>
																	</td>
																</tr>
																<script type="text/javascript">
$(function() {
	$("#checkboxAll").click(function() {
		if ($("#checkboxAll").attr("checked") == "checked") {
			$("#showText").html("反选");
		} else {
			$("#showText").html("全选");
		}
		var $checkedInput = $("input:checked:not(#checkboxAll)");
		//先选中所有 (不包括本身)
			$("input:checkbox:not(#checkboxAll)").attr("checked", true);
			//把已经选中的反转(不包括本身)

			$checkedInput.attr("checked", false);
		})
})
function toAdd() {
	$("#mf").attr("action", "message/message!toAdd.action");
	$("#mf")[0].submit();
}
function toAction(messagId) {
	$("#mf").attr("action",
			"message/message!toUpdate.action?messageId=" + messagId);
	$("#mf")[0].submit();
}
function toUpdate() { //提示一次只能修改一行
	alert("请选择一行修改!");

}
function deleteIds() { //通过Id批量删除

	var checkedInput = $("input:checked");

	if (checkedInput.size() > 0) {

		if (confirm("你确定要删除吗?")) {
			$("#mf").attr("action", "message/message!doDeleteByIds.action");
			$("#mf").submit();
		}
	} else {
		alert("请选中要删除的行");

	}

}
function deleteId(messageId) { //通过Id删除
	
	$("#mf").attr("action",
			"message/message!doDelete.action?messageId=" + messageId);
	$("#mf").submit();
}
</script>
															</table>
														</td>
														<td width="52">
															<table width="88%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toSearch()"><img
																					src="images/ser.png" width="14" height="14"
																					style="border: none;" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toSearch()"
																				style="text-decoration: none;">搜索</a>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:operRow(1,null,null,null);"><img
																					src="images/22.gif" class="imaStyle1" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toAdd()" class="aStyle1">新增</a>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">

																		<div align="center">

																			<a href="javascript:toUpdate()"><img
																					class="imaStyle1" src="images/33.gif" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toUpdate()" class="aStyle1">修改</a>
																		</div>
																	</td>
																</tr>


															</table>


														</td>
														<td width="52">
															<table width="88%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toDel()"><img
																					src="images/11.gif" width="14" height="14"
																					style="border: none;" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:deleteIds()"
																				style="text-decoration: none;">删除 </a>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="16">
									<img src="images/tab_07.gif" width="16" height="30" />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<script type="text/javascript">

function toSearch() { //搜索

	$("#mf").attr("action",
			"message/message!list.action?search=search&admin=me");
	$("#mf").submit();

}

function rowClose() { //关闭搜索
	$("#searchRow")[0].style.display = "none";
}
</script>

				<!-- -搜索 行 开始 -->
				<tr style="" id="searchRow">
					<td>
						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" height="22" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table
										style="border: 1px solid #6CC; text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 12px;"
										width="100%" bgcolor="#FFFFFF" border="0" cel0lpadding="0"
										cellspacing="0">
										<Tr>
											<td width="20%" height="22">
												&nbsp;
											</td>
											<td height="22" width="46%">
												输入时间段:
												<s:textfield name="pageTime.beginTime" id="beginTime"
													bgcolor="#FFFFFF"
													onClick="WdatePicker({maxDate:'%y-%M-%d'})" size="10">
												</s:textfield>
												——
												<s:textfield name="pageTime.endTime" id="endTime"
													bgcolor="#FFFFFF"
													onClick="WdatePicker({maxDate:'%y-%M-%d'})" size="10"></s:textfield>
												<input type="radio" name="pageTime.dateNum" id="today"
													onclick="" value="1" />
												本日
												<input type="radio" name="pageTime.dateNum" id="week"
													onclick="" value="7" />
												本周
												<input type="radio" name="pageTime.dateNum" id="month"
													onclick="" value="30" />
												本月
											</td>
											<td height="22" valign="middle" align="left" width="10%">
												<img align="center" src="images/sousuo.gif"
													style="cursor: pointer;" onclick="toSearch()">
											</td>
											<td align="right" width="18%" height="22">
												&nbsp;
											</td>
										</Tr>
									</table>
								</td>
								<td width="8" background="images/tab_15.gif">
									&nbsp;
								</td>
							</tr>
						</table>

					</td>
				</tr>

				<!--  搜索行结束-->

				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()" id="messageTable">

										<tr
											style="text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 13px;">
											<td width="4%" height="22" bgcolor="#FFFFFF">
												选定(√)
											</td>
											<td width="8%" height="22" bgcolor="#FFFFFF">

												消息标题

											</td>
											<td width="6%" height="22" bgcolor="#FFFFFF">

												消息类型

											</td>
											<td width="10%" height="22" bgcolor="#FFFFFF">
												消息内容
											</td>
											<td width="9%" height="22" bgcolor="#FFFFFF">
												发送对象
											</td>
											<td width="8%" height="22" bgcolor="#FFFFFF">
												发布时间
											</td>
											<td width="7% height=" 20" bgcolor="#FFFFFF">
												操作
											</td>
											<td width="4%" height="20" bgcolor="#FFFFFF">
												发布
											</td>
										</tr>

										<script type="text/javascript">
function alertUpdate() {
	alert("请选择一行修改!");
}

    function toPublic(messageId){         //准备发布
    	$("#"+messageId)[0].style.background="url('images/loading.gif') no-repeat center  #FFF";
      $("#mf").attr("action","message/message!doPublic.action?messageId="+messageId);
       $("#mf")[0].submit();
    	
    }
</script>
										<!---循环开始-->
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="messages"
															value="${item.messageId}" />
													</div>
												</td>
												<td height="20" width="4%" bgcolor="#FFFFFF">
													<div align="center" class="STYLE1">
														<div align="center">
													<span>		
											 <s:if test="#item.title.length()>10">
                  <a href="javascript:showCenter('${item.title}','${item.messagetype.messageTypeName}','${item.content}','${item.publishObject}','${item.recordTime}')" id="sdf" >
                  <s:text name="#item.title.substring(0,10)"></s:text>...
                  </a>
                  </s:if>
                  <s:else>
                    <a href="javascript:showCenter('${item.title}','${item.messagetype.messageTypeName}','${item.content}','${item.publishObject}','${item.recordTime}')"id="dsf"> <s:text name="#item.title"></s:text></a>
                 
                  </s:else>
</span>
														</div>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.messagetype.messageTypeName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">

														
											   <s:if test="#item.content.length()>12">
                  <p  class="STYLE1" id="${item.content}">
                  <s:text name="#item.content.substring(0,12)"></s:text>...</p>
                  </s:if>
                  <s:else>
                   <p  class="STYLE1" id="${item.content}">
                   <s:text name="#item.content"></s:text></p>
                  </s:else>			
										
													</div>
												</td>

												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.publishObject}</span>
													</div>
												</td>
												<td height="20" width="6%" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE4"> <f:formatDate
																value="${item.recordTime}" pattern="yyyy-MM-dd hh:mm:ss" />

														</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="left">


													<div align="center">


														<span class="STYLE4"> <s:if
																test="#item.ifPublish==1">


															</s:if> <s:else>
																<a href="javascript:toAction(${item.messageId})"
																	style="border: none; text-decoration: none;"> <img
																		src="images/edt.gif" width="16" height="16"
																		style="border: none;" />编辑</a>&nbsp; &nbsp;

															</s:else> <a href="javascript:deleteId(${item.messageId})"
															style="text-decoration: none;"> <img
																	src="images/del.gif" width="16" height="16"
																	style="border: none;" />删除</a> </span>


													</div>


												</td>



												<td height="20" bgcolor="#FFFFFF" id="${item.messageId}">
													<div align="center">
														<span class="STYLE4"> <s:if
																test="#item.ifPublish==1">

已发布

</s:if> <s:else>
																<a href="javascript:toPublic(${item.messageId})" style="text-decoration: none;">发布</a>

															</s:else> </span>
													</div>
												</td>
											</tr>
										</s:iterator>
										<!---循环结束-->
									</table>
								</td>
								<td width="8" background="images/tab_15.gif">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" background="images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35">
									<img src="images/tab_18.gif" width="12" height="35" />
								</td>
								<td>
									<%@include file="/WEB-INF/pages/common/page.jsp"%></td>

								<td width="16">
									<img src="images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</s:form>
		
<!-- 详细信息显示页面 -->	
<div id="win1" class="mini-window" title="消息详情" style="width:650px;height:500px;" 
    showMaxButton="true"
    showToolbar="true" showFooter="true"  showModal="true" allowResize="true" allowDrag="true"
    >
    <div property="toolbar" style="padding:5px;"></div>
    <div property="footer" style="text-align:right;padding:5px;padding-right:15px;">
        <input type='button' value='关闭' onclick="hideWindow()" style='vertical-align:middle;'/>
    </div>
    <table cellpadding="2" cellspacing="2" width="100%">
    <tr><td align="right" width="15%">主题:</td><td width="70%" id="title">&nbsp;</td><td width="15%"></td></tr>
      <tr><td align="right">紧急程度:</td><td id="type">&nbsp;</td><td></td></tr>
        <tr><td valign="top" align="right"width="15%">内容</td><td width="70%"><textarea id="content" cols="56" rows="18" style="overflow-x:hidden;overflow-y:hidden;padding-top: 15px; padding-left: 10px"  >sdf</textarea></td><td width="15%">&nbsp;</td></tr>
         <tr>
           <td align="right" width="15%">收件人:</td><td width="70%" id="user">&nbsp;</td><td width="15%"></td></tr>
          <tr><td align="right" width="15%">发送时间:</td><td width="70%" id="time">&nbsp;</td><td width="15%"></td></tr>
        
    </table>

</div>

<!-- -消息详细显示内容 -->
<script type="text/javascript">
    mini.parse();
    function showCenter(title,type,content,user,time) {
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
