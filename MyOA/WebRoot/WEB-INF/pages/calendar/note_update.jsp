<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/pages/common/include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#mytable{
	margin-left: 300px;
}
#mytable2{
	
	margin-left: 300px;
	
}



</style>
  </head>
  
  <body>
   <table>
    	<tr>
        	<td>个人便签详细设置</td>
        </tr>
    </table>
    <hr />
    
    <s:form action="note!doupdate.action" method="post">
    	 <table id="mytable">
    	<s:hidden name="note.noteId"></s:hidden>
    	 
         	<tr>
            	<td>便签标题:</td>
                
            </tr>
            <tr>
            	<td>
                	
                	<s:textfield name="mynote.noteTitle" size="80"></s:textfield>
                </td>
            </tr>
            <tr>
            	<td>便签内容:</td>
                
            </tr>
            <tr>
            	<td>
                	<s:textarea name="mynote.noteContent" cols="62" rows="10"></s:textarea>
                </td>
            </tr>
            </table>
         <table id="mytable2" >
            <tr>
            	<td width="58">创建人:</td>
                <td width="200">
                	
                	${mynote.users.userName}
                </td>
                
                <td width="94" align="left">创建时间:</td>
                <td width="163">
                	${mynote.createTime }
                </td>
            </tr>
         </table>
       	<br />
        <table id="mytable2">
            <tr>
            	<td width="317" >
                	<s:submit  type="submit" value="保存"  style="width:80px;text-align:center;"></s:submit>
                </td>
                <td width="228" >
                <input onclick="window.location.href('note!notedelete.action?id=${mynote.noteId}')" type="button" value="删除当前便签" >	
                </td>
               
            </tr>
         </table>
    </s:form>
  
    
  </body>
</html>
