<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp" %>
 
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>

<script type="text/javascript">
function disptime() {
	var time = new Date(); //获得当前时间  
	// var year = time.getYear( );//获得年、月,日
	var year = time.getFullYear();

	var month = time.getMonth() + 1;
	//获得星期 
	var xingqi = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[time
			.getDay()];

	var day = time.getDate();

	var hour = time.getHours(); //获得小时、分钟、秒   
	var minute = time.getMinutes();
	var second = time.getSeconds();
	var apm = "AM"; //默认显示上午: AM        
	if (hour > 12) //按12小时制显示   
	{
		hour = hour - 12;
		apm = "PM";
	} //如果分钟只有1位，补0显示      
	if (minute < 10) {
		minute = "0" + minute;
	}
	if (second < 10) //如果秒数只有1位，补0显示    
		second = "0" + second;
	document.getElementById("myclock").innerHTML = year + "年" + month + "月"
			+ day + "日  " + hour + ":" + minute + ":" + second + " " + apm
			+ "  " + xingqi; 
	var mytime = setTimeout(disptime,1000);
}
window.setTimeout(disptime,1000);
</script>
<style type="text/css">
<!--
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
.STYLE2 {font-size: 9px}
.STYLE3 {
	color: #033d61;
	font-size: 12px;
}
.mbpf img{
	cursor:pointer;
}
a:link,a:visited {
	text-decoration: none; /*超链接无下划线*/
}
-->
</style>

<script type="text/javascript">
			 function toFush(){
			 $.ajax({
			type:"get",
		url:"sys/model!unreadNum.action",
		 data: "userId="+${sessionScope.loginUser.userId},
			 dataType: "json",
		 success:function(data){
    		  $("#unRead").html(data);
				},
				 error:function(){
			 		alert("错了");
			  }
			});

	} 
	//每隔 1秒到数据库里读取信息 
window.setInterval("toFush()",1000);
  function drop_out(){
  parent.location.href="main!out.action";
  
  }
    function toNoread(){                    //跳到 未读操作
	  var countStr=$("#totalUnRead").html();
	  var countNum=parseInt(countStr);
	  if(countNum<1){
		  alert("您没有未读邮件");
	  }
	  else{
		  //$("#mf").attr("action","message/email!list.action?unread=unread");
		 location.href="email!list.action?unread=unread";
		   //$("#mf")[0].submit();
	  }
  }

</script>
</head>
<body　>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="70" background="images/main_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="24" background="images/main_03.gif">&nbsp;</td>
            <td width="505" background="images/main_04.gif">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="21"><img src="images/main_07.gif" width="21" height="24"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="38" background="images/main_09.gif">&nbsp;</td>
            <td><table width="100%" border="0" class="mbpf" cellspacing="0" cellpadding="0">
              <tr>
                <td width="77%" height="25" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="50" height="19"><div align="center"><a href="sys/model!prompt.action" target="I2_2"><img style="border: none;" src="images/main_12.gif" width="49" height="19"></a></div></td>
                    <td width="50"><div align="center"><img onClick="history.back()" src="images/main_14.gif" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img onClick="history.forward()" src="images/main_16.gif" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img onclick="window.parent.location.reload()" src="images/main_18.gif" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img onclick="drop_out()" src="images/main_20.gif" width="48" height="19"></div></td>
                    <td width="26"><div align="center"><img src="images/main_21.gif" width="26" height="19"></div></td>
                    <td width="100"><div align="center"><a href="per/users!update.action?id=${sessionScope.loginUser.userId}" target="I2_2" ><img style="border: none" src="images/main_22.gif" width="98" height="19" ></a></div></td>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td width="220" valign="bottom"  nowrap="nowrap"><div align="right"><span class="STYLE1"><span class="STYLE2">■</span><span id="myclock"></span></span></div></td>
              </tr>
            </table></td>
            <td width="21"><img src="images/main_11.gif" width="21" height="38"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="8" style=" line-height:8px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" background="images/main_29.gif" style=" line-height:8px;">&nbsp;</td>
            <td width="505" background="images/main_30.gif" style=" line-height:8px;">&nbsp;</td>
            <td style=" line-height:8px;">&nbsp;</td>
            <td width="21" style=" line-height:8px;"><img src="images/main_31.gif" width="21" height="8"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="28" background="images/main_36.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="177" height="28" background="images/main_32.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%"  height="22">&nbsp;</td>
            <td width="59%" valign="bottom"><div align="center" class="STYLE1">当前用户：${sessionScope.loginUser.userName}</div></td>
            <td width="21%">&nbsp;</td>
          </tr>
        </table></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0" border="1">
          <tr>
         <!-- 循环开始 -->
     
           
            <td width="40%">
            <table>
              <tr>
                <td>
                <div align="center" class="STYLE3" >&nbsp;&nbsp;&nbsp;&nbsp;您的角色是：${sessionScope.loginUser.role.roleName}</div></td>
              </tr>
            </table></td>
            
              <td width="43%"   align="right">
            <table>
              <tr>
              	<td align="right">
			 			<div>
			 				<a href="calendar/schedule!list.action" target="I2_2" ><img style="border: none" src="${pageContext.request.contextPath}/images/note-pinned.png"  width="22" height="22" id="img" /></a>
			 			</div>
			 		</td>
                <td>
                <div align="center" class="STYLE3">您今天有&nbsp;<a href="calendar/schedule!list.action" target="I2_2"  style="color: red">${scNum}</a>&nbsp;个会议哦！</div></td>
              </tr>
            </table></td>
    
           <!-- -循环结束 -->
            <td class="STYLE3" align="right" width="17%">
			 <table border="0">
			 	<tr>
			 		<td align="right">
			 			<div>
			 				<A href="message/email!list.action"  target="I2_2" ><img style="border: none" src="${pageContext.request.contextPath}/images/dhead.gif" width="22" height="22" id="img" /></A>
			 			</div>
			 		</td>
			 		<td style="font-size:12px;" align="right">
			 			您共有:${allMessage}条信息,<a href="message/email!list.action"  target="I2_2" >未读</a><span style="color: red;" id="unRead">&nbsp;${noRead}&nbsp;</span>条
			 	 
			 	 	</td>
			 	</tr>
			 </table>
			 
			
			 
            </td>
          </tr>
        </table></td>
        <td width="21"><img src="images/main_37.gif" width="21" height="28"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
