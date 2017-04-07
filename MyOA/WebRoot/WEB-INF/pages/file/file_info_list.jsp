<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文件管理</title>
		<script type="text/javascript" src="<%=basePath%>dtree/dtree.js">
</script>
		<link rel="stylesheet" href="<%=basePath%>dtree/dtree.css" />
		<script type="text/javascript">
function del(fileId, memuId) {
	if (confirm("您确定删除吗?")) {
		window.location.href = "http://localhost:8080/MyOA/file/file_info!del.action?fileId="
				+ fileId + "&memuId=" + memuId;
	}
}
function toSearch() {
	var mf = $("#mf");
	mf.submit();
}
$(function() {

	//获取图片img元素
	var img = $("#outDiv #inDiv img");
	var topPrent = $(".topPrent");
	//获取每个menu
	var menu = $(".menu");
	var topImage = $("#topImage");
	var inmenu = $(".inmenu");
	inmenu.hover(function() {
		$(this).addClass("back2");
	}, function() {
		$(this).removeClass("back2");
	});
	topPrent
			.bind("click", function() {
				var folder = $(this).find("#folderId").val();
				var pa = $(this).parent().siblings().find(".inmenu");
				//判断子项是否隐藏
					//如果隐藏就显示，相反如果显示就隐藏
					if ($(this).next().is(":hidden")) {
						var index = topPrent.index(this);
						//判断是否是第一个
						if (index == 0) {
							//下一个元素显示
							$(this).next().show();
							//显示之后改变img的src属性
							$(this).find("img").attr("src",
									"images/file/minusbox.gif");
						} else {
							//下一个元素显示
							$(this).next().show();
							$(this).find("img").attr("src",
									"images/file/minusbox.gif");
						}
					} else {
						//判断是否是第一个
						if (topPrent.eq(0)) {
							//隐藏下一个元素
							$(this).next().hide();
							$(this).find("img").attr("src",
									"images/file/plusbox.gif");
						} else {
							$(this).next().hide();
							$(this).find("img").attr("src",
									"images/file/plusbox.gif");
						}
					}
				});
	topPrent.hover(function() {
		$(this).addClass("back");
	}, function() {
		$(this).removeClass("back");
	});

	function add() {
		document.write(folder);
	}
});
$(function() {
	$(".memu").click(function() {
		var filePath = $("#filePath");
		var parent = $(this).parent("div");
		var s = parent.find("#path").val();
		filePath.val(s);
	});
})
</script>
		<style type="text/css">
#outDiv {
	margin: 0px auto;
	width: 280px;
	height: 400px;
	float: left;
}

#inDiv {
	margin-top: 5px;
}

.inmenu {
	border: 1px solid #D5D5D5;
	border-top: none;
	border-left: none;
	border-right: none;
	width: 90%;
	margin: 0px auto;
	padding-left: 20px;
	height: 20px;
}

.topPrent {
	border: 1px solid #D5D5D5;
	border-top: none;
	border-left: none;
	border-right: none;
	width: 90%;
	margin: 0px auto;
	height: 20px;
}

.topPrent.back {
	background-color: #3AB7CD;
}

.inmenu.back2 {
	background-color: #A2D8E6;
}

#image {
	float: left;
	margin-left: 1px;
	padding-left: 22px;
	padding-top: 3px;
}

table {
	font-size: 12px;
}

a {
	text-decoration: none;
	color: #B1CEEF;
}

#right {
	margin-left: 250px;
	width: 100%;
	height: 100% px;
	margin-left: 200px;
}
</style>
	</head>

	<body>
		<div id="s"></div>
		<jsp:include page="/WEB-INF/pages/common/position.jsp"></jsp:include>
		<div id="outDiv" style="float: left;">
			<input type="hidden" name="memuId" id="memuId"
				value="${submemu.memuId}" />
			<div id="inDiv">
				<div class="topPrent">
					<div style="float: left; margin-left: 1px; padding-top: 4px;">
						<img id="topImage" src="images/file/plusbox.gif" />
					</div>
					<div style="padding-top: 3px;">
						文档
					</div>
				</div>
				<div style="display: none">
					<s:iterator value="file" var="items">
						<div class="menu">
							<div class="topPrent">
								<div id="image">
									<img src="images/file/plusbox.gif" />
								</div>
								<div style="padding-top: 3px;">
									<input type="hidden" name="folderId" id="folferId"
										value="${items.fileId}" id="folderId" />
									<input type="hidden" name="filePath" id="path"
										value="${items.filePath}" />
									<span class="memu" style="cursor: pointer;">${items.fileName}</span>
								</div>
							</div>
							<div style="display: none">
								<s:iterator value="subFile" var="subFileItems">
									<s:if test="#items.fileId eq #subFileItems.parentId">
										<s:if test="#subFileItems.filetype.fileTypeId == 1">
											<div class="topPrent" style="padding-left: 30px;">
												<div id="image">
													<img src="images/file/plusbox.gif" />
												</div>
												<div style="padding-top: 3px;">
													<input type="hidden" name="filePath" id="path"
														value="${subFileItems.filePath}" />
													<span class="memu" style="cursor: pointer;">${subFileItems.fileName}</span>
												</div>
											</div>
											<div style="display: none">
												<s:iterator value="subFile2" var="subItemss">
													<s:if test="#subFileItems.fileId eq #subItemss.parentId">
														<s:if test="#subItemss.filetype.fileTypeId == 1">
															<div class="topPrent" style="padding-left: 50px;">
																<div id="image">
																	<img src="images/file/plusbox.gif" />
																</div>
																<div style="padding-top: 3px;">
																	<input type="hidden" name="filePath" id="path"
																		value="${subItemss.filePath}" />
																	<span class="memu" style="cursor: pointer;">${subItemss.fileName}</span>
																</div>
															</div>
															<div style="display: none">
																<s:iterator value="subFile3" var="subFile3Items">
																	<s:if
																		test="#subItemss.fileId eq #subFile3Items.parentId">
																		<s:if test="#subFile3Items.filetype.fileTypeId == 1">
																			<div class="topPrent" style="padding-left: 70px;">
																				<div id="image">
																					<img src="images/file/plusbox.gif" />
																				</div>
																				<div style="padding-top: 3px;">
																					<input type="hidden" name="filePath" id="path"
																						value="${subFile3Items.filePath}" />
																					<span class="memu" style="cursor: pointer;">${subFile3Items.fileName}</span>
																				</div>
																			</div>
																		</s:if>
																	</s:if>
																</s:iterator>
															</div>
														</s:if>
													</s:if>
												</s:iterator>
											</div>
										</s:if>
									</s:if>
								</s:iterator>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
		<div id="right">
			<form action="file/file_info!fileInfo.action" id="mf" method="post">
				<input type="hidden" name="memuId" value="${submemu.memuId}" />
				<input type="hidden" name="pageNumber" id="pageNum"
					value="${pager.pageNumber}" />
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
													<input type="text" name="files.filePath" id="filePath" />
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
											bgcolor="b5d6e6">
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
																<a href="file/file_info!execute.action?fileName=${item.filePath}">${item.fileName}</a>
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
		</div>
	</body>
</html>
