<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'file_info_fmseach.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/common.css" rel="stylesheet" />
	<script type="text/javascript">
		function tantantantanzouyuweiwen(){
		}
		window.onload= tantantantanzouyuweiwen;
	</script>
	<style type="text/css">
		body{
		margin:0px;
		padding:0px;
		font-size:12px;
		color:#2995CF;
	}
	a{
		text-decoration:none;
		color:#45C7ED;
	}
	ul{
		margin:0px;
		padding:0px;
		list-style:none;
	}
	li{
		float:left;
		margin-left:30px;
		margin-top:20px;
	}
	input text{
		border:1px solid #6CF;
	}
	#word{
		height:500px;
		margin:0 auto;
		border:1px solid red;
		padding-left:10%;
		text-align:center;
	}
	#word div{
		margin-left:200px;
		height:80px;
		width:700px;
		border:1px solid black;
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
#typeFile li{
	
}

#left {
	border: 1px solid #B1CEEF;
	width: 270px;
	height: 400px;
	float: left;
}
#document li{
	float:none;
}

#document ul {
	margin: 0px;
	margin-left: 15px;
	padding: 0px;
}

#right {
	border: 1px solid #B1CEEF;
	width: 100%;
	height: 400px;
	margin-left: 250px;
	padding: 15px;
}

#documentManager {
	margin-top: 30px;1`
}

 table {
	font-size : 12px;
}
	</style>
  </head>
  
  <body>
  <jsp:include page="/WEB-INF/pages/common/position.jsp"></jsp:include>
<div id="documentManager">
<s:form action="file_info!doFmseach.action">
<input type="hidden" name="memuId" value="${submemu.memuId}"/>
			<div id="left">
				<div id="leftIn">
					<ul id="document">
						<li>
							<span>文件搜索</span>
						</li>
                        <li>
                        	<span>文件名:</span>
                        </li>
                        <li>
                        	<span><s:textfield name="name"></s:textfield></span>
                        </li>
                        <li>
                        	<span>文件备注:</span>
                        </li>
                        <li>
                        	<span><s:textfield name="remark"></s:textfield></span>
                        </li>
                        <li>
                        	<span><input type="submit"  value="搜索" /></span>
                        </li>
					</ul>
				</div>
			</div>
</s:form>
			<div id="right">
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
													<span class="STYLE1">选定(√)</span>
												</div>

											</td>
											<td width="5%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">名称</span>
												</div>
											</td>
											<td width="10%" height="22" background="images/bg.gif"
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
											<td width="14%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">创建日期</span>
												</div>
											</td>
											<td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">操作</span>
												</div>
											</td>

										</tr>
										<s:if test="pager.getList() <= 0">
											<tr align="center">
												<td colspan="5">对唔住...</td>
											</tr>
										</s:if>
										<!---循环开始-->
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="operatelogIds"
															value="${item.fileId}" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" class="STYLE1">
														<div align="center">
															<a href="fileInfo.action?fileName=${'FtpList.htm'}">${item.fileName}</a>
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
																value="${item.createDate}" pattern="yyyy-MM-dd hh:mm:ss" /> </span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1">
															<a href="javascript:del(${item.fileId},${submemu.memuId})">删除</a>
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
			</div>
		</div>
  </body>
</html>
