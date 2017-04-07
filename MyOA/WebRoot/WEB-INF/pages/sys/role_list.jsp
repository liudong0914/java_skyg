
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>角色管理</title>
		<style type="text/css">
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

.imaStyle1 {
	width: 14px;
	height: 14px;
	border: none;
}

.aStyle1 {
	text-decoration: none;
}

.cur_pointer {
	cursor: pointer;
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
</style>
		<script type="text/javascript">
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

 function checkFrom(){
  if(checkName()&&checkDesc())
  return true;
  return false;
 }
 function checkName(){  //角色名称检查
  var roleName=$("#roleName");
    if(roleName.val()==null||roleName.val()==""||roleName.val()=="请在这输入角色名称!"){
     roleName.val("请在这输入角色名称!");
       roleName.select();
     return false;
    }
  return true;
}
   function checkDesc(){  //角色说明检查
  var roleDesc=$("#roleDesc");
    if(roleDesc.val()==null||roleDesc.val()==""||roleDesc.val()=="请在这输入角色说明!"){
     roleDesc.val("请在这输入角色说明!");
       roleDesc.select();
     return false;
    }
  return true;
}
function toAction(){ //到指定 action 操作
    var operButton=$("#updateButton").attr("value");
   if(checkFrom()){
   if(operButton=="添加"){
     $("#mf").attr("action","sys/role!doAdd.action");
         $("#mf").submit();
        }
      if(operButton=="保存修改"){
        $("#mf").attr("action","sys/role!doUpdate.action");
         $("#mf").submit();
         }
}
}
function rowClose(){     //点击关闭按钮是 清空 表单 再 关闭
 $("#roleName").val("");
       $("#roleDesc").val("");
       $("#showStatus").html("");
 $("#addRow")[0].style.display="none";
}
function operRow(operate,name,desc,id){  //操作添加页面
  
 if(operate==1){
 $("#addAuthRow")[0].style.display="none";
   $("#addRow")[0].style.display="block";
    $("#updateButton").attr("value","添加");
    $("#roleName").val("");
     $("#roleDesc").val("");
    $("#roleName").focus();
   /* $("#updateButton").attr("disabled","disabled");
       $("#addButton").attr("disabled","enabled");*/
    } 
    if(operate==2){
   	 $("#addAuthRow")[0].style.display="none";
     $("#updateButton").attr("value","保存修改");
      $("#addRow")[0].style.display="block";
       $("#showStatus").html("");
      /* $("#roleId").val(id);
       alert($("#roleId").val());*/
         $("#roleId").attr("value",id);
      $("#roleName").val(name);
      $("#roleName").select();
      $("#roleDesc").val(desc);
    }
}
function checkRoleName(){    //当焦点 离开文本框时用Ajax  检查用户是否已存在及显示 提示信息
     var operButton=$("#updateButton").attr("value");
     var roleName=$("#roleName").val();
     	var check = true;
    check=check&&checkName();
    if(check){
      $("#showStatus").html("");
      if(operButton=="添加"){
     $.ajax({
			type:"post",
			url:"sys/role!checkName.action",
			 data: "name="+roleName+"&&oper=add",
			 dataType: "json",
			 success:function(data){
		var img=$("<img/>");
		var span=$("<span></span>")
		img.attr("src","images/"+data.status+".png");
		span.html(data.message);
			$("#showStatus").append(img);
		$("#showStatus").append(span);
			   if(data.status=="error"){
			      $("#roleName").select();
			   }
			 	},
			 	 error:function(){
			 	 }
			 });
		}
		
		if(operButton=="保存修改"){
		var roleId= $("#roleId").val();//保存修改时，验证用户名是否存在，要把当前要修改的角色 排除在外
     $.ajax({
			type:"post",
			url:"sys/role!checkName.action",
			 data: "name="+roleName+"&&oper=update"+"&&id="+roleId,
			 dataType: "json",
			 success:function(data){
		var img=$("<img/>");
		var span=$("<span></span>")
		img.attr("src","images/"+data.status+".png");
		span.html(data.message);
			$("#showStatus").append(img);
		$("#showStatus").append(span);
			   if(data.status=="error"){
			      $("#roleName").select();
			   }
			 	},
			 	 error:function(){
			 	 
			 	 }
			 });
		}
			 }
}

  function deleteId(objId){  //通过一个Id删除一个
     $("#mf").attr("action","sys/role!doDelete.action?roleId="+objId);
         $("#mf").submit();
  }
  
   function deleteIds(){  //通过Id批量删除
   var checkedInput=$("input:checked");

  if( checkedInput.size()>0){
   
    if(confirm("你确定要删除吗?")){
	$("#mf").attr("action","sys/role!doDeleteByIds.action");
			$("#mf").submit();
	}
	}
	else{alert("请选中要删除的行");}
	
	}
	 function toUpdate(){  //提示一次只能修改一行
    alert("请选择一行修改！");

	}
</script>
	</head>
	<body >
		<s:form action="role!list.action" method="post" id="mf" >
			<s:hidden name="pager.pageNumber" id="pageNum"></s:hidden>
			<s:hidden name="role.roleId" value="" id="roleId"></s:hidden>
			<s:hidden name="memuId"  id="memuId"></s:hidden>
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
																<img  src="images/tb.gif" width="16" height="16" />
															</div>
														</td>
														<td width="95%" class="STYLE1">
															<span class="STYLE3">你当前的位置</span>：[系统管理]-[角色管理]
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
																			<input type="checkbox"  id="checkboxAll"   name="checkboxAll"
																				value="checkbox" />
																				         <script type="text/javascript">
                    $(function(){
     			 	  	$("#checkboxAll").click(function(){
     			 	  	 if($("#checkboxAll").attr("checked")=="checked"){
		  				 	$("#showText").html("反选");
		  				 }
		  				 else {
		  				 	$("#showText").html("全选");
		  				 }
     				 	var $checkedInput=$("#showList input:checked");
		  				//先选中所有选中的 (不包括本身)
		  				$("#showList input").attr("checked",true);
		  				//把已经选中的反转(不包括本身)
		  			
		  				$checkedInput.attr("checked",false);
     					 })
     				 })
                    </script>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div id="showText" align="center" style="color: blue;">
																			全选
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
																			<a href="javascript:operRow(1,null,null,null);"><img
																					src="images/22.gif" class="imaStyle1" />
																			</a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:operRow(1,null,null,null);"
																				class="aStyle1">新增</a>
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
																			<a href="#"><img class="imaStyle1"
																					src="images/33.gif" />
																			</a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:toUpdate()" class="aStyle1">修改</a>
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
																			<a href="#"><img src="images/11.gif"
																					class="imaStyle1" />
																			</a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javascript:deleteIds()" class="aStyle1">删除</a>
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
				<!-- 添加角色显示 的行 -->
				<tr style="display: none;" id="addRow">
					<td>
						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" height="100%" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table style="border: 1px solid #6CC" width="100%"
										bgcolor="#FFFFFF">
										<tr>
											<TD align="right" width="40%">
												角色名称
											</TD>
											<TD align="left" width="15%">
												<s:textfield onblur="checkRoleName()" name="role.roleName"
													id="roleName" bgcolor="#FFFFFF"></s:textfield>
											</TD>
											<TD align="left" width="35%" valign="bottom" id="showStatus"
												style="font-size: 13px;"></TD>

											<TD align="right" width="4%">
												<img alt="关闭" src="images/close.png" onclick="rowClose()">
											</TD>
										</tr>

										<tr>
											<TD align="right" valign="top">
												角色说明
											</TD>

											<TD align="left">
												<s:textarea rows="4" name="role.roleDesc" id="roleDesc"
													cols="20"></s:textarea>
											</TD>

											<TD>
												&nbsp;
											</TD>
											<TD>
												&nbsp;
											</TD>

										</tr>
										<tr>
											<td align="right">
												&nbsp;
											</td>
											<TD align="left">
												<input type="button" class="button" id="updateButton" class="STYLE1"
													onclick="toAction()" value="保存修改" style="width: 60px;" />
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
				
<!-- 添加角色显示 结束 -->
		<script type="text/javascript">
			function allotAuth(objid,objName){
			
			$("#roleId").attr("value",objid);
			$("#showRoleName").html(objName);
			$("#addRow")[0].style.display="none";
			  $("#addAuthRow")[0].style.display="block";
			}
			function rowClose2(){
			 $("#addAuthRow")[0].style.display="none";
			}
			function addAuth(){    //分配 权限
			  $("#mf").attr("action","sys/role!addMemu.action");
			if($("#memuTd ul li :input:checked").size()==0){
			if(confirm("您确定不给权限吗?")){
			 $("#mf")[0].submit();
			}
			}
				$("#mf")[0].submit();
			}
		</script>

<!-- 分配权限  显示的行 -->

				<tr  id="addAuthRow" style="display: none;" >
					<td>

						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr >
								<td width="8" height="100%" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table style="border: 1px solid #6CC" border="0" width="100%"
										bgcolor="#FFFFFF" cellspacing="0" cellpadding="2">
										<Tr style="background-image: url('images/bg.gif')">
										<td>&nbsp;</td>
										<td align="center" style="font-size:14px; font-weight: bolder;">您将给<<span id="showRoleName" style="color: blue"></span>>分配权限</td>
										<td align="right" width="7%" valign="top"><img alt="关闭" src="images/close.png" onclick="rowClose2()"></td></Tr>
										<tr >
											<TD align="right" width="7%" valign="top">
											<span style="text-align: left;font-weight: bolder;font-size: 13px;">选择权限(√)</span>
											</TD>
										<TD align="left" id="memuTd" width="86%">
										
										<s:iterator value="chirdmap" var="cdMap">
										<ul style="list-style: none; height:100px;width: 13.75%;border: 1px solid #6CC; float: left; margin-left: 8px;height: 104px;">
										<li style="width: 100%;font-weight: bold;font-size: 13px;"  >
										<input type="checkbox" name="memuIds"  value="${cdMap.key.memuId}"/>
											${cdMap.key.displayName}
											</li>
										<c:forEach   items="${cdMap.value}" var="item">
                                         	<li  style="float: left;margin-left: 20px;width: 100%;font-size: 13px;">
                                      	<input type="checkbox" name="memuIds" value="${item.memuId}"/>
                                      	${item.displayName}
                                      	</li>
                                                  </c:forEach>
										</ul>
											</s:iterator>
				        <script type="text/javascript">
				        
                    $(function(){
     			 	  	$("#memuTd ul li :input").click(function(event){
     			 	  	var obj=$(event.target);   //获取焦点的对象
     			 	  if(obj.val().length<=3){    //通过长度 判断是否 为 父 菜单
     			 	  	if(obj.attr("checked")=="checked"){       
     			 	  	obj.parent().nextAll("li").find(":input").attr("checked",true); //找到对应的子菜单 
     			 	  	}
     			 	  	else{
     			 	  	 	obj.parent().nextAll("li").find(":input").attr("checked",false);
     			 	  	}
     			}
     			  else{
     			   if(obj.attr("checked")=="checked")//选中当前按钮时 若父菜单没有选中  则选中
     			     obj.parent().prevAll().last().find(":input").attr("checked",true);
     			     else if(obj.attr("checked")!="checked" && obj.parent().parent().find(":checked").size()==1) //当前不选中是 关闭父菜单的 选择项（前提是其他同辈元素都没有选中）
     			      obj.parent().prevAll().last().find(":input").attr("checked",false);
     			  }
     					 })
     				 })
                    </script>							
											
				<!-- 分配角色结束 -->								
											</TD>
											<TD width="7">
												&nbsp;
											</TD>
										</tr>
										<tr>
											<td align="right">
												&nbsp;
											</td>
											<TD align="center">
												<input type="button" id="updateButton" class="button"
													onclick="addAuth()" value="提交" style="width: 60px;" />
													<input type="reset" id="updateButton" class="button"
													 value="重置" style="width: 60px;" />
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

<!-- 分配权限结束 -->

				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table id="showList" width="100%" border="0" cellpadding="0" style="text-align: left;" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()">
										<tr
											style="text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 13px;">
											<td width="5%" height="20" bgcolor="#FFFFFF">
											选定(√)
											</td>
											<td width="5%" height="20" bgcolor="#FFFFFF">
												ID
											</td>
											<td width="16%" height="20" bgcolor="#FFFFFF">
												角色名称
											</td>
											<td width="35%" height="20" bgcolor="#FFFFFF">
												角色说明
											</td>
											<td width="22%" height="20" bgcolor="#FFFFFF">
												基本操作
											</td>
												<td width="12%" height="20" bgcolor="#FFFFFF">
												分配角色权限
											</td>
										</tr>
<!-- 循环开始 -->
										<s:iterator value="pager.list" var="item">
											<tr>
												<td height="20" bgcolor="#FFFFFF" align="left">
													<div align="center">
														<input type="checkbox" name="roleIds" id="roleIds"
															value="${item.roleId}" />

													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="left">
													<div align="center" class="STYLE1">
														<div align="cneter">
															${item.roleId}
														</div>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="left">
													<div align="left">
														<span class="STYLE1">${item.roleName}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" >
													<div align="left">
														<span class="STYLE1">${item.roleDesc}</span>
													</div>
												</td>

												<td height="20" bgcolor="#FFFFFF" align="left">
													<div align="center">
														<span class="STYLE4"> <A
															href="javascript:operRow(2,'${item.roleName}','${item.roleDesc}',${item.roleId})"
															style="border: none; text-decoration: none"> <img
																	src="images/edt.gif" width="16" height="16"
																	style="border: none;" />编辑</A>&nbsp; &nbsp;<a
															href="javascript:deleteId(${item.roleId})"
															style="text-decoration: none;"><img
																	src="images/del.gif" width="16" height="16"
																	style="border: none;" />删除</a>
														</span>
													</div>
												</td>
												
												<td  height="20" bgcolor="#FFFFFF"  align="center"  >
												<div  align="center">
												<span class="STYLE4">
												 <a  width="16" height="16" href="javascript:allotAuth(${item.roleId},'${item.roleName}')" style="text-decoration: none;">
												<img src="images/yx.gif" style="border: none;">分配权限</a>
												
												</span>
										</div>	</td>
											</tr>
										</s:iterator>
<!-- 循环结束 -->

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
								</td>
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
