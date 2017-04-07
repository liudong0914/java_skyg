<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@page import="com.chen.entity.Memu"%>

<style>
<!--
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
	input text{
		border:1px solid #6CF;
		color:#2995CF;
	}
	table{
		font-size:12px;
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
-->
</style>
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
														<span class="STYLE3">你当前的位置</span>：[${memu }]-[${submemu.displayName }]
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
															<%Memu memu = (Memu)request.getAttribute("submemu");
																if(memu != null){
																	if(memu.getDisplayName().equals("文档管理")){ %>
																<td class="STYLE1">
																	<div align="center">
																		<img src="images/22.gif" width="14" height="14" />
																	</div>
																</td>
																<td class="STYLE1">
																	<div align="center">
																	
																		<a href="file/file_info!toAddFile.action?memuId=${submemu.memuId }">新增</a>
																
																	</div>
																</td>
														<%} }%>
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
