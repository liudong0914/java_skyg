<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'user_list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js">
</script>
	</head>
	<style type="text/css">
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

.aStyle1 {
	text-decoration: none;
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

.s {
	font-size: 14px
}
</style>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js">
</script>
	<script>
var highlightcolor = '#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var clickcolor = '#51b2f6';
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc"
			&& cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
}

function changeback() {
	if (event.fromElement.contains(event.toElement)
			|| source.contains(event.toElement) || source.id == "nc")
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
function del(){
      if(confirm("你确定要删除吗?")){
		var formObj = $("#mf");
		formObj.attr("action","per/users!del.action");
		formObj.submit();
		}
  }
function del2(mid){
	if(confirm("你确定要删除吗?")){
		var formObj=$("#mf");
		formObj.attr("action","per/users!del2.action?id="+mid);
		formObj.submit();
	}
}
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

function rowClose(){     //点击关闭按钮是 清空 表单 再 关闭
 $("#roleName").val("");
       $("#roleDesc").val("");
       $("#showStatus").html("");
 $("#addRow")[0].style.display="none";
}
function operRow(){
	$("#addRow")[0].style.display="block";
}
function toAction(){
		$("#mf").attr("action","per/users!list.action?search=s");
		$("#mf")[0].submit();
}
function toShowSelect(){
	if($("#roleSelet").attr("disabled")=="disabled")
	$("#roleSelet").attr("disabled",false);
	else
		{
		$("#roleSelet").attr("disabled",true);
		}
	
}
</script>

	</head>

	<body>
		<form action="per/users!list.action" id="mf" method="post">
			<s:hidden id="pageNum" name="pager.pageNumber" />
			<s:hidden id="id" name="user.userId" />
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
															<span class="STYLE3">你当前的位置</span>：[人事管理]-[员工管理]
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
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<img src="images/22.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="per/users!add.action"
																				style="text-decoration: none;">新增</a>
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
																			<img src="images/33.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:operRow();" class="aStyle1">搜索</a>
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
																			<img src="images/11.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:del()"
																				style="text-decoration: none;">删除</a>
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
				<tr style="display: none;" id="addRow">
					<td>
						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" height="100%" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table style="border: 1px solid #6CC" width="100%"
										bgcolor="#FFFFFF">
										<tr>
											<td align="right" width="42%" class="s">
												用户姓名：
												<s:textfield id="realName" name="user.realName"></s:textfield>
											</td>

											<td width="33%" align="center" class="s">
												<input type="checkbox" onclick="toShowSelect()" name="check"
													id="checkRole" />
												&nbsp;&nbsp;角&nbsp;色：
												<s:select name="user.role.roleId" list="rList"
													disabled="true" id="roleSelet" listKey="roleId"
													listValue="roleName">



												</s:select>
											</td>
											<td width="20%" align="center">
												<input type="button" id="updateButton" onclick="toAction()"
													value="查找" style="width: 60px;" class="button" />
											</td>
											<td align="right" width="5%">
												<img alt="关闭" src="images/close.png" onclick="rowClose()">
											</td>
										</tr>
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
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6">
										<tr>
											<td width="8%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">选定(√)</span>
												</div>
											</td>
											<td width="20%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">用户名</span>
												</div>
											</td>
											<td width="20%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">姓名</span>
												</div>
											</td>
											<td width="20%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">角色</span>
												</div>
											</td>
											<td width="20%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													基本操作
												</div>
											</td>
										</tr>
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" id="userid" name="userid"
															value="${item.userId}"></input>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1"><a
															href="per/users!info.action?id=${item.userId}"
															style="text-decoration: none;">${item.userName}</a>
														</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.realName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.role.roleName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE4"> <img src="images/edt.gif"
																width="16" height="16" /><a
															href="per/users!update.action?id=${item.userId}"
															style="text-decoration: none;">编辑</a>&nbsp; &nbsp; <img
																src="images/del.gif" width="16" height="16" /><a
															href="javascript:del2(${item.userId})"
															style="text-decoration: none;">删除</a>
														</span>
													</div>
												</td>
											</tr>
										</s:iterator>
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
									<%@include file="/WEB-INF/pages/common/page.jsp"%>
								</td>
								<td width="16">
									<img src="images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
