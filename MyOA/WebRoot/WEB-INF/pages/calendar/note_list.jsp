
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>" />

		<title>登录日志</title>
		<style type="text/css">
<!--
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
a:link,a:visited {
	text-decoration: none; /*超链接无下划线*/
}

tr {
	cursor: pointer;
	
}
-->
</style>

		<script>
var highlightcolor = '#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var clickcolor = '#51b2f6';
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc"
			&& cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
}

function changeback() {
	if (event.fromElement.contains(event.toElement)
			|| source.contains(event.toElement) || source.id == "nc")
		return


if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}


</script>

<script type="text/javascript">
$(function() {
	$("#checkboxAll").click(function() {
		if ($("#checkboxAll").attr("checked") == "checked") {
			$("#showText").html("反选");
		} else {
			$("#showText").html("全选");
		}
		var $checkedInput = $("input:checked:not(#checkboxAll)");
		//先选中所有 (不包括本身)
			$("input:checkbox:not(#checkboxAll)").attr("checked", true);
			//把已经选中的反转(不包括本身)

			$checkedInput.attr("checked", false);
		})
})

	function divClose(){
		$("#searchRow").hide();
	}
</script>
	</head>
	<body onload="divClose()">
		<s:form action="calendar/note!list.action" id="mf" method="post" theme="simple">
			<s:hidden name="pager.pageNumber" id="pageNum"></s:hidden>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
															<span class="STYLE3">你当前的位置</span>：[日程管理]-[我的便签]
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
														<td width="52">
															<table width="88%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="#"><img src="images/ser.png" width="14"
																					height="14" style="border: none;" />
																			</a>
																		</div>
																	</td>
																	
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:rowOpen()" style="text-decoration: none;" >搜索</a>
																		</div>
																	</td>
																	
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<img src="images/22.gif" width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="calendar/note!add.action"
																				style="text-decoration: none;">新增</a>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														
														<td width="52">
															<table width="88%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toDel()"><img
																					src="images/11.gif" width="14" height="14"
																					style="border: none;" />
																			</a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:del()"
																				style="text-decoration: none;">删除</a>
																		</div>
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

				<!-- -搜索 行 开始 -->
				<script type="text/javascript">
$(function (){
	$("#machid").change(function(){
	//alert($("#machid").val());
	var deptId=${machine.depts.deptId==null?0:machine.depts.deptId};
	var machid=$("#machid").val();
		$.ajax({
			type:"post",
			url:"calendar/schedule!getDeptIds.action",
			 data: "machid="+machid,
			 dataType: "json",
			 success:function(data){
			
			
			 	 var deptidObj = $("#deptid");
			 	 
			 	 deptidObj.empty();
			     deptidObj.append($("<option></option>").append("--请选择--").attr("value","0"));
			      
			 	 for(var index in data){
			 	 
			 	 	if(data[index].deptId!=0){
			 	 		var optionObj = $("<option></option>");
				 	 	optionObj.append(data[index].deptName);
				 	 	optionObj.attr("value",data[index].deptId);
				 	 	if(deptId=data[index].deptId)
				 	 		optionObj.attr("selected","selected");
				 	 	deptidObj.append(optionObj);
			 	 	}
			 	 }
			 	},
			 	 error:function(){
			 	 	alert("error");
			 	 }
			 });
	});
	})

  function rowClose(){  //关闭搜索
	  $("#searchRow")[0].style.display="none";
  }
  function rowOpen(){//打开搜索 
  	 $("#searchRow")[0].style.display="block";
  }


	function showdiv(){
		$("#show").hide();
		
		
	}
	function del(){
	
	 	if(confirm("你确定要删除吗?")){
			var formObj = $("#mf");
				formObj.attr("action","calendar/note!delete.action");
				formObj.submit();
			}
		
	   }
	function listed(){
		  
            
        	$("#mf").attr("action","calendar/note!list.action?search=search");
	 		$("#mf").submit();
            	
           
	}
  </script>
				<tr style="" id="searchRow">
					<td>
						<table id="table1" width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0" >
							<tr>
								<td width="8" height="100%" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
								
								 	<table border="0" align="center">
										<tr class="STYLE1">

											<td width="22%" align="right">
												标题:
											</td>
											<td width="165">
												<s:textfield name="mynote.noteTitle" cssStyle="border: 1px solid #2995CF; font-size:12px; height:18px;" ></s:textfield>
											</td>

											<td width="69" align="right">
												创建时间:
											</td>
											<td width="168" align="left">

												<s:textfield name="mynote.createTime" cssClass="Wdate"
													onclick="WdatePicker()" cssStyle="border: 1px solid #2995CF; height:18px;"></s:textfield>
											</td>
											<td width="72" align="center">
												<img  src="images/sousuo.gif" onclick="listed()"/>
											</td>
											<TD align="right" width="9%">
												<img alt="关闭" src="images/close.png" onclick="rowClose()">
											</TD>
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

				<!--搜索行结束-->

				<tr>
					<td>
					<div id="show" style="display: block;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()">
										<tr>
											
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
											<td width="32%" background="images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">便签标题</span>
												</div>
											</td>
											<td width="35%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">便签内容</span>
												</div>
											</td>
											<td width="15%" height="22" background="images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													创建时间
												</div>
											</td>
										</tr>
										<s:if test="pager.list.size()>0">

											<s:iterator value="pager.list" var="note">



												<tr>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<input type="checkbox" id="noteIds" name="noteIds"
																value="${note.noteId}"></input>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center" class="STYLE1">
															<div align="center">
																${note.noteId}
															</div>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1"><a
																href="calendar/note!detail.action?id=${note.noteId}">${fu:substring(note.noteTitle,0,6)}</a> </span>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE1">${fu:substring(note.noteContent,0,10)}</span>
														</div>
													</td>
													<td height="20" bgcolor="#FFFFFF">
														<div align="center">
															<span class="STYLE4">${note.createTime}</span>
														</div>
													</td>
												</tr>

											</s:iterator>
										</s:if>
										<s:else>
											<tr>
													
													<td width="900" colspan="4" align="center" >
													对不起没有该信息！ 
													</td>
													
												</tr>
										</s:else>
									</table>
								</td>
								<td width="8" background="images/tab_15.gif">
									&nbsp;
								</td>
							</tr>
						</table>
						</div>
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
									<%@include file="/WEB-INF/pages/common/page.jsp"%></td>

								<td width="16">
									<img src="images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
