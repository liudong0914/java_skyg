
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�༶��Ϣ</title><LINK href="CSS.css" type=text/css rel=stylesheet>
    <script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
	</script>
  </head>
<script language="javascript">
function check()
{
	if(document.form1.banji.value==""){alert("������༶");document.form1.banji.focus();return false;}if(document.form1.banzhuren.value==""){alert("�����������");document.form1.banzhuren.focus();return false;}if(document.form1.yuanxi.value==""){alert("������Ժϵ");document.form1.yuanxi.focus();return false;}if(document.form1.renshu.value==""){alert("����������");document.form1.renshu.focus();return false;}
}
function gow()
{
	document.location.href="banjixinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <form name="form1" id="form1" method="post" action="banjixinxi_add_post.jsp">
  ��Ӱ༶��Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>�༶��</td><td><input name='banji' type='text' id='banji' value='' />&nbsp;*</td></tr><tr><td>�����Σ�</td><td><select name='banzhuren' id='banzhuren'><%String sql="select xingming from jiaoshixinxi order by id desc";ResultSet RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("xingming")%>" ><%=RS_result.getString("xingming")%></option><%}%></select>&nbsp;*</td></tr><tr><td>Ժϵ��</td><td><input name='yuanxi' type='text' id='yuanxi' value='' />&nbsp;*</td></tr><tr><td>������</td><td><input name='renshu' type='text' id='renshu' value='' />&nbsp;*</td></tr><tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

