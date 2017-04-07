<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'dept_info.jsp' starting page</title>

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
.a1 {
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
</script>


	<body>
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
																					cellpadding="0" class="a1">
																					<tr>
																						<td width="5%">
																							<div align="center">
																								<img src="images/tb.gif" width="16" height="16" />
																							</div>
																						</td>
																						<td width="95%" class="STYLE1">
																							<span class="STYLE3">你当前的位置</span>：[人事管理]-[部门信息]-[部门详情]
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
												<tr height="40">
													<td align="right" width="50%">
														部门名称：
													</td>
													<td width="50%" style="color: #FF0000">
														${dept.deptName}
													</td>
												</tr>
												<tr height="40">
													<td align="right">
														所属机构：
													</td>
													<td>
														${dept.machine.machineName}
													</td>
												</tr>
												<tr height="40">
													<td align="right">
														部门负责人：
													</td>
													<td>
														${dept.users.userName}
													</td>
												</tr>
												<tr height="40">
													<td align="right">
														联系电话：
													</td>
													<td>
														${dept.connectTelNo}
													</td>
												</tr>
												<tr height="40">
													<td align="right">
														移动电话：
													</td>
													<td>
														${dept.connectMobileTelNo}
													</td>
												</tr>
												<tr height="40">
													<td align="right">
														传真：
													</td>
													<td>
														${dept.faxes}
													</td>
												</tr>
												<tr height="40">
													<td colspan="2" align="center">
														<input type="button" value="返&nbsp;回" onClick="fanhui();"
															class="button" />
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
	</body>
</html>
