<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Sign</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<title>Sign</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
function disptime() {
	var time = new Date(); //获得当前时间  
	// var year = time.getYear( );//获得年、月,日
	var year = time.getFullYear();

	var month = time.getMonth() + 1;
	//获得星期 
	var xingqi = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[time
			.getDay()];

	var day = time.getDate();

	var hour = time.getHours(); //获得小时、分钟、秒   
	var minute = time.getMinutes();
	var second = time.getSeconds();
	var apm = "AM"; //默认显示上午: AM        
	if (hour > 12) //按12小时制显示   
	{
		hour = hour - 12;
		apm = "PM";
	} //如果分钟只有1位，补0显示      
	if (minute < 10) {
		minute = "0" + minute;
	}
	if (second < 10) //如果秒数只有1位，补0显示    
		second = "0" + second;
	document.getElementById("myclock").innerHTML = year + "年" + month + "月"
			+ day + "日  " + hour + ":" + minute + ":" + second + " " + apm;
	var mytime = setTimeout(disptime, 1000);
}
window.onload = disptime;
window.setTimeout(disptime, 1000);
</script>
		<style type="text/css">
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

table {
	font-size: 12px;
}
</style>
	</head>

	<body>
		<s:form action="attendance/manual_sign!manualsign.action"
			method="post">
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
																								<span class="STYLE3">你当前的位置</span>：[考勤管理]-[考勤、签到、签退]
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
																									</tr>
																								</table>
																							</td>
																							<td width="60">
																								<table width="90%" border="0" cellpadding="0"
																									cellspacing="0">
																									<tr>
																									</tr>
																								</table>
																							</td>
																							<td width="60">
																								<table width="90%" border="0" cellpadding="0"
																									cellspacing="0">
																									<tr>
																									</tr>
																								</table>
																							</td>
																							<td width="52">
																								<table width="88%" border="0" cellpadding="0"
																									cellspacing="0">
																									<tr>
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
												<table width="100%" border="0" cellpadding="0"
													cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"
													onmouseout="changeback()">
													<tr>
														<td width="3%" height="22" bgcolor="#FFFFFF">
															<!------开始---->
															<input type="hidden" name="memuId"
																value="${submemu.memuId}" />
															<table width="100%" height="175" border="0"
																align="center" cellpadding="0" cellspacing="1">
																<tr>
																	<td width="99" height="23">
																		员工签到签退
																	</td>
																	<td width="269">
																		系统当前时间：
																		<span id="myclock"></span>
																	</td>
																</tr>
																<tr>
																	<td height="27" colspan="2">

																		<%
																			if (request.getAttribute("ifSign") != null) {
																					if (request.getAttribute("ifSign").toString()
																							.equals("true")) {
																		%>
																		<span>一天只能签到一次</span>
																		<%
																			}
																				}
																		%>
																		请输入签到备注:
																		<input type="text" name="manualSign.signDesc">
																		<s:submit name="sign" value="签到"></s:submit>
																	</td>
																</tr>
																<tr>
																	<td height="23" colspan="2">
																		签到时间：${signnowTime}
																	</td>
																</tr>
																<tr>
																	<td height="21" colspan="2">
																		<%
																			if (request.getAttribute("ifSign") != null) {
																					if (request.getAttribute("ifSign").toString().equals(
																							"false")) {
																		%>
																		<span>一天只能签退一次</span>
																		<%
																			}
																				}
																		%>
																		请输入签退备注:
																		<input type="text" name="manualSign.signDesc">
																		<s:submit name="sign" value="签退"></s:submit>
																	</td>
																</tr>
																<tr>
																	<td height="9" colspan="2">
																		签退时间：${backnowTime}
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
