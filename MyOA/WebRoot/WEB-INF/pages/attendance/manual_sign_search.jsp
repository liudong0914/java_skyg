<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'manual_sign_search.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">

function toSearch() {

	if ($("#beginTime").val() == "" && $("#endTime").val() == ""
			&& $("input:checked").size() == 0) {
		alert("请输入条件");
		$("#beginTime").focus();
	} else {
		$("#mf").attr("action", "attendance/manual_sign!search.action");
		$("#mf").submit();
	}
}
function toDel() { //通过Id批量删除
	var checkedInput = $("input:checked");

	if (checkedInput.size() > 0) {
		if (confirm("你确定要删除吗?")) {
			$("#mf").attr("action", "sys/operatelog!doDeleteByIds.action");
			$("#mf").submit();
		}
	} else {
		alert("请选中要删除的行");
	}

}
function rowClose() { //关闭搜索
	$("#searchRow")[0].style.display = "none";
}
</script>
		<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size: 12px;
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

#apDiv1 {
	position: absolute;
	width: 1069px;
	height: 325px;
	z-index: 1;
	left: 19px;
	top: 77px;
}

#apDiv2 {
	position: absolute;
	width: 840px;
	height: 37px;
	z-index: 2;
	left: 33px;
	top: 85px;
}

#apDiv3 {
	position: absolute;
	width: 721px;
	height: 26px;
	z-index: 3;
	left: 58px;
	top: 92px;
}

#apDiv4 {
	position: absolute;
	width: 312px;
	height: 25px;
	z-index: 1;
	left: 375px;
	top: 6px;
}

#apDiv5 {
	position: absolute;
	width: 1007px;
	height: 193px;
	z-index: 1;
	left: 23px;
	top: 106px;
}
</style>
	</head>

	<body>
	<form action="" id=mf method="post">
			<input type="hidden" name="pageNumer" id="pageNum"
					value="${pager.pageNumber}" />
			<input type="hidden" name="memuId" value="${submemu.memuId}" />
		<jsp:include page="/WEB-INF/pages/common/position.jsp"></jsp:include>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr id="searchRow" height="25px;">
					<td>
						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" height="22" background="images/tab_12.gif">&nbsp;
									
								</td>
								<td>
									<table
										style="border: 1px solid #6CC; text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 12px;"
										width="100%" bgcolor="#FFFFFF" border="0" cellpadding="0"
										cellspacing="0">
										<Tr>
											<td width="25%" height="22">&nbsp;
												
											</td>
											<td height="22" width="45%">
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
													onclick="cc(new Date(),this)" value="1" />
												本日
												<input type="radio" name="pageTime.dateNum" id="week"
													onclick="cc(new Date(),this)" value="7" />
												本周
												<input type="radio" name="pageTime.dateNum" id="month"
													onclick="cc(new Date(),this)" value="30" />
												本月
											</td>
											<td height="22" valign="middle" align="left" width="20%">
												<img align="middle"" src="images/sousuo.gif"
													style="cursor: pointer;" onclick="toSearch()">
											</td>
											<td align="right" width="15%" height="22">&nbsp;
												
											</td>
										</Tr>
									</table>
								</td>
								<td width="8" background="images/tab_15.gif">&nbsp;
									
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<!--搜索行结束-->
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">&nbsp;
									
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()">
										<tr
											style="text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 13px;">
											<td width="5%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">选定(√)</span>
												</div>

											</td>
											<td width="5%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">序号</span>
												</div>
											</td>
											<td width="10%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">考勤人员</span>
												</div>
											</td>
											<td width="10%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">考勤</span>
												</div>
											</td>
											<td width="14%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">考勤备注</span>
												</div>
											</td>
											<td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">考勤时间</span>
												</div>
											</td>

										</tr>
										<!---循环开始-->
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="operatelogIds"
															value="${item.signId}" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" class="STYLE1">
														<div align="center">
															${item.signId}
														</div>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.users.userName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1"> <s:if
																test="#item.signTag == 1">
					签到
				</s:if> <s:else>
					签退
				</s:else> </span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">${item.signDesc} </span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1"> <f:formatDate
																value="${item.signTime}" pattern="yyyy-MM-dd hh:mm:ss" />
														</span>
													</div>
												</td>
											</tr>
										</s:iterator>
										<!---循环结束-->
									</table>
								</td>
								<td width="8" background="images/tab_15.gif">&nbsp;
									
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
