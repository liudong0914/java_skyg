<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>企业信息管理系统</title>
</head>

<frameset rows="98,*,8" frameborder="no" border="0" framespacing="0">
  <frame src="model!top.action" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  
  <frame src="model!center.action?memuRed=${memuRed}" name="mainFrame" id="mainFrame" />
  <frame src="model!down.action" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
