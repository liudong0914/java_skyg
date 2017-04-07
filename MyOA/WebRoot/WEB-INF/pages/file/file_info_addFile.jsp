<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<title>New Files</title>
		<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
	color: #2995CF;
}

a {
	text-decoration: none;
	color: #45C7ED;
}

ul {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

li {
	float: left;
	margin-left: 30px;
	margin-top: 20px;
}

input text {
}
table{
	font-size:12px;
}
#word {
	height: 500px;
	margin: 0 auto;
	padding-left: 10%;
	text-align: center;
}

#word div {
	margin-left: 0px;
	height: 80px;
	width: 700px;
}
#word li{
	padding:0px;
	margin:0px;
	margin-left:30px;
}
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}

#typeFile li {
	
}
#tb tr{
	height:50px;
}
</style>
	</head>

	<body>
		<table width="100%" cellpadding="0" cellspacing="0">
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
														<span class="STYLE3">你当前的位置</span>：[文档管理]-[新建文档]
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
																		&nbsp;
																	</div>
																</td>
																<td class="STYLE1">
																	&nbsp;

																</td>
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
		</table>
		<s:form action="file_info!doAddFile.action" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memuId" value="${submemu.memuId }" />
		<table border="0" cellpadding="0" cellspacing="0" width="100%" id="tb">
			<tr>
				<td>文件名:</td>
				<td><input type="text" name="files.fileName" /></td>
			</tr>
			<tr>
				<td>所属文件夹:</td>
				<td><s:select list="file" name="files.parentId" listKey="fileId" listValue="fileName"></s:select></td>
			</tr>
			<tr>
				<td>备注:</td>
				<td><textarea rows="3" name="files.remark" cols="30"></textarea></td>
			</tr>
			<tr>
				<td>文件路径:</td>
				<td><input type="file" name="header" id="0" /></td>
			</tr>
			<tr>
				<td>文件类型:</td>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<s:iterator value="fileTypeList" var="item">
								<td>
									<input type="radio" name="filetypeId"
										value="${item.fileTypeId }" />
									<img src="images/file/${item.fileTypeImage }" />
								</td>
						</s:iterator>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td><td><span style="margin-left: 300px;">所有者:${sessionScope.loginUser.userName}</span></td>
			</tr>
		</table>
	</s:form>
	</body>
</html>
