  <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@include file="/WEB-INF/pages/common/include.jsp" %> 
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" />
<title>菜单排序</title>
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

</head>

<body>
<s:form action="memu/doUpdate.action" method="post" id="mf">
<input type="hidden"  name="memuId" id="pareMemuId" value="${memuId}" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr></tr>
    <tr>
      <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="95%" class="STYLE1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                          <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统管理]-[菜单排序]</td>
                        </tr>
                      </table></td>
                      <td width="54%">
              &nbsp;
                      
                      </td>
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

   <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="100%" height="22" bgcolor="#FFFFFF">
            <!------开始---->
            <fieldset style="width: 80%; margin-left:180px;"  >
                    	<legend><span style="font-size: 13px;font-weight: bold;">菜单排序</span></legend>
              <table width="80%" align="center" border="0" style="font-size: 13px;">
              <tr>
              <td width="5%" >&nbsp;</td> 
              
              <!--玄幻开始-->
              <script type="text/javascript">
              $(function(){
              $("#content ul li").click(function (event){
            var a=$(event.target);
           if(a[0].style.background!="#D6D6F1")
            a[0].style.background="#D6D6F1";
             else{
               a[0].style.background="#FFFF";
               }
               $("#"+a.val())[0].style.display="block";
                 $("#content ul li").not(a).css("background","#FFFF");
               $("#content ul li").not(a).find("div").css("display","none");
              });
                $("#content ul li > a").click(function (event){
                             var obj=$(event.target);
                       
                           if(obj.attr("src")!="images/collapse.gif"){
                               obj.attr("src","images/collapse.gif");
                                obj.parent().parent().nextAll("li").css("display","none");}
                               else{
                                obj.attr("src","images/expand.gif");
                                obj.parent().parent().nextAll("li").css("display","block");
                                
                               }
                               
              });
                 $("#content ul li div > a").click(function (event){
                      
                             var obj=$(event.target);
                             var pareid=$("#pareMemuId").val();
                             var memuId=obj.attr("id");           //当前的 memuId
                             var control=obj.attr("alt");              //当前的 操作
                             var a= obj.parent().parent().prev().html();
                            window.parent.parent.parent.location.href="memu!doUpdate.action?control="+control+"&allmemuId="+memuId+"&memuId="+pareid;
                          //  $("#mf").attr("action","sys/memu!doUpdate.action?control="+control+"&memuId="+memuId);
                            //$("#mf")[0].submit();
                           
                   
              });
              
              
              
              
              
              });
          
              </script>
              <td colspan="2" align="left" id="content"  width="90%">
              <s:iterator value="chirdmap" var="cdMap">
				<ul style="list-style: none;width:100%; float: left; margin-left:0px;">
				<li style="width: 100%;font-weight: bold;font-size: 13px;border-bottom: 1px D6D6F1 solid;"value="${cdMap.key.memuId}"  >
										<a style="float: left;margin-top: 3px; width: 2%" value="sdf"   >
										<img style="border: none;"   src="images/expand.gif"  /></a>
										<span style="float: left;margin-top: 4px;">${cdMap.key.displayName}</span>	
										<div id="${cdMap.key.memuId}" style="display: none; float:right;margin-right: 0px; width:10%">
									<a style="width: 5%"  >
									<s:if test=""></s:if>
									<img style="border: none;" alt="下移" src="<%=basePath %>images/download.gif"  id="${cdMap.key.memuId}" /></a>
									
											&nbsp;&nbsp;<a  style="width: 5%;" href="javascript:toUp(${cdMap.key.memuId})" ><img id="${cdMap.key.memuId}" style="border:none;"   alt="上移" src="<%=basePath %>images/upload.gif"/></a>
										</div>
									</li>	
									<!-- 内循环开始 -->
										<c:forEach   items="${cdMap.value}" var="item">
                                         	<li  style=" padding-left:18px; width: 100%;font-size: 13px; float: left;border-bottom: 1px D6D6F1 solid;" value="${item.memuId}">
                                       <span  style="float: left;margin-top: 4px;" id="${item.displayName}" >${item.displayName}</span>
                                       
                                       	<div id="${item.memuId}" style="display: none; float:right;margin-right: 0px; width:10%">
									<a style="width: 5%"  >
									<img style="border: none;" alt="下移" src="<%=basePath %>images/download.gif" id="${item.memuId}" name="kl" /></a>
											&nbsp;&nbsp;
									<a  style="width: 5%;" href="javascript:toUp(${item.memuId})">
											<img style="border:none;"   alt="上移" src="<%=basePath %>images/upload.gif" id="${item.memuId}"/></a>
										</div>
                                      	</li>
                                      
                                                  </c:forEach>
                                                  <!-- 内循环结束 -->
										</ul>
											</s:iterator>
                                            <!--循环结束-->
                                            </td>       
                                            <td width="5%">&nbsp;</td>      
              </tr>
              </table>  
              </fieldset>               
            
            
            <!------结束------->
            
            
            </td>
           
          </tr>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   
   
   
   
    
    <tr>
      <td height="35" background="images/tab_19.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
          <td>&nbsp;</td>
          <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
        </tr>
      </table></td>
    </tr>
  </table></td>
</tr>
</table>
  </s:form>
</body>
</html>
