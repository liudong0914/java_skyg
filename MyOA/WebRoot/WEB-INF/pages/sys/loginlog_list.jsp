  <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@include file="/WEB-INF/pages/common/include.jsp" %> 
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
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
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
</head>
<body>
      <div style="margin: 0px auto; width: 100%; display: none;" id="jfchart" >
      <div style="100%" align="right"><img src="images/close.png" alt="g关闭" onclick="closeThis()"/></div>
      <table width="600px" align="center" style="text-align: center;">
        <tr>
      <td ><img src="jfreechart/loginjfAction.action" align="center"/></td></tr></table>
      </div>
<s:form action="sys/loginlog!list.action" id="mf" method="post">
	<s:hidden name="pager.pageNumber" id="pageNum"> </s:hidden>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="contrtable">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统管理]-[登录日志]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkboxAll" id="checkboxAll" value="checkbox" />
                    </div></td>
                    <td class="STYLE1"><div align="center" id="showText">全选</div></td>
                  </tr>
                         <script type="text/javascript">
                         function closeThis(){
                         $("#jfchart")[0].style.display="none";
                          $("#contrtable")[0].style.display="block";
                         
                         }
                              function jfshow(){
                    $("#contrtable")[0].style.display="none";
                 if($("#jfchart")[0].style.display!="none")
                   $("#jfchart")[0].style.display="none";
                 else{
                   $("#jfchart")[0].style.display="block";
                 }
                 }
                    $(function(){
     			 	  	$("#checkboxAll").click(function(){
     			 	  	 if($("#checkboxAll").attr("checked")=="checked"){
		  				 	$("#showText").html("反选");
		  				 }
		  				 else {
		  				 	$("#showText").html("全选");
		  				 }
     				 	var $checkedInput=$("input:checked:not(#checkboxAll)");
		  				//先选中所有 (不包括本身)
		  				$("input:checkbox:not(#checkboxAll)").attr("checked",true);
		  				//把已经选中的反转(不包括本身)
		  			
		  				$checkedInput.attr("checked",false);
     					 })
     				 })
                    </script>
                </table></td>
                    <td width="52">
                    <table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                    <a href="javascript:toSearch()"><img src="images/ser.png" width="14" height="14" style="border: none;"/></a></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:toSearch()"style="text-decoration: none;">搜索</a></div></td>
                  </tr>
                </table></td>
           
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="javascript:toDel()"><img src="images/11.gif" width="14" height="14"  style="border: none;"/></a></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:toDel()" style="text-decoration:  none;">删除</a></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  
  <!-- -搜索 行 开始 -->
  <script type="text/javascript">
 
  function toSearch(){
     if($("#beginTime").val()==""&&$("#endTime").val()==""&&$("input:checked").size()==0){
     alert("请输入条件");
      $("#beginTime").focus();
     }
     else{
      $("#mf").attr("action","sys/loginlog!list.action?search=search");
     $("#mf").submit();
     }
   }
  function toDel(){    //通过Id批量删除
   var checkedInput=$("input:checked");

  if( checkedInput.size()>0){
   
    if(confirm("你确定要删除吗?")){
	$("#mf").attr("action","sys/loginlog!doDeleteByIds.action");
			$("#mf").submit();
	}
	}
	else{alert("请选中要删除的行");}
	
	}
  function rowClose(){  //关闭搜索
	  $("#searchRow")[0].style.display="none";
  }
  </script>
  	<tr style="" id="searchRow">
					<td>
						<table width="100%" border="0" height="100%" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="8" height="22" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table style="border: 1px solid #6CC;text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 12px;" width="100%"
										bgcolor="#FFFFFF" border="0" cel0lpadding="0" cellspacing="0" >
						                	<Tr >
										<td width="25%" height="22">&nbsp;</td>
										<td  height="22" width="40%" >
										输入时间段:<s:textfield name="pageTime.beginTime"
										id="beginTime" bgcolor="#FFFFFF" onClick="WdatePicker({maxDate:'%y-%M-%d'})" size="10">
										</s:textfield>——<s:textfield name="pageTime.endTime"
													id="endTime" bgcolor="#FFFFFF" onClick="WdatePicker({maxDate:'%y-%M-%d'})" size="10"></s:textfield>
											<input  type="radio" name="pageTime.dateNum" id="today"  onclick="cc(new Date(),this)" value="1"/>本日
                                     <input  type="radio" name="pageTime.dateNum" id="week"   onclick="cc(new Date(),this)" value="7"/>本周
                                        <input  type="radio" name="pageTime.dateNum" id="month" onclick="cc(new Date(),this)"value="30"/>
本月
											</td>
											 <td height="22" valign="middle" align="left" width="20%">
										<img align="center" src="images/sousuo.gif" style="cursor: pointer;" onclick="toSearch()"> 
										</td>
										<td align="right" width="15%" height="22">
										<a href="javascript:jfshow()"><img src="images/chart-pie.png" style="border: none;"/></td></a>
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
  
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr style="text-align: center; background-image: url('images/bg.gif'); font-weight: bold; font-size: 13px;">
            <td width="5%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">选定(√)</span></div>
   
            </td>
            <td width="5%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">登录用户</span></div></td>
            <td width="20%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">登录时间</span></div></td>
            <td width="14%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">IP地址</span></div></td>
            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">是否成功</span></div></td>
            <td width="20%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">登录备注</div></td>
          </tr>
          
          <!---循环开始-->
          <s:iterator value="pager.list" var="item">
          <tr>
            <td height="20" bgcolor="#FFFFFF" ><div align="center">
              <input type="checkbox" name="loginlogIds" value="${item.loginId}" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">${item.loginId}</div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${item.users.userName}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"> <f:formatDate value="${item.loginTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </span></div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${item.loginUserIp}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${item.ifSuccess==1?"是":"否"}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4">${item.loginDesc}</span></div></td>
          </tr>
          </s:iterator>
            <!---循环结束-->
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>
        <%@include file="/WEB-INF/pages/common/page.jsp" %></td>
     
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</s:form>
</body>
</html>
