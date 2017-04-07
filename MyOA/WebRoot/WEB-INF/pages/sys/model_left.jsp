<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp"%>
<base href="<%=basePath%>">
<script type="text/javascript">
function showsubmenu(sid) {
	whichEl = eval("submenu" + sid);
	imgmenu = eval("imgmenu" + sid);
	if (whichEl.style.display == "none") {
		eval("submenu" + sid + ".style.display=\"\";");
		imgmenu.background = "images/main_47.gif";
	} else {
		eval("submenu" + sid + ".style.display=\"none\";");
		imgmenu.background = "images/main_48.gif";
	}
}
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

a {
	text-decoration: none;
	color: #033d61;
}

.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
.class{
	display:none;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #ffffff;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #FFCC00;
	POSITION: relative;
	TOP: 2px
}
</style>
<%
	int k = 1;
	int x = 1;
	int img = 1;
%>
<table width="165" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="28" background="images/main_40.gif">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="19%">
						&nbsp;
					</td>
					<td width="81%" height="10%">
						<span class="STYLE1">管理菜单</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<s:iterator value="memuList" var="item">
		<tr height="100%">
    <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table  width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" background="images/main_47.gif" id="imgmenu<%=img++ %>" class="menu_title" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(<%=k++ %>)" onMouseOut="this.className='menu_title';" style="cursor:hand">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="82%" class="STYLE1">${item.displayName}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td style="display: none" background="images/main_51.gif" id="submenu<%=x++ %>">
			 <div class="sec_menu" >  
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <s:iterator value="subMemuList" var="subItem">
                <s:if test="#item.memuId eq #subItem.parentNodeId">
                  <tr>
                    <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
                    <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'">
                          <span class="STYLE3">
                          <a href="${subItem.memuUrl}?memuId=${subItem.memuId}" target="I2_2">${subItem.displayName}</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                 </s:if>
                </s:iterator>
                </table></td>
              </tr>
              <tr>
                <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
              </tr>
            </table></div></td>
          </tr>
          
        </table></td>
      </tr>
    </table></td>
  </tr>
	</s:iterator>

	<tr>
		<td height="18" background="images/main_58.gif">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="18" valign="bottom">
						<div align="center" class="STYLE3">
							版本：2008V1.0
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
