<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'dept_update.jsp' starting page</title>

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

.showRed {
	border: solid red 1px;
}
</style>
	<script type="text/javascript">
function contrast() {
	var m1 = $("#pass1").attr("value");
	var m2 = $("#pass2").attr("value");
	if (m1 != m2) {
		alert("密码不一致");
	}
}
function imgs() {
	$("#img").attr("src", $("#image").val);

}

function checkUserName() { //当焦点 离开文本框时用Ajax  检查用户是否已存在及显示 提示信息
	var nm = $("#userName").val();
	var check = true;
	check = check && checkName();
	if (check) {
		$.ajax( {
			type : "post",
			url : "per/users!checkName.action",
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

function checkForms() {
	if (checkName() && checkReal() && checkPass1() && checkPass2())
		return true;
	return false;
}
function checkName() {
	var name = $("#userName").val();
	$("#imgSpan").html("");
	if (name == null || name == "") {
		$("#realN").removeClass("showRed");
		$("#pass1").removeClass("showRed");
		$("#pass2").removeClass("showRed");
		$("#realNs").html("");
		$("#pass1s").html("");
		$("#pass2s").html("");
		$("#imgSpan")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入用户名!</span>");
		$("#userName").addClass("showRed");
		$("#userName")[0].focus();
		return false;
	}
	return true;
}
function checkReal() {
	var name = $("#realN").val();
	$("#realNs").html("");
	if (name == null || name == "") {
		$("#imgSpan").removeClass("showRed");
		$("#pass1").removeClass("showRed");
		$("#pass2").removeClass("showRed");
		$("#imgSpan").html("");
		$("#pass1s").html("");
		$("#pass2s").html("");
		$("#realNs")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入真实姓名!</span>");
		$("#realN").addClass("showRed");
		$("#realN")[0].focus();
		return false;
	}
	return true;
}
function checkPass1() {
	var name = $("#pass1").val();
	$("#pass1s").html("");
	if (name == null || name == "") {
		$("#userName").removeClass("showRed");
		$("#realN").removeClass("showRed");
		$("#pass2").removeClass("showRed");
		$("#pass2s").html("");
		$("#imgSpan").html("");
		$("#realNs").html("");
		$("#pass1s")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入密码!</span>");
		$("#pass1").addClass("showRed");
		$("#pass1")[0].focus();
		return false;
	}
	return true;
}
function checkPass2() {
	var name = $("#pass2").val();
	$("#pass1s").html("");
	if (name == null || name == "") {
		$("#userName").removeClass("showRed");
		$("#realN").removeClass("showRed");
		$("#pass1").removeClass("showRed");
		$("#pass1s").html("");
		$("#imgSpan").html("");
		$("#realNs").html("");
		$("#pass2s")
				.append(
						"<img id='ids' src='images/error.png' align='middle' /><span id='span'>请输入确认密码!</span>");
		$("#pass2").addClass("showRed");
		$("#pass2")[0].focus();
		return false;
	}
	return true;
}
function Upload() {
	
	var formObj = $("#mf");

	formObj.attr("action", "per/users!doUpload.action?ty=ss");
	
	formObj.submit();
}
</script>
	<body>

		<s:form action="per/users!doAdd.action" method="post" id="mf"
			enctype="multipart/form-data" onsubmit="return checkForms();">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
																								<span class="STYLE3">你当前的位置</span>：[人事管理]-[员工管理]-[员工添加]
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
														<td align="right">
															用户名：
														</td>
														<td width="27%">
															<s:textfield name="user.userName" id="userName"
																onblur="checkUserName()" />
														</td>
														<td id="imgSpan" width="22%">
															&nbsp;
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															姓名：
														</td>
														<td>
															<s:textfield name="user.realName" id="realN" />
														</td>
														<td id="realNs">
															&nbsp;
														</td>
														<td rowspan="3" align="center">
															<input type="hidden" name="imageFileName"
																value="${imageFileName}" />
															<s:if test="imageFileName!=null">
																<img src="images/user/${imageFileName}" id="img"
																	name="user.image" width="100" height="100"
																	onclick="Upload();" />
															</s:if>
															<s:else>
																<img src="images/user/20120918.jpg" id="img"
																	name="user.image" width="100" height="100"
																	onclick="Upload();" />
															</s:else>
														</td>
													</tr>
													<tr>
														<td align="right">
															密码：
														</td>
														<td>
															<s:textfield name="user.password" id="pass1" />
														</td>
														<td id="pass1s">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															确认密码：
														</td>
														<td>
															<s:textfield id="pass2" onblur="contrast();" />
														</td>
														<td id="pass2s">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															所属部门：
														</td>
														<td>
															<s:select name="user.dept.deptId" list="dlist"
																listKey="deptId" listValue="deptName"></s:select>
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
															性别：
														</td>
														<td>
															<s:radio list="#{0:'男',1:'女'}" name="user.gender"
																value="0"></s:radio>
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
															头像：
														</td>
														<td colspan="2">
															<input type="file" name="image" id="image" />
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right">
															角色：
														</td>
														<td>
															<s:select name="user.role.roleId" list="rList"
																listKey="roleId" listValue="roleName"></s:select>
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
															当前状态：
														</td>
														<td>
															<s:select name="user.userstate.userStateId" list="sList"
																listKey="userStateId" listValue="userStateName"></s:select>
														</td>
														<td>
															&nbsp;
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
														<td>
															<s:submit id="add" value="保存" cssClass="button" />
															<s:reset cssClass="button" value="重置" />
														</td>
														<td>
															&nbsp;
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