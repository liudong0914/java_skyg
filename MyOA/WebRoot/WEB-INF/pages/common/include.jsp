<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fu" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("base",basePath);
%>
<meta http-equiv="pragma" content="no-cache">
	 <meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">  
 <script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
   <script src="<%=basePath %>js/scripts/boot.js" type="text/javascript"></script>
    <link href="<%=basePath %>js/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />