<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manual_sign_prompt.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<<<<<<< .mine
  	<% if(request.getAttribute("ifSign") != null) {%>
  	<% if(request.getAttribute("ifSign") == "true"){ %>
  		<span>一天只能签到一次.</span>
  	<%} %>
  	<% if(request.getAttribute("ifSign") == "false"){ %>
  		<span>一天只能签退一次。</span>
  	<%}} %>
  	<%if(request.getAttribute("sign") != null){ 
  		if(request.getAttribute("sign").toString().equals("签退")){ %>
  		<span>签退成功..</span>
  	<%} %>
  	<% 
  		if(request.getAttribute("sign").toString().equals("签到")){%>
  		<span>签到成功..</span>
  	<%}} %>
=======
    签到成功
>>>>>>> .r131
  </body>
</html>
