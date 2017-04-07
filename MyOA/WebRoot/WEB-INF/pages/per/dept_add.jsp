<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'dept_add.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<style>
.showRed {
	border: solid red 1px;
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
</style>
	<script>
function fanhui() {
	location.href = "dept!list.action";
}
function checkDeptName() { //当焦点 离开文本框时用Ajax  检查用户是否已存在及显示 提示信息
	var nm = $("#deptName").val();
	var check = true;
	check = check && checkName();
	if (check) {
		$.ajax( {
			type : "post",
			url : "per/dept!checkName.action",
			data : "name=" + nm + "&oper=add",
			dataType : "json",
			success : function(data) {
				var showtd = $("#imgSpan");
				showtd.empty();
				var img = $("<img/>");
				var span = $("<span></span>");
				img.attr("src", "images/" + data.status + ".png");
				span.html(data.message);
				showtd.append(img);
				showtd.append(span);
				if (data.status == "error") {
					$("#deptName").select();
				}
			},
			error : function() {
			}
		});
	}
}

function checkForm() {
	if (checkName() && checkcon1() && checkcon2() && checkFaxes())
		return true;
	return false;
}

function checkName() {
	var name = $("#deptName").val();
	$("#imgSpan").html("");
	if (name == null || name == "") {
		$("con1").removeClass("showRed");
		$("con2").removeClass("showRed");
		$("#faxes").removeClass("showRed");
		$("#cons1").html("");
		$("#cons2").html("");
		$("#faxes").html("");

		$("#imgSpan")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入部门名称!</span>");
		$("#deptName").addClass("showRed");
		$("#deptName")[0].focus();
		return false;
	}
	return true;
}
function checkcon1() {
	var name = $("#con1").val();
	$("#cons1").html("");
	if (name == null || name == "") {
		$("#deptName").removeClass("showRed");
		$("con2").removeClass("showRed");
		$("#faxes").removeClass("showRed");
		$("#imgSpan").html("");
		$("#cons2").html("");
		$("#faxes").html("");
		$("#cons1")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入联系电话!</span>");
		$("#con1").addClass("showRed");
		$("#con1")[0].focus();
		return false;
	}
	return true;
}
function checkcon2() {
	var name = $("#con2").val();
	$("#cons2").html("");
	if (name == null || name == "") {
		$("#deptName").removeClass("showRed");
		$("#con1").removeClass("showRed");
		$("#faxes").removeClass("showRed");
		$("#imgSpan").html("");
		$("#cons1").html("");
		$("#faxes").html("");
		$("#cons2")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入移动电话!</span>");
		$("#con2").addClass("showRed");
		$("#con2")[0].focus();
		return false;
	}
	return true;
}
function checkFaxes() {
	var name = $("#faxes").val();
	$("#faxes1").html("");
	if (name == null || name == "") {
		$("#deptName").removeClass("showRed");
		$("#con1").removeClass("showRed");
		$("#con2").removeClass("showRed");
		$("#imgSpan").html("");
		$("#cons2").html("");
		$("#cons1").html("");
		$("#faxes1")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入传真!</span>");
		$("#faxes").addClass("showRed");
		$("#faxes")[0].focus();
		return false;
	}
	return true;
}
</script>


	<body>
		<s:form action="dept!doAdd.action" id="mf" method="post"
			onsubmit="return checkForm();">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<s:hidden id="id" name="dept.deptId" />
				<tr>
					<td height="35" background="images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr></tr>
							<tr>
								<td height="30" background="images/tab_05.gif">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="12" height="30">
												<img src="images/tab_03.gif" width="12" height="30" />
											</td>
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="46%" valign="middle">
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tr>
																	<td width="95%" class="STYLE1">
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
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
																								<span class="STYLE3">你当前的位置</span>：[人事管理]-[部门信息]-[部门添加]
																							</td>
																						</tr>
																					</table>
																				</td>
																				<td width="54%">
																					&nbsp;
																				</td>
																				<td width="60">
																					&nbsp;
																				</td>
																				<td width="60">
																					&nbsp;
																				</td>
																				<td width="52">
																					&nbsp;
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
											<td width="3%" height="22" bgcolor="#FFFFFF">
												<!------开始---->

												<table align="center"
													style="border: 1px solid #33CCFF; font-size: 13px;"
													width="76%" cellpadding="1" cellspacing="8">
													<tr>
														<td align="right" width="30%">
															部门名称：
														</td>
														<td width="27%">
															<s:textfield onblur="checkDeptName()" id="deptName"
																name="dept.deptName" />
														</td>
														<td id="imgSpan">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															所属机构：
														</td>
														<td>
															<s:select name="dept.machine.machineId" list="mlist"
																listKey="machineId" listValue="machineName"></s:select>
														</td>
														<td i>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															部门负责人：
														</td>
														<td>
															<s:select name="dept.users.userId" list="uList"
																listKey="userId" listValue="userName"></s:select>
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															联系电话：
														</td>
														<td>
															<s:textfield name="dept.connectTelNo" id="con1" />
														</td>
														<td id="cons1">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															移动电话：
														</td>
														<td>
															<s:textfield name="dept.connectMobileTelNo" id="con2" />
														</td>
														<td id="cons2">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															传真：
														</td>
														<td>
															<s:textfield name="dept.faxes" id="faxes" />
														</td>
														<td id="faxes1">
															&nbsp;
														</td>
													</tr>
													<tr height="50">
														<td>
															&nbsp;
														</td>
														<td align="left">
															<s:submit id="add" value="保存" cssClass="button" />
															&nbsp;&nbsp;
															<s:reset value="重置" cssClass="button" />
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
												</table>
												<!------结束------->
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
					<td height="35" background="images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35">
									<img src="images/tab_18.gif" width="12" height="35" />
								</td>
								<td>
									&nbsp;
								</td>
								<td width="16">
									<img src="images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
		</s:form>
	</body>
</html>
