<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
  </head>
  <body>
  <%
String banji=request.getParameter("banji");String banzhuren=request.getParameter("banzhuren");String yuanxi=request.getParameter("yuanxi");String renshu=request.getParameter("renshu");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update banjixinxi set banji='"+banji+"',banzhuren='"+banzhuren+"',yuanxi='"+yuanxi+"',renshu='"+renshu+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='banjixinxi_list.jsp';</script>");
%>
  </body>
</html>


