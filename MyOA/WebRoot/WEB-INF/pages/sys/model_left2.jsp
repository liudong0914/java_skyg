<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<base href="<%=basePath%>">
<html>
<head>
<base href="<%=basePath%>" />
<title>菜单排序</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<script type="text/javascript">
	
</script>
</head>
<body><table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <script type="text/javascript">
     function showAll(obj){
    if($("#"+obj).css("display")=="block")
     $("#"+obj).css("display","none");
     else{
      $("#"+obj).css("display","block");
     }
     }
  </script>
    <td valign="top">
    <table width="151" border="0" align="center" cellpadding="0" cellspacing="0" id="parentId">
      <!-- ---外循环开始--- -->
      <s:iterator value="chirdmap" var="cdMap">
      <tr >
        <td >
                    <!--table开始--->
        <table  width="100%" border="0" cellspacing="0" cellpadding="0" id="d" >
          <tr>
        <td height="23" background="images/main_47.gif" id="imgmenu2" class="menu_title" onclick="showAll(${cdMap.key.memuId})" onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title';" style="cursor:hand">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="18%">&nbsp;</td>
                  <td width="82%" class="STYLE1" >${cdMap.key.displayName}</td>
                </tr>
            </table></td>
          </tr>
          
          <tr id="${cdMap.key.memuId}" >
            <td background="images/main_51.gif" id="submenu2"><div class="sec_menu" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <!--------内循环开始---------->
                    <c:forEach   items="${cdMap.value}" var="item">
                    <tr>
                     <td width="16%" height="20">
                     <div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
                    <td width="84%" height="20">
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                     <td height="17" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'">
                        <span class="STYLE3"><a  style="text-decoration: none;"   href="${item.memuUrl}?memuId=${item.memuId}" target="I2_2">${item.displayName}</a>
                        
                        <a href="${subItem.memuUrl}?memuId=${subItem.memuId}" target="I2_2">${subItem.displayName}</a>
                        </span></td>
                              </tr>
                              
                          </table></td>
                        </tr>
                        </c:forEach>
                      <!-----内循环结束--------->  
                    </table></td>
                  </tr>
                  <tr>
                    <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
                  </tr>
                </table>
            </div></td>
          </tr>
        </table>      </td>
      </tr>
      </s:iterator>
    <!------外循环结束------>
    </td>
  </tr>
  <tr>
    <td height="18" background="images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">版本：2008V1.0</div></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>