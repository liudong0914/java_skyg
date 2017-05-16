<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv=Content-Type content="text/html; charset=utf-8">
	<style type="text/css">
		*{
			font-family: KaiTi_GB2312;
		}
	</style>
  </head>
  
  <body>
  	
	font-family: KaiTi_GB2312;<br/>
	非常关键的一句解决中文乱码的代码。这次配置的 KaiTi_GB2312 与 pd4fonts.properties文件中配置的 name 是对应的。<br/>
    pd4fonts.properties文件中配置的value值对应的文件可以在系统盘的window.font下找到。 <br/>
	
    <br>
    <table>
    	<tr>
    		<td bgcolor="red">aa</td>
    		<td bgcolor="blue">bb</td>
    		<td bgcolor="yellow">cc</td>
    		<td bgcolor="green">bb</td>
    	</tr>
    	<tr>
    		<td bgcolor="red">1</td>
    		<td bgcolor="blue">啊啊啊</td>
    		<td bgcolor="yellow">张三</td>
    		<td bgcolor="green">李四</td>
    	</tr>
    </table>
    <p>
    pd4ml的用处就不多说了。个人觉得还是很方便实用的。学习难度也不大。<br/>
    当时在学习的时候为了中文乱码问题困扰了很久，希望这个demo能帮助大家解决中文乱码问题
    </p>
    <a href="<%=basePath%>/servlet/TestServlet">导出PDF</a>
  </body>
</html>
