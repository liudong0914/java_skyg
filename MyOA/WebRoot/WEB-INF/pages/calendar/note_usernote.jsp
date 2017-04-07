<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'my_note_list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
					<style type="text/css">
			<!--
			.STYLE1 {
				font-size: 18pt;
				font-weight: bold;
			}
			
			.STYLE2 {
				font-size: 14pt
			}
			-->
			</style>
		<link href="${pageContext.request.contextPath }/css/Style2.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<p>
			当前位置：我的便签
		</p>

		<div align="center" style="position: absolute; top: 13%; left: 10%;">
			<center>
				<b>我 的 便 签</b>
			</center>
			<hr width="80%" />
			<br />
			<table width="80%" height="130%" border="0" align="center"
				class="alertText" cellpadding="0" cellspacing="0"
				style="border-top: solid #3da3a1 1px; border-right: solid #3da3a1 1px;"
				bordercolor="#3da3a1" >
				<tr>
					<td height="39" colspan="3" align="right" class="td">
						<a href="sch/my_note!add.action" class="alertText STYLE2"><strong>新增便签</strong>
						</a><a href="sch/my_note!add.action"><img src="images/ico/write.gif"
								width="16" height="16" border="0" />
						</a>
					</td>
				</tr>
				
				<s:iterator value="pager.list" var="item" status="s">
			<s:if test="#s.index%3==0"><tr></s:if>
				<td height="27" class="td" onMouseOut="this.style.backgroundColor=&quot;&quot;"
							onmouseover="this.style.backgroundColor=&quot;#dddddd&quot;"
							style="height: 28px;">
						<img src="images/add_Schedule.gif" width="15" height="15" />
					<a href="calendar/note!detail.action?id=${item.noteId }">${item.noteTitle }</a>	
					</td>
				<s:if test="#s.index3==2"></tr></s:if>
				</s:iterator>
			</table>
			
		</div>
	</body>
</html>
