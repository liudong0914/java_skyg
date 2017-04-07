<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>

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
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js">
</script>
	</head>
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
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

.s {
	font-size: 14px
}

.aStyle1 {
	text-decoration: none;
}
-->
</style>

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
		formObj.attr("action","per/machine!del.action");
		formObj.submit();
	}
}
function del2(mid){
	if(confirm("你确定要删除吗?")){
		$("#id").attr("value",mid);
		var formObj=$("#mf");
		formObj.attr("action","per/machine!del2.action");
		formObj.submit();
	}
}
function adds(){
 	if(confirm("你确定要添加吗?")){
 		var formObj=$("#mf");
 		formObj.attr("action","per/machine!adds.action");
 	  
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
function operRow(operate,id,name,desc){  //操作添加页面
 if(operate==1){
 $("#addAuthRow")[0].style.display="none";
   $("#addRow")[0].style.display="block";
    $("#updateButton").attr("value","添加");
    $("#ming").val("");
     $("#jian").val("");
    $("#ming").focus();
    } 
    if(operate==2){
   	 $("#addAuthRow")[0].style.display="none";
     $("#updateButton").attr("value","保存修改");
     $("#addRow")[0].style.display="block";
     $("#machineId").val(id);
     $("#ming").val(name);
     $("#ming").select();
     $("#jian").val(desc);
    }
    if(operate==3){
    $("#addAuthRow")[0].style.display="none";
     $("#updateButton").attr("value","查找");
     $("#addRow")[0].style.display="block";
     $("#ming").val("");
     $("#jian").val("");
    $("#ming").focus();
    }
}
function toAction(){    //当焦点 离开文本框时用Ajax  检查用户是否已存在及显示 提示信息
     var operButton=$("#updateButton").attr("value");
      if(operButton=="添加"){
    	var formObj=$("#mf");
 		formObj.attr("action","per/machine!adds.action");
 		formObj.submit();
		}
		if(operButton=="保存修改"){
		var formObj=$("#mf");
 		formObj.attr("action","per/machine!updates.action");
 		formObj.submit();
		}
		if(operButton=="查找"){
		$("#mf").attr("action","per/machine!list.action?search=s");
		$("#mf")[0].submit();
		}
   }
 function checkFrom(){
  if(checkName()&&checkDesc())
  return true;
  return false;
 }
 function checkName(){  //机构名称检查
  var roleName=$("#ming");
    if(roleName.val()==null||roleName.val()==""||roleName.val()=="请在这输入机构名称!"){
     roleName.val("请在这输入机构名称!");
       roleName.select();
     return false;
    }
  return true;
}
function checkDesc(){  //机构简称说明检查
  var roleDesc=$("#jian");
    if(roleDesc.val()==null||roleDesc.val()==""||roleDesc.val()=="请在这输入机构简称!"){
     roleDesc.val("请在这输入机构简称!");
       roleDesc.select();
     return false;
    }
  return true;
}
function checkMachineName(){    //当焦点 离开文本框时用Ajax  检查用户是否已存在及显示 提示信息
     var operButton=$("#updateButton").attr("value");
     var mName=$("#ming").val();
      var showtd=$("#imgSpan");
      showtd.empty();
      var check = true;
    check=check&&checkName();
    if(check){
      if(operButton=="添加"){
     $.ajax({
			type:"post",
			url:"per/machine!checkName.action",
			 data: "name="+mName+"&oper=add",
			 dataType: "json",
			 success:function(data){
		var img=$("<img/>");
		var span=$("<span></span>")
		img.attr("src","images/"+data.status+".png");
		span.html(data.message);
			showtd.append(img);
			showtd.append(span);
			   if(data.status=="error"){
				   
			      $("#ming").select();
			   }
			 	},
			 	 error:function(){
			 	 }
			 });
		}
		
		if(operButton=="保存修改"){
		var mId= $("#machineId").val();//保存修改时，验证用户名是否存在，要把当前要修改的角色 排除在外
     	$.ajax({
			type:"post",
			url:"per/machine!checkName.action",
			 data: "name="+mName+"&oper=update"+"&id="+mId,
			 dataType: "json",
			 success:function(data){
		var img=$("<img/>");
		var span=$("<span></span>")
		img.attr("src","images/"+data.status+".png");
		span.html(data.message);
			showtd.append(img);
			showtd.append(span);
			   if(data.status=="error"){
			      $("#ming").select();
			   }
			 	},
			 	 error:function(){
			 	 
			 	 }
			 });
		}
		}
}
</script>
	</head>

	<body>
		<s:form action="per/machine!list.action" id="mf" method="post"
			onsubmit="return checkFrom();">
			<s:hidden id="pageNum" name="pager.pageNumber" />
			<s:hidden id="machineId" name="machine.machineId" />
			<s:hidden id="id" name="id" />
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
															<span class="STYLE3">你当前的位置</span>：[人事管理]-[机构信息]
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
															<table id="add" width="90%" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<img src="images/22.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div id="test" align="center">
																			<a href="javascript:operRow(1,null,null,null);"
																				class="aStyle1">新增</a>
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
																			<img src="images/find.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:operRow(3,null,null,null)"
																				class="aStyle1">搜索</a>
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
																			<a href="javascript:del()" class="aStyle1">删除</a>
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
											<td align="right" width="35%" class="s">
												机构名称：
												<s:textfield id="ming" name="machine.machineName"
													onblur="checkMachineName()"></s:textfield>
											</td>
											<td id="imgSpan" class="s">
												&nbsp;
											</td>
											<td width="25%" align="center">
												机构简称：
												<s:textfield id="jian" name="machine.machineShortName"></s:textfield>
											</td>
											<td width="20%" align="center">
												<input type="button" id="updateButton" onclick="toAction()"
													value="保存修改" style="width: 60px;" class="button" />
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
				<tr id="addAuthRow" style="display: none;"></tr>
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
										onmouseout="changeback()">
										<tr>
											<td width="8%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">选定(√)</span>
												</div>
											</td>
											<td width="32%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">机构名称</span>
												</div>
											</td>
											<td width="33%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">机构简称</span>
												</div>
											</td>
											<td width="15%" height="22" background="images/bg.gif"
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
														<input type="checkbox" id="machineid" name="machineid"
															value="${item.machineId}"></input>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="machineName">${item.machineName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="machineSName">${item.machineShortName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE4"><img src="images/edt.gif"
																width="16" height="16" /><a
															href="javascript:operRow(2,${item.machineId},'${item.machineName}','${item.machineShortName}')"
															class="aStyle1">编辑</a> &nbsp; &nbsp;<img
																src="images/del.gif" width="16" height="16" /> <a
															href="javascript:del2(${item.machineId})" class="aStyle1">删除</a>
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

		</s:form>
	</body>
</html>
