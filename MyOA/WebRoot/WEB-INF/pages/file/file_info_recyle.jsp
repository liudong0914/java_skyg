<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>New Files</title> <script type="text/javascript">
function del(fileId, memuId) {
	if (confirm("您确定删除吗?")) {
		window.location.href = "http://localhost:8080/MyOA/file/file_info!ifDel.action?fileId="
				+ fileId + "&memuId=" + memuId;
	}
}
function toSearch() {

	if ($("#beginTime").val() == "" && $("#endTime").val() == ""
			&& $("input:checked").size() == 0) {
		alert("请输入条件");
		$("#beginTime").focus();
	} else {
		$("#mf").attr("action", "file/file_info!recyle.action");
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
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}

a {
	text-decoration: none;
	color: #45C7ED;
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
				<tr id="searchRow" style="border: 1px solid red;">
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
											<td width="25%" height="22">
												&nbsp;
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
												<img align="center" src="images/sousuo.gif"
													style="cursor: pointer;" onclick="toSearch()">
											</td>
											<td align="right" width="15%" height="22">
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
				<!--搜索行结束-->
				<tr style="border: 1px solid red;">
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
										<tr
											style="text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 13px;">
											<td width="5%" height="22" background="images/bg.gif"
													bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">名称</span>
													</div>

												</td>
												<td width="5%" height="22" background="images/bg.gif"
													bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">类型</span>
													</div>
												</td>
												<td width="10%" height="22" background="images/bg.gif"
													bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">备注</span>
													</div>
												</td>
												<td width="10%" height="22" background="images/bg.gif"
													bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">创建日期</span>
													</div>
												</td>
												<td width="14%" height="22" background="images/bg.gif"
													bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">操作</span>
													</div>
												</td>

										</tr>
										<!---循环开始-->
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
														<div align="center" class="STYLE1">
															<div align="center">
																<a href="fileInfo.action?fileName=${item.filePath}">${item.fileName}</a>
															</div>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1">${item.filetype.fileTypeName}</span>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1">${item.remark} </span>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1"><f:formatDate
																	value="${item.createDate}"
																	pattern="yyyy-MM-dd hh:mm:ss" /> </span>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1"> <a
																href="javascript:del(${item.fileId},${submemu.memuId})">删除</a>
															</span>
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
