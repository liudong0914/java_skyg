
<%
dim startime,conn,connstr,db,rs,rs_s,rs_s1
startime=timer()
db="hsg.mdb" '���ݿ�
on error resume next '���������ݿ⣬һֱ����ʱ�������Լ�ǿSQLע�����
'connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
connstr="DRIVER={SQL Server};Server=.;UID=sa;PWD=;DATABASE=trtrtr;"
'connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
%>
<%
function encos(str) 
	dim re
	if str="" then
		re=""
	else
		re=trim(str)
		re=server.HTMLEncode(re)
		re=replace(re,"'","��")
		re=replace(re,"%","��")
		re=replace(re,"<","��")
		re=replace(re,"select","�������")
		re=replace(re,"sp_","sp��")
		re=replace(re,"xp_","xp��")
		re=replace(re,"_","��")
		re=replace(re,"+","��")
		re=replace(re,"'","��")
		re=replace(re,";","��")
		're=replace(re,"@","��")
		re=replace(re,"--","����")
		re=replace(re,"//","����")
		re=replace(re,"exec","������")
		re=replace(re,"declare","��������")		
	end if
	encos=re
end function
Function checkdyh(str1,msg) 'hsg��ⵥ����
	if instr(str1,"'")>0 then 
	response.write("<script>javascript:alert('�������"&msg&"�к��е�����,������Ƕ��ĳ�����ȫ�ǵĵ�����,������ҵ�����һһ��Ӧ!');history.back();</script>")
	response.end()
	end if
end Function
'-----------ȡ���ļ���չ��-----------------
Function GetExtEndName(FileName)
	dim ExtName
	ExtName = LCase(FileName)
	ExtName = right(ExtName,3)
	ExtName = right(ExtName,3-Instr(ExtName,"."))
	GetExtEndName = ExtName
End Function
'-------����ǰ�����ں�ʱ��תΪ�ļ���------------
Function MakeFileName()
	fname = now()
	fname = replace(fname,"-","")
	fname = replace(fname," ","") 
	fname = replace(fname,":","")
	fname = replace(fname,"PM","")
	fname = replace(fname,"AM","")
	fname = replace(fname,"����","")
	fname = replace(fname,"����","")
	MakeFileName=fname
End Function 
'--------��ʽ������(ͼƬ�����ڽ���)--
Public function formatContent(str)
strcontent=replace(str,"<IMG ","<img onload='javascript:if(this.width>screen.width-500)this.width=screen.width-500' ")
formatContent=replace(strcontent,chr(23),"<br>")
end function
'--------���������������-------------
Function got(txt,txtlen)
	dim l,t,c, i
	l=len(txt)
	t=0
	for i=1 to l
	c=Abs(Asc(Mid(txt,i,1)))
	if c>255 then
	t=t+2
	else
	t=t+1
	End if
	if t>txtlen then
	got=left(txt,i-1)&"." 
	exit for
	else
	got=txt&Space(txtlen-t)
	End if
	next 
End Function
'---������ת��Ϊ����Դ�����ʽ---
Function htmlout(str)
   dim guest
   if isnull(str) or str="" then
   htmlout=str
   exit Function
   End if
   guest=str 
   guest=Replace(guest,"  ","��")
   guest=Replace(guest," ","nbsp;")      
   guest=server.htmlencode(guest) 
   guest=Replace(guest,"nbsp;"," ")
   guest=Replace(guest,vbcrlf,"<BR>") 
   htmlout=guest
End Function
'---��ʾ��Ϣ���ص�ǰһҳ��(����)-------
Function AlertOut(Msg)
	Response.Write "<script language=JavaScript>{alert('��ʾ��"&Msg&"����');location.href='javascript:history.go(-2)';}</script>"
	Response.End
End Function
'---��ʾ��Ϣ���ص�ǰһҳ��(��һ)---
Function Back(str)												
	Response.Write "<SCRIPT language=JavaScript>{alert('��ʾ��"&str&"����');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End Function
'----����Ƿ�����������---
Function CheckInt(str,Msg)
	if isnumeric(str)=false then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"ֻ���������֣���');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if 
End Function
'----���email��ַ�ĺϷ���---
Function CheckEmail(str,Msg)
	if instr(str,"@")<=0 or instr(str,".")<=0 then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"��ַ���Ϸ�����');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if	
End Function
'---���web��ַ�ĺϷ���---
Function CheckHttp(str,Msg)
	if instr(str,"http://")<=0 or instr(str,".")<=0 then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"��ַ���Ϸ�����');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if	
End Function
'---��������Ƿ�Ϊ��---
Function CheckNull(str,Msg)												
	if trim(str)="" then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"����Ϊ�գ���');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if			
End Function
'---����·ݺ�����---
Function CheckTime(str,Msg)												
	if isdate(str)=false then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"���������·ݺ����ڲ��Ϸ�������');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
	End if			
End Function
'---��ֹ�Ƿ��ַ�������chr(34)��������---
Function CheckChar(str,Msg)
for i=1 to len(str)
us=mid(str,i,1)
if us="~" or us="`" or us="?" or us=";" or us=":" or us="}" or us="{" or us="&" or us="'" or us="%" or us="$" or us="#" or us="@" or us="!" or us=chr(34) then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"�������Ϸ��ַ�����');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End if
next
End Function
Function CheckChar2(str,Msg)
for i=1 to len(str)
us=mid(str,i,1)
if us="~" or us="`"  or us="?" or us=">" or us="<" or us=";"  or us="}" or us="{"  or us="*" or us="&" or us="'" or us="%" or us="$" or us="#" or us="@"  or us=chr(34) then
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"�������Ϸ��ַ�����');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End if
next
End Function
'---��ʾ��Ϣ���رձ�����---
Function Closes(Msg)												
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"����');location.href='javascript:window.close()';}</SCRIPT>"
	Response.End
End Function
'---��ʾ��Ϣ���رձ�����ˢ�¸�����---
Function CloseReload(Msg)												
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"����');window.opener.location.reload();window.close();}</SCRIPT>"
	Response.End
End Function
'---��ʾ��Ϣ��ֱ��ת��ĳһҳ��---
Function Href(url,Msg)
if Msg<>"" then												
	Response.Write"<SCRIPT language=JavaScript>{alert('��ʾ��"&Msg&"����');this.location.href='"&url&"';}</SCRIPT>"
else
	Response.Write"<SCRIPT language=JavaScript>{this.location.href='"&url&"';}</SCRIPT>"
End if
End Function
'---ת����Ӧ��ҳ�沢ˢ��---
Function UrlMsg(Url,Msg)
if Msg<>"" then
	Response.Write "<script language=JavaScript>{alert('��ʾ��"&Msg&"����');}</script><meta http-equiv='refresh' content='0; url="&Url&"'>"
else
	Response.Write "<meta http-equiv='refresh' content='0; url="&Url&"'>"
End if
End Function
'---��ҳ����(�ϲ���)---
'---����ÿҳ������num/ipagesize���ڼ�ҳ��page
'---maxpage:ҳ��,countnum:��¼��
Dim page,maxpage,ipagesize,countnum
Sub fpage(num)
	rs.pagesize = cint(num)
	ipagesize   = cint(num)
	countnum    = rs.recordcount
	maxpage     = rs.pagecount
	page        = request("page")
	if Not IsNumeric(page) or page="" then page=1 else page=cint(trim(request("page"))) End if
	if page<1 then
		page=1
	elseif  page>maxpage then
		page=maxpage
	End if
	rs.absolutepage=page
End Sub

'---��ҳ����(��ʾ����)---
'---������ǰ̨ҳ�������ҳ����ʾ---
'---pagecount:����ҳ,page:�ڼ�ҳ,pagenum:�м���ʾ��ҳ
Sub nextpage(pagecount,page,pagenum)
    if pagecount>1 then
	Dim query, a, x, temp
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
	query = Split(Request.ServerVariables("QUERY_STRING"), "&")
	For Each x In query
	    a = Split(x, "=")
	    If StrComp(a(0), "page", vbTextCompare) <> 0 Then
	        temp = temp & a(0) & "=" & a(1) & "&"
	    End If
	Next
	Response.Write("<table  border='0' align='center' cellpadding='0' cellspacing='8'>")
	if page<=1 then
		Response.Write ("<tr><td>[��ҳ]</td>" & vbCrLf)		
		Response.Write ("<td>[��һҳ]</td>" & vbCrLf)
	else		
		Response.Write("<tr><td><A HREF=" & action & "?" & temp & "Page=1>[��ҳ]</A></td>" & vbCrLf)
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">[��һҳ]</A></td>" & vbCrLf)
	End if
	if page>pagenum then
	   noj=page-pagenum
	   zon_page=page+pagenum
	else
	   noj=1
	   zon_page=pagenum*2+1
	End if   
	if zon_page>=maxpage then zon_page=maxpage
	for i=noj to zon_page
	    if i=page then
		Response.Write ("<td><font color=red>" & i & "</font></td>" & vbCrLf)
		else
		Response.Write ("<td><a href=" & action & "?" & temp & "page=" & i & ">" & i & "</a></td>" & vbCrLf)
		End if
	next
	if page>=pagecount then
		Response.Write ("<td>[��һҳ]</td>" & vbCrLf)
		Response.Write ("<td>[δҳ]</td>" & vbCrLf)
	else
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">[��һҳ]</A></td>" & vbCrLf)
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page="&rs.pageCount&">[δҳ]</A></td>" & vbCrLf)
	End if
	Response.Write("<td> ÿҳ��ʾ" & ipagesize & "����"&  vbCrLf)			
	Response.Write("��" & pageCount & "ҳ��" &  vbCrLf)
	Response.Write("��" & countnum & "����Ϣ" &  vbCrLf)
	Response.Write("</td></tr></table>")
	end if			
End Sub
'---��ҳ����(��ʾ���ִ�ͼƬ)---
'---������ǰ̨ҳ�������ҳ����ʾ---
'---pagecount:����ҳ,page:�ڼ�ҳ,pagenum:�м���ʾ��ҳ
Sub NextPagePic(maxpage,page,pagenum,prop)
    if maxpage>1 then
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
	Response.Write("<table  border='0' align='center' cellpadding='2' cellspacing='8'>")
	if page<=1 then
		Response.Write ("<tr><td><img src='/images/bticon_pre02.gif' border='0' alt='�� ҳ'> �� ҳ </td>" & vbCrLf)		
		Response.Write ("<td><img src='/images/bticon_pre01.gif' border='0' alt='��һҳ'> ��һҳ </td>" & vbCrLf)
	else		
		Response.Write("<tr><td><img src='/images/bticon_pre02.gif' border='0' alt='�� ҳ'> <A HREF=" & action & "?" & prop & "&Page=1>�� ҳ</A> </td>" & vbCrLf)
		Response.Write("<td width='53'><img src='/images/bticon_pre01.gif' border='0' alt='��һҳ'> <A HREF=" & action & "?" & prop & "&Page=" & (Page-1) & ">��һҳ</A> </td>" & vbCrLf)
	End if
	if page>pagenum then
	   noj=page-pagenum
	   zon_page=page+pagenum
	else
	   noj=1
	   zon_page=pagenum*2+1
	End if   
	if zon_page>=maxpage then zon_page=maxpage
	for i=noj to zon_page
	    if i=page then
		Response.Write ("<td><font color=red>" & i & "</font></td>" & vbCrLf)
		else
		Response.Write ("<td><a href=" & action & "?" & prop & "&page=" & i & "><font color=black>" & i & "</font></a></td>" & vbCrLf)
		End if
	next
	if page>=maxpage then
		Response.Write ("<td><img src='/images/bticon_next01.gif' border='0' alt='��һҳ'> ��һҳ </td>" & vbCrLf)
		Response.Write ("<td><img src='/images/bticon_next02.gif' border='0' alt='���һҳ'> ���һҳ </td>" & vbCrLf)
	else
		Response.Write("<td><img src='/images/bticon_next01.gif' border='0' alt='��һҳ'> <A HREF=" & action & "?" & prop & "&Page=" & (Page+1) & ">��һҳ</A> </td>" & vbCrLf)
		Response.Write("<td><img src='/images/bticon_next02.gif' border='0' alt='���һҳ'> <A HREF=" & action & "?" & prop & "&Page="&maxpage&">���һҳ</A> </td>" & vbCrLf)
	End if
	'Response.Write("<td> ÿҳ��ʾ" & ipagesize & "����"&  vbCrLf)			
	'Response.Write("��" & maxpage & "ҳ��" &  vbCrLf)
	'Response.Write("��" & countnum & "����Ϣ</td>" &  vbCrLf)
	Response.Write("</tr></table>")
	end if			
End Sub

Sub ShowPage(pagecount,page,prop)
'������һҳ��һҳ����
'����˵��:	pagecount:��ҳ��
'page:��ǰҳ
'table_style�����ʽ font_style������ʽ
'example :showpage(maxpage,page,"width=100% ","<p  align=center class=font2>")
'һ�����ں�̨�����Ƚ��ʺϡ�
	Dim query, a, x
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
	Response.Write("<table align=center class=ListTable bgcolor=F5F9FC width='100%' height=35>" & vbCrLf )
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & prop & "&Page='+ this.page.value;return false;""><TR><td width='45%' align=center>" & vbCrLf )
	if page<=1 then
		Response.Write ("[��һҳ] " & vbCrLf)		
		Response.Write ("[��һҳ] " & vbCrLf)
	else		
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=1>��һҳ</A>] " & vbCrLf)
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & (Page-1) & ">��һҳ</A>] " & vbCrLf)
	End if
	if page>=pagecount then
		Response.Write ("[��һҳ] " & vbCrLf)
		Response.Write ("[���һҳ]" & vbCrLf)			
	else
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & (Page+1) & ">��һҳ</A>] " & vbCrLf)
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & pagecount & ">���һҳ</A>]" & vbCrLf)			
	End if		
	Response.Write(" ��" & "<INPUT TYEP=TEXT NAME=page  SIZE=6 Maxlength=5 VALUE=" & page & ">" & "ҳ"  & vbCrLf & "<INPUT type=Submit class=SearchButton style=""font-size: 7pt""  value=GO>")
	Response.Write(" �� " & pageCount & " ҳ" &  vbCrLf)			
	Response.Write("[������"&countnum&"����Ϣ]</TD>" & vbCrLf )
	Response.Write("</TR></form>" & vbCrLf )		
	Response.Write("</table>" & vbCrLf )
End Sub
'------ǰ̨���ڴ���������ֱ��ת��ĳһҳ----
Sub ShowLastNext(pagecount,page,prop)
    if pagecount>1 then
	Dim query, a, x, temp
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & prop & "&Page='+ this.page.value;return false;"">" & vbCrLf )

	if page>1 then
		Response.Write("[<A HREF="&action&"?"&prop&"&"&"Page="&(Page-1)&" class='a1'>��һҳ</A>]" & vbCrLf)
	End if
	if page<pagecount then
		Response.Write("[<A HREF="&action&"?" & prop & "&" & "Page=" & (Page+1) & " class='a1'>��һҳ</A>] " & vbCrLf)
	End if
	Response.Write(" ��" & "<INPUT TYEP=TEXT NAME=page  SIZE=6 Maxlength=5 VALUE=" & page & ">" & "ҳ"  & vbCrLf & "<INPUT type=submit class=SearchButton style=""font-size: 7pt""  value=GO>")
	Response.Write(" �� " & pageCount & " ҳ" &  vbCrLf)
	Response.Write("[������"&countnum&"����Ϣ]" & vbCrLf )
	Response.Write"</form>"
	end if			
End Sub
'-------ֻ��ʾ���µ�����-----------
Public Function formatdate(value)
	NewTime=month(value)&"-"&day(value)
	formatdate=NewTime
End Function
%>
