<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'schedule_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath }/css/Style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"  src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/Cookie.js"></script>

<style type="text/css">
#table2{
	margin-top:-80%;
	margin-left:50%;
 
	
}
.STYLE1 {
	font-size: 12px;
}
table{
	font-size:12px;
	
	
}
A:link{color:#000000} 
#mydiv{
		margin-left:189px;
}

#mytable2{
	
	width: 30%;
}
#img{
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

	
function SelectCustomer(){
		showModalDialog("schedule!userlist.action",null,"dialogWidth:20cm;dialogHeight:8.5cm;center:yes;status:no;scrolling:no;");
	  var userId = document.search.userId.value=getCookie("userId");
	    
	 //  $("#userId").attr("value",document.search.userId.value);
	  var cname = document.search.cname.value=getCookie("cname");
	 
	  	$("#cname").append("<option value=" + userId + ">" + cname + "</option>");
	 
	  
		//var userId=document.getElementById("userId").value;
		  //  userId=getgetCookie("userId");
		//var cname=document.getElementById("cname").value;
		 //   cname=getgetCookie("cname");	
}
	
function deleteper() {
	var p = $("#cname");
	var obj = document.getElementById('cname');
	var index = obj.selectedIndex;

	if(confirm("你确定要删除吗?")){
		obj.options.remove(index);
	}
	
	//remove(p.remove(p.val()));

}	
</script>
<!-- 这是验证是否为空的 -->
<script type="text/javascript">
	 function check(){
	 	var title=$("#title").val();
	 	var address=$("#address").val();
	 	var beginTime=$("#beginTime").val();
	 	var endTime=$("#endTime").val();
	 	var schContent=$("#schContent").val();
	 	var cname=$("#cname").val();
	 }
	 
	 
	 
	 
</script>

  </head>
  
  <body >
<s:form action="schedule!doupdate.action" method="post" id="mf" name="search">

<s:hidden name="schedule.scheduleId"  id="scheduleId"></s:hidden>
 	<s:hidden name="schedule.users.userId" ></s:hidden>
 	<s:hidden name="schedule.createTime"></s:hidden>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: -1%; margin-left: -1%">
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
                          <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[我的日程]-[日程详情]</td>
                        </tr>
                      </table></td>
                      <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                          <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              
                            </tr>
                          </table></td>
                          <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                          <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                             
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
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
    
    <!--要加的行--->
   <tr>
    <td><table width="100%"  cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6"   >
          <tr>
            <td width="3%" height="22" bgcolor="#FFFFFF">
            <!------开始---->
           
       <table  align="center" border="0">
   		<tr>
        	<td >主题: </td>
            <td> 
            	<s:textfield id="title" size="86" name="schedule.title" cssClass="inputCss" cssStyle="border: 1px solid #2995CF; font-size:12px; height:17px;"></s:textfield>
            </td>
        </tr>
     </table>
    
     <table  width="500" align="center">
     	
        <tr>
        
        <td width="3%">地点: </td>
        <td width="23%" align="left">
        	<s:textfield id="address" name="schedule.address" cssStyle="border: 1px solid #2995CF; font-size:12px; height:17px;"></s:textfield>
        </td>
           
            <td width="5%" align="right">
            	会议类型:
            </td>
            <td width="6%" align="right">
            	
				<s:select  name="meetingId" list="meetingList" listKey="meetingId" listValue="meetingName" cssClass="buttonCss" cssStyle="font-size:12px;"></s:select>
            </td>
        </tr>
        </table>
        
        <table  align="center" width="500">
		<tr>
        	<td width="17%">开始时间：----</td>
            <td><s:textfield name="schedule.beginTime" id="beginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" cssStyle="border: 1px solid #2995CF; font-size:12px; height:17px;"></s:textfield>
          </td>
        </tr>
        <tr>
        	<td>结束时间：----</td>
            <td>
            	<s:textfield name="schedule.endTime" id="endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" cssStyle="border: 1px solid #2995CF; font-size:12px; height:17px;"></s:textfield>
            </td>
        </tr>
        </table>
        
        <table  align="center">
        <tr>
        	<td>
            	<s:textarea name="schedule.schContent" id="schContent" cols="68" rows="6" cssStyle="border: 1px solid #2995CF; font-size:12px;"></s:textarea>
            </td>
        </tr>
   </table>
    	
      
      <table  align="center" width="500">
      		<tr>
            	<td>预约他人:
            	
                	<a onclick="javascript:SelectCustomer();" >
                	<img src="${pageContext.request.contextPath}/images/find.gif" width="16" height="16" id="img"/></a>
                </td>
            </tr>
            <tr>
            	<td>
            		<input type="hidden" name="userId" id="userId" value=""/>
       		
       			<!--  <input name="cname" type="text" id="cname" value=""> -->
				<!-- <textarea rows="7" cols="20" name="cname" id="cname"></textarea> -->
				
					<s:select list="#request.sList" multiple="true"  cssStyle="width: 150px;  border: 1px solid #2995CF; font-size:12px;" id="cname" name="schedule.userses" listKey="userId" listValue="realName"></s:select>
				
							
								<input name="Submit" onclick="deleteper();" type="button"
								class="button" value="删除选定预约人" style="font-size:12px;" />		
            	</td>
            </tr>
      </table> 	
      
        <table   align="center" width="500">
        	
            <tr>
            
            	<td width="10%" >创建人:</td>
                <td width="60" align="left">
                	${schedule.users.userName}
                </td>
                
                    <td width="50%" align="right">创建时间:</td>
                <td width="163">
                	${schedule.createTime }
                </td>
            </tr>
         </table>
         <br/>
            <table width="510" align="center" border="0">
            <tr class="STYLE1">
            	<td width="210" >
                	<button onclick="toupdate()"   style="width:80px;text-align:center; font-size:12px;" class="button">保存</button>
                </td>
                <td width="500" >
               <script type="text/javascript">
                       function toupdate(){
                    
                    	var child=$("#cname").children();
                    	var ar=child.toArray();
                    	$("#aset").attr("value",ar);
                    	var str="";
                        for ( var int = 0; int < ar.length; int++) {
                        	 str+=ar[int].value+",";
						}
						
                    $("#mf").attr("action","calendar/schedule!doupdate.action?uIds="+str);
                   
                    $("#mf").submit();
                
                        }

               
               </script>
                	
                	
                	<button id="del" onclick="deletesch()" class="button">删除当前日程</button>	
                </td>
               
					<script type="text/javascript">
						function deletesch(){
						 	
						 	var scheduleId=$("#scheduleId").val();
						 	
							$.ajax({
								type : "post",
								url : "calendar/schedule!deleteSch.action",
								data : "scheduleId="+scheduleId,
								dataType : "text",
								success : function(msg){
									
									location.href="schedule!list.action";
									alert("删除成功！ ");
								},error : function(){
									alert("有问题！");
								}
							});
						}
					</script>
            </tr>
         </table>
            
            
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
