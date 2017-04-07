
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>" />

		<title>消息详情</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size: 13px;
}

.STYLE1 {
	font-size: 12px;
}

.STYLE1 div {
	cursor: pointer;
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.showRed {
	border: solid red 1px;
}

.STYLE4 span {
	cursor: pointer;
}

.style5 img {
	cursor: pointer;
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

		<script>
function seletOr() { //页面加载时  根据 单选按钮 显示相应的  隐藏块
	var c = ${message.publishObject=='所有人'?"1":"2"} ;
	 var c="${contrType}";
	 if(c=="update"){
		 $("#mf").attr("action","message/message!doUpdate.action");
		
	 }
	if(c==1){
		$("#radioAll")[0].checked=true;
		 $("#selectFw")[0].style.display="block";
	}
	 if($("#radioAll")[0].checked!=true){
		 $("#selectFw")[0].style.display="block";
	 }
	else{
		$("#selectFw")[0].style.display="none";}
}
</script>
	</head>
	<body onload="seletOr()">
		<s:form action="message!doAdd.action" onsubmit="return checkForm();"
			method="post" id="mf">
			<s:hidden name="memuId" />
			<s:hidden name="message.messageId" id="messageId" />
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
														</td>
														<td width="95%" class="STYLE1">
															<span class="STYLE3">你当前的位置</span>：[消息传递]-[消息管理]-[填写消息]
														</td>
													</tr>
												</table>
											</td>
											<td width="54%">
												&nbsp;
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
				<tr>
					<td valign="top">
						<table border="0" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center
										border=0 height="100%">

										<TR height="100%">
											<TD width="4%">
												&nbsp;
											</TD>
											<TD width="92%">
												<fieldset>
													<legend style="border-color: green;">
														<img alt="填写" src="images/33.gif">
														<span style="font-weight: bold; font-size: 15px;">
															填写消息</span>
													</legend>

													<table width="100%" style="font-size: 13px;" border="0">
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td align="right">
																消息标题:
															</td>
															<td>
																<s:textfield name="message.title" id="title"></s:textfield>
															</td>
															<td align="left" id="titleErr">
																&nbsp;
															</td>
														</tr>

														<tr>
															<td width="20%" align="right">
																消息类型:
															</td>
															<td>
																<s:select id="mType" list="#request.mtList"
																	name="message.messagetype.messageTypeId"
																	listKey="messageTypeId" listValue="messageTypeName">
																</s:select>
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<!-- 发送对象 的  操作 -->
														<script type="text/javascript">

function closeSelect() { //关闭筛选
	$("#selectFw")[0].style.display = "none";
	$("#selectObj")[0].style.display = "none";
}
function openSelect() {
	$("#selectFw")[0].style.display = "block";

}
function openMachine() {       //控制 机构选项
	if ($("#machineSelect").attr("disabled")=="disabled") {
	
		//$("#machineSelect").attr("disabled",false);
		$("#machineSelect")[0].disabled=false;
	} else {
		
		$("#machineSelect").attr("disabled", "disabled");
		$("#machineSelect").attr("value", "0"); //关闭时 恢复默认值
	}
}
 function opendept() { //控制 部门选项
	if ($("#deptSelect").attr("disabled") == "disabled") {
		$("#byMachine").attr("checked", "checked");
			$("#machineSelect")[0].disabled=false;
		$("#deptSelect")[0].disabled =false;
	} else {
		$("#deptSelect").attr("disabled", true);
		$("#deptSelect").attr("value", "0");
	}
}
 function openUser() { //控制 姓名 查找

	if ($("#selectName").attr("disabled") == "disabled") {
		$("#selectName")[0].disabled = false;
	} else {
		$("#selectName").attr("disabled", true);
		$("#selectName").val(""); //关闭时  清空
	}
}
function getDepts(obj){ // 连级 部门 和机构
	$.ajax( {
		type : "post",
		url : "message/message!getDepts.action",
		data : "machineId=" + obj.value,
		dataType : "json",
		success : function(data) {
			var jdObj = $("#deptSelect");
			jdObj.empty();
			jdObj.append("<option value='0'>请选择--</option>");
			
			for(var i=0;i<data.length;i++){
				var option = $("<option></option>");
				option.append(data[i].deptName).attr("value",data[i].deptId);
				jdObj.append(option);
			}
			//for(var index in data){                ???????????????????为什么会多出那么多 空呢？？？？？
			//	alert(data[index].deptName);
				//var option = $("<option></option>");
				//option.append(data[index].deptName).attr("value",data[index].deptId);
				//jdObj.append(option);
			//}
		},
		error : function() {
			var jdObj = $("#deptSelect");
			jdObj.empty();
			jdObj.append("<option value='0'>请选择--</option>");
		}
	});
}
function tosearch() { //通过筛选 得到 用户
	var machine = $("#machineSelect").val();
	var dept = $("#deptSelect").val();
	var uName = $("#selectName").val();
	//alert(uName.length);
	var m = parseInt(machine);
	var d = parseInt(dept);
	if (d != 0 || m != 0 || uName != "") {
		$.ajax({
					type : "post",
					url : "message/message!getUsers.action",
					data : "machineId=" + machine + "&deptId=" + dept
							+ "&username=" + uName,
					dataType : "json",
					success : function(data) {
						//alert("查询结果数：" + data.length);
						var cbox = $("#userBox");
						if (data.length > 0) {
							$("#selectObj")[0].style.display = "block";
							if (data.length == 1)
								$("#leftCheck")[0].style.display = "none";
							else {
								$("#leftCheck")[0].style.display = "block";
							}
							// cbox.empty();
					for ( var i=0;i<data.length;i++) {
						var useArr = $("#userBox input").toArray();
						//alert("已存在个数："+$("#userBox input").toArray().length);
					if (useArr.length > 0) {
						if (useArr.length >= 1)
							$("#leftCheck")[0].style.display = "block"; //防止第二次 查询结果为1 就要累加 让全选 勾上
						for ( var int = 0; int < useArr.length; int++) { //判断已存在的 与 新查询出来的  是否有重复
							if (useArr[int].value == data[i].userId) {
								$("#ids").remove();
								$("#span").remove();
								$("#selects").append("<img id='ids' src='images/error.png' align='middle' /><span id='span'>重复了!</span>"); //重复了
								useArr[int].remove();
								//移除掉
							}

						}
					}
					var checkbox = $("<input type='checkbox'/>");
					checkbox.attr("name", "userIds");
					checkbox.attr("value", data[i].userId);
					cbox.append(checkbox);
					cbox.append(data[i].realName);
				}
			} else {
				$("#ids").remove();
				$("#span").remove();
				$("#selects")
						.append(
								"<img id='ids' src='images/error.png' align='middle' /><span id='span'>没找到!</span>");
			}
		},
		error : function() {

		}
				});
	} else {
		$("#ids").remove();
		$("#span").remove();
		$("#selects")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>给点条件咯!</span>");
	}
}
function checkAll(obj) { //全选
	if (obj.checked == true) {
		$("#showText").html("反选");
	} else {
		$("#showText").html("全选");
	}

	var checkEd = $("#userBox input:checked");
	//先选中所有选中的 
	$("#userBox input").attr("checked", true);
	checkEd.attr("checked", false);
	//把已经选中的反转()
}

function checkForm() { //表单验证

	if ($("#radioAll")[0].checked != true) {
		if (checkTitle() && checkEndTime() && checkSearch() && checkUser()
				&& checkContent())
			return true;
	} else {
		if (checkTitle() && checkEndTime() && checkContent())
			return true;
	}

	return false;

}
function checkTitle() { //检查标题
	var title = $("#title").val();
	$("#selects").removeClass("showRed");
	$("#content").removeClass("showRed");
	$("#endTime").removeClass("showRed");
	$("#userBox").removeClass("showRed");
	$("#ids").remove();
	$("#span").remove();
	if (title == null || title == "") {
		$("#title")
				.parent()
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入标题!</span>");
		$("#title").addClass("showRed");
		$("#title")[0].focus();
		return false;
	}
	return true;
}
function checkEndTime() { //检查 结束时间
	var endTime = $("#endTime");
	$("#selects").removeClass("showRed");
	$("#content").removeClass("showRed");
	$("#title").removeClass("showRed");
	$("#userBox").removeClass("showRed");
	$("#ids").remove();
	$("#span").remove();

	if (endTime.val() == null || endTime.val() == "") {
		endTime.addClass("showRed");
		endTime
				.parent()
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请选择结束时间!</span>");
		endTime[0].focus();
		return false;
	}
	return true;
}
function checkSearch() { //查询筛选
	$("#endTime").removeClass("showRed");
	$("#content").removeClass("showRed");
	$("#title").removeClass("showRed");
	$("#userBox").removeClass("showRed");
	$("#ids").remove();
	$("#span").remove();
	if ($("#userBox input").size() == 0) {
		$("#selects").addClass("showRed");
		$("#selects")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请筛选对象!</span>");
		return false;
	}
	return true;
}
function checkUser() { //检查 选择对象
	$("#selects").removeClass("showRed");
	$("#content").removeClass("showRed");
	$("#title").removeClass("showRed");
	$("#endTime").removeClass("showRed");

	$("#ids").remove();
	$("#span").remove();
	if ($("#userBox input:checked").size() == 0) { //没有选中
		$("#userBox").addClass("showRed");
		$("#userErr")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请选择对象!</span>");
		return false;
	}
	return true;
}
function checkContent() { //检查内容
	$("#selects").removeClass("showRed");
	$("#title").removeClass("showRed");
	$("#endTime").removeClass("showRed");
	$("#userBox").removeClass("showRed");
	$("#ids").remove();
	$("#span").remove();
	var content = $("#content").val();
	if (content == null || content == "") {
		$("#content").addClass("showRed");
		$("#content")
				.parent()
				.append(
						"<img id='ids' src='images/error.png' align='bottom' /><span id='span' align='bottom'>请填写内容!</span>");
		return false;
	}
	return true;
}

function toAction(type) { //跳到 添加页面
	$("mf").attr("action", "message!doAdd.action");
	$("mf")[0].submit();

}
</script>
														<tr>
															<td width="20%" align="right">
																开始有效时间:
															</td>
															<td>
																<s:textfield id="beginTime" name="pageTime.beginTime"></s:textfield>
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td width="20%" align="right">
																结束有效时间:
															</td>
															<td>
																<s:textfield id="endTime" name="pageTime.endTime"
																	onfocus="WdatePicker({minDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm:ss'})"></s:textfield>
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td width="20%" align="right">
																发送对象:
															</td>
															<td>
																<input type="radio" name="radioObj" id="radioAll"
																	value="all" onclick="closeSelect()">
																所有人&nbsp;
																<input type="radio" name="radioObj" value="some"
																	onclick="openSelect()" checked="checked">
																选择特定对象
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr id="selectFw">
															<td colspan="3">
																<fieldset>
																	<legend>
																		<img src="images/ser.png" alt="筛选" />
																		<span style="font-weight: bold; font-size: 14px;">
																			筛选范围</span>
																	</legend>
																	<table width="100%" border="0" style="font-size: 13px;">
																		<tr>
																			<td width="10%" align="right">
																				&nbsp;
																			</td>
																			<td align="left">
											<input type="checkbox" id="byMachine"
																					onclick="openMachine()"/>
																				按机构&nbsp;&nbsp;
																				<input type="checkbox" onclick="opendept()"/>
																				按部门&nbsp;&nbsp;
																				<input type="checkbox" checked="checked"
																					onclick="openUser()"/>
																				按姓名&nbsp;
																			</td>
																			<td align="right">
																				&nbsp;
																			</td>
																		</tr>
																		<tr>
																			<td>
																				&nbsp;
																			</td>
																			<td id="selects">
																				机构:
									<select style="width: 150px;" id="machineSelect" onchange="getDepts(this)" disabled="disabled" >
																					<option value="0">
																						请选择--
																					</option>
																					<s:iterator value="#request.machineList" var="item">
																						<option value="${item.machineId}">
																							${item.machineName}
																						</option>
																					</s:iterator>
																				</select>
																				&nbsp;&nbsp;部门:
																				<select id="deptSelect" style="width: 150px;"
																					disabled="disabled">
																					<option value="0">
																						请选择--
																					</option>
																				</select>
																				&nbsp;&nbsp;姓名:
																				<s:textfield id="selectName" />
																			</td>
																			<td>
																				<input type="button" id="searchs" class="button"
																					onclick="tosearch()" value="找一找" />
																			</td>
																		</tr>

																	</table>
																</fieldset>
															</td>
														</tr>
														<tr id="selectObj" style="display: none;">
															<td colspan="2">
																<fieldset>
																	<legend>
																		<span style="font-weight: bold; font-size: 14px;">
																			(√)选择对象</span>
																	</legend>
																	<table width="100%" border="0" style="font-size: 13px;">
																		<tr>
																			<td width="10%">
																				&nbsp;
																			</td>
																			<td align="left" id="leftCheck" width="8%">
																				<input type="checkbox" id="selectAll"
																					onclick="checkAll(this)" />
																				<span id="showText">全选</span>
																			</td>
																			<td id="userBox"></td>
																			<td id="userErr"></td>
																		</tr>


																	</table>
																</fieldset>
															</td>
														</tr>
														<tr>
															<td align="right">
																消息内容:
															</td>
															<td>
																<s:textarea rows="6" cols="60" name="message.content"
																	id="content"></s:textarea>
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td align="right"></td>
															&nbsp;&nbsp;
															<td style="float: left; margin-left: 30%;">
																<table width="100%">
																	<tr>
																		<td width="30%" align="right">
																			<input type="submit" class="button" value="提交" />
																			&nbsp;
																			<input type="reset" class="button" value="重置" />
																		</td>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</fieldset>
											</TD>
											<TD width="4%">
												&nbsp;
											</TD>
										</TR>
									</TABLE>
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
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="STYLE4">
												&nbsp;
											</td>
										</tr>
									</table>
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
