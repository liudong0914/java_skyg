
<%
dim startime,conn,connstr,db,rs,rs_s,rs_s1
startime=timer()
db="hsg.mdb" '数据库
on error resume next '尝试连数据库，一直到超时，但可以加强SQL注入过滤
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
		re=replace(re,"'","’")
		re=replace(re,"%","％")
		re=replace(re,"<","《")
		re=replace(re,"select","ｓｅｌｅｃｔ")
		re=replace(re,"sp_","sp—")
		re=replace(re,"xp_","xp—")
		re=replace(re,"_","—")
		re=replace(re,"+","＋")
		re=replace(re,"'","‘")
		re=replace(re,";","；")
		're=replace(re,"@","·")
		re=replace(re,"--","－－")
		re=replace(re,"//","／／")
		re=replace(re,"exec","ｅｘｅｃ")
		re=replace(re,"declare","ｄｅｃｌａｒｅ")		
	end if
	encos=re
end function
Function checkdyh(str1,msg) 'hsg检测单引号
	if instr(str1,"'")>0 then 
	response.write("<script>javascript:alert('您输入的"&msg&"中含有单引号,请把它们都改成中文全角的单引号,最好左右单引号一一对应!');history.back();</script>")
	response.end()
	end if
end Function
'-----------取得文件扩展名-----------------
Function GetExtEndName(FileName)
	dim ExtName
	ExtName = LCase(FileName)
	ExtName = right(ExtName,3)
	ExtName = right(ExtName,3-Instr(ExtName,"."))
	GetExtEndName = ExtName
End Function
'-------将当前的日期和时间转为文件名------------
Function MakeFileName()
	fname = now()
	fname = replace(fname,"-","")
	fname = replace(fname," ","") 
	fname = replace(fname,":","")
	fname = replace(fname,"PM","")
	fname = replace(fname,"AM","")
	fname = replace(fname,"上午","")
	fname = replace(fname,"下午","")
	MakeFileName=fname
End Function 
'--------格式化内容(图片不大于界面)--
Public function formatContent(str)
strcontent=replace(str,"<IMG ","<img onload='javascript:if(this.width>screen.width-500)this.width=screen.width-500' ")
formatContent=replace(strcontent,chr(23),"<br>")
end function
'--------输出内容字数限制-------------
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
'---将文字转化为它的源代码格式---
Function htmlout(str)
   dim guest
   if isnull(str) or str="" then
   htmlout=str
   exit Function
   End if
   guest=str 
   guest=Replace(guest,"  ","　")
   guest=Replace(guest," ","nbsp;")      
   guest=server.htmlencode(guest) 
   guest=Replace(guest,"nbsp;"," ")
   guest=Replace(guest,vbcrlf,"<BR>") 
   htmlout=guest
End Function
'---提示信息并回到前一页面(跳二)-------
Function AlertOut(Msg)
	Response.Write "<script language=JavaScript>{alert('提示："&Msg&"！！');location.href='javascript:history.go(-2)';}</script>"
	Response.End
End Function
'---提示信息并回到前一页面(跳一)---
Function Back(str)												
	Response.Write "<SCRIPT language=JavaScript>{alert('提示："&str&"！！');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End Function
'----检测是否是数据类型---
Function CheckInt(str,Msg)
	if isnumeric(str)=false then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"只能输入数字！！');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if 
End Function
'----检查email地址的合法性---
Function CheckEmail(str,Msg)
	if instr(str,"@")<=0 or instr(str,".")<=0 then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"地址不合法！！');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if	
End Function
'---检测web地址的合法性---
Function CheckHttp(str,Msg)
	if instr(str,"http://")<=0 or instr(str,".")<=0 then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"地址不合法！！');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if	
End Function
'---检测内容是否为空---
Function CheckNull(str,Msg)												
	if trim(str)="" then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"不能为空！！');location.href='javascript:history.back()';}</SCRIPT>"
	Response.End
	End if			
End Function
'---检测月份和日期---
Function CheckTime(str,Msg)												
	if isdate(str)=false then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"输入有误（月份和日期不合法）！！');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
	End if			
End Function
'---禁止非法字符的输入chr(34)代表引号---
Function CheckChar(str,Msg)
for i=1 to len(str)
us=mid(str,i,1)
if us="~" or us="`" or us="?" or us=";" or us=":" or us="}" or us="{" or us="&" or us="'" or us="%" or us="$" or us="#" or us="@" or us="!" or us=chr(34) then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"包含不合法字符！！');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End if
next
End Function
Function CheckChar2(str,Msg)
for i=1 to len(str)
us=mid(str,i,1)
if us="~" or us="`"  or us="?" or us=">" or us="<" or us=";"  or us="}" or us="{"  or us="*" or us="&" or us="'" or us="%" or us="$" or us="#" or us="@"  or us=chr(34) then
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"包含不合法字符！！');location.href='javascript:history.go(-1)';}</SCRIPT>"
	Response.End
End if
next
End Function
'---提示信息并关闭本窗口---
Function Closes(Msg)												
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"！！');location.href='javascript:window.close()';}</SCRIPT>"
	Response.End
End Function
'---提示信息并关闭本窗口刷新父窗口---
Function CloseReload(Msg)												
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"！！');window.opener.location.reload();window.close();}</SCRIPT>"
	Response.End
End Function
'---提示信息或直接转到某一页面---
Function Href(url,Msg)
if Msg<>"" then												
	Response.Write"<SCRIPT language=JavaScript>{alert('提示："&Msg&"！！');this.location.href='"&url&"';}</SCRIPT>"
else
	Response.Write"<SCRIPT language=JavaScript>{this.location.href='"&url&"';}</SCRIPT>"
End if
End Function
'---转到相应的页面并刷新---
Function UrlMsg(Url,Msg)
if Msg<>"" then
	Response.Write "<script language=JavaScript>{alert('提示："&Msg&"！！');}</script><meta http-equiv='refresh' content='0; url="&Url&"'>"
else
	Response.Write "<meta http-equiv='refresh' content='0; url="&Url&"'>"
End if
End Function
'---分页程序(上部分)---
'---传递每页条数：num/ipagesize，第几页：page
'---maxpage:页数,countnum:记录数
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

'---分页程序(显示部分)---
'---适用于前台页面有相关页码显示---
'---pagecount:多少页,page:第几页,pagenum:中间显示几页
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
		Response.Write ("<tr><td>[首页]</td>" & vbCrLf)		
		Response.Write ("<td>[上一页]</td>" & vbCrLf)
	else		
		Response.Write("<tr><td><A HREF=" & action & "?" & temp & "Page=1>[首页]</A></td>" & vbCrLf)
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">[上一页]</A></td>" & vbCrLf)
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
		Response.Write ("<td>[下一页]</td>" & vbCrLf)
		Response.Write ("<td>[未页]</td>" & vbCrLf)
	else
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">[下一页]</A></td>" & vbCrLf)
		Response.Write("<td><A HREF=" & action & "?" & temp & "Page="&rs.pageCount&">[未页]</A></td>" & vbCrLf)
	End if
	Response.Write("<td> 每页显示" & ipagesize & "条，"&  vbCrLf)			
	Response.Write("共" & pageCount & "页，" &  vbCrLf)
	Response.Write("共" & countnum & "条信息" &  vbCrLf)
	Response.Write("</td></tr></table>")
	end if			
End Sub
'---分页程序(显示部分带图片)---
'---适用于前台页面有相关页码显示---
'---pagecount:多少页,page:第几页,pagenum:中间显示几页
Sub NextPagePic(maxpage,page,pagenum,prop)
    if maxpage>1 then
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
	Response.Write("<table  border='0' align='center' cellpadding='2' cellspacing='8'>")
	if page<=1 then
		Response.Write ("<tr><td><img src='/images/bticon_pre02.gif' border='0' alt='首 页'> 首 页 </td>" & vbCrLf)		
		Response.Write ("<td><img src='/images/bticon_pre01.gif' border='0' alt='上一页'> 上一页 </td>" & vbCrLf)
	else		
		Response.Write("<tr><td><img src='/images/bticon_pre02.gif' border='0' alt='首 页'> <A HREF=" & action & "?" & prop & "&Page=1>首 页</A> </td>" & vbCrLf)
		Response.Write("<td width='53'><img src='/images/bticon_pre01.gif' border='0' alt='上一页'> <A HREF=" & action & "?" & prop & "&Page=" & (Page-1) & ">上一页</A> </td>" & vbCrLf)
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
		Response.Write ("<td><img src='/images/bticon_next01.gif' border='0' alt='下一页'> 下一页 </td>" & vbCrLf)
		Response.Write ("<td><img src='/images/bticon_next02.gif' border='0' alt='最后一页'> 最后一页 </td>" & vbCrLf)
	else
		Response.Write("<td><img src='/images/bticon_next01.gif' border='0' alt='下一页'> <A HREF=" & action & "?" & prop & "&Page=" & (Page+1) & ">下一页</A> </td>" & vbCrLf)
		Response.Write("<td><img src='/images/bticon_next02.gif' border='0' alt='最后一页'> <A HREF=" & action & "?" & prop & "&Page="&maxpage&">最后一页</A> </td>" & vbCrLf)
	End if
	'Response.Write("<td> 每页显示" & ipagesize & "条，"&  vbCrLf)			
	'Response.Write("共" & maxpage & "页，" &  vbCrLf)
	'Response.Write("共" & countnum & "条信息</td>" &  vbCrLf)
	Response.Write("</tr></table>")
	end if			
End Sub

Sub ShowPage(pagecount,page,prop)
'生成上一页下一页链接
'参数说明:	pagecount:总页数
'page:当前页
'table_style表格样式 font_style字体样式
'example :showpage(maxpage,page,"width=100% ","<p  align=center class=font2>")
'一般用于后台操作比较适合。
	Dim query, a, x
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
	Response.Write("<table align=center class=ListTable bgcolor=F5F9FC width='100%' height=35>" & vbCrLf )
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & prop & "&Page='+ this.page.value;return false;""><TR><td width='45%' align=center>" & vbCrLf )
	if page<=1 then
		Response.Write ("[第一页] " & vbCrLf)		
		Response.Write ("[上一页] " & vbCrLf)
	else		
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=1>第一页</A>] " & vbCrLf)
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & (Page-1) & ">上一页</A>] " & vbCrLf)
	End if
	if page>=pagecount then
		Response.Write ("[下一页] " & vbCrLf)
		Response.Write ("[最后一页]" & vbCrLf)			
	else
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & (Page+1) & ">下一页</A>] " & vbCrLf)
		Response.Write("[<A HREF=" & action & "?" & prop & "&Page=" & pagecount & ">最后一页</A>]" & vbCrLf)			
	End if		
	Response.Write(" 第" & "<INPUT TYEP=TEXT NAME=page  SIZE=6 Maxlength=5 VALUE=" & page & ">" & "页"  & vbCrLf & "<INPUT type=Submit class=SearchButton style=""font-size: 7pt""  value=GO>")
	Response.Write(" 共 " & pageCount & " 页" &  vbCrLf)			
	Response.Write("[检索到"&countnum&"条信息]</TD>" & vbCrLf )
	Response.Write("</TR></form>" & vbCrLf )		
	Response.Write("</table>" & vbCrLf )
End Sub
'------前台用于传参数并可直接转到某一页----
Sub ShowLastNext(pagecount,page,prop)
    if pagecount>1 then
	Dim query, a, x, temp
	action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & prop & "&Page='+ this.page.value;return false;"">" & vbCrLf )

	if page>1 then
		Response.Write("[<A HREF="&action&"?"&prop&"&"&"Page="&(Page-1)&" class='a1'>上一页</A>]" & vbCrLf)
	End if
	if page<pagecount then
		Response.Write("[<A HREF="&action&"?" & prop & "&" & "Page=" & (Page+1) & " class='a1'>下一页</A>] " & vbCrLf)
	End if
	Response.Write(" 第" & "<INPUT TYEP=TEXT NAME=page  SIZE=6 Maxlength=5 VALUE=" & page & ">" & "页"  & vbCrLf & "<INPUT type=submit class=SearchButton style=""font-size: 7pt""  value=GO>")
	Response.Write(" 共 " & pageCount & " 页" &  vbCrLf)
	Response.Write("[检索到"&countnum&"条信息]" & vbCrLf )
	Response.Write"</form>"
	end if			
End Sub
'-------只显示年月的日期-----------
Public Function formatdate(value)
	NewTime=month(value)&"-"&day(value)
	formatdate=NewTime
End Function
%>
