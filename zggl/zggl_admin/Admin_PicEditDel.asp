
<!--#include file="admin_check_permission.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<title>编辑图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<!--#include file="admin_common/conn.asp" -->
<%
dim action
action=trim(request("action"))
select case action
case "del"
del
case "delok"
delok
case "edit"
edit
case "editok"
editok
case "editok1"
editok1
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub del()
%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5" style="BORDER-bottom: #999999 1px solid;BORDER-RIGHT: #999999 1px solid;BORDER-left: #999999 1px solid">
<tr>
<%
set rs1=conn.execute("select id,board from Picboard")
while not rs1.eof
%>
<td height=30 align=center><a href="Admin_PicEditDel.asp?action=del&id=<%=trim(rs1("id"))%>"><%=rs1("board")%></a></td>
<%
rs1.movenext
wend
rs1.close
%>
</tr></table>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<tr bgcolor="#f5f5f5">
<td width="89%" height="30" align="center" background="images/admin_bg_1.gif">前15条线路名称，更多请点击上面分类(点击查看详细信息)</td>
<td width="11%" align="center" background="images/admin_bg_1.gif">删除</td>
</tr>
<%
dim id
id=trim(request("id"))
if id="" or not isnumeric(id) then
sql="select top 15 id,name,Leixing,Pic_Url,Tuijiang from Pic order by id desc"
else
sql="select id,name,Leixing,Pic_Url,Tuijiang from Pic where Leixing="&id&" order by id desc"
end if
set rs2=conn.execute(sql)
while not rs2.eof
%>
<tr bgcolor=#FFF><td height=24>
<%
if trim(rs2("Tuijiang"))=1 then
response.write ("<font color=red >荐</font>")
else
response.write ("<font color=red >普</font>")
end if
%>
<%=trim(rs2("name"))%>
</td><td align=center><a href="Admin_PicEditDel.asp?action=delok&img=<%=rs2("Pic_Url")%>&id=<%=rs2("id")%>"><img src="images/mfk26.gif" border=0></a></td></tr>
<%
rs2.movenext
wend
rs2.close
%>
</table>
<%
end sub
sub delok()
dim id,img
id=trim(request("id"))
img=trim(request("img"))
if not isnumeric(id) then
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end if
'if instr(img,"UploadFile/")=0 Then
'Set fso = CreateObject("Scripting.FileSystemObject")
'Set f1 = fso.getfile(server.mappath(img,"UploadFile/"))
'f1.delete
'set fso=nothing
'set f1=nothing
'end if
conn.execute("delete from Pic where Id="&id)
response.write("<script>alert('删除操作成功！按确定后新载入！');location='Admin_PicEditDel.asp?action=del';</script>")
end sub
sub edit()
%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5" style="BORDER-bottom: #999999 1px solid;BORDER-RIGHT: #999999 1px solid;BORDER-left: #999999 1px solid">
<tr>
<%
set rs=conn.execute("select id,board from picboard")
while not rs.eof
%>
<td height=30 align=center><a href=Admin_PicEditDel.asp?action=edit&id=<%=trim(rs("id"))%>><%=trim(rs("board"))%></a></td>
<%
rs.movenext
wend
rs.close
%>
</tr></table>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<tr align="center" bgcolor="#f5f5f5">
<td width="79%" height="30" background="images/admin_bg_1.gif">前15条线路名称，更多请点击上面分类(点击查看详细信息)</td>
<td width="10%" background="images/admin_bg_1.gif">类别标识</td>
<td width="11%" background="images/admin_bg_1.gif">编辑</td>
</tr>
<%
dim id
id=trim(request("id"))
if id="" or not isnumeric(id) then
tt="select top 15 Id,Name,Leixing,Tuijiang from pic order by Id desc"
else
tt="select Id,Name,Leixing,Tuijiang from pic where Leixing = "&id&" order by id desc"
end if
set er=conn.execute(tt)
while not er.eof
%>
<tr>
<td height="24">
<%
if trim(er("Tuijiang"))=1 then
response.write ("<font color=red >荐</font>")
else
response.write ("<font color=red >普</font>")
end if
%>
<a href="../pic_info.asp?id=<%=er("id")%>" target="_blank"><%=er("name")%></a></td>
<td align="center"><%=er("Leixing")%></td>
<td align="center"><a href=Admin_PicEditDel.asp?action=editok&id=<%=er("id")%>>编辑</a></td>
</tr>
<%
er.movenext
wend
er.close
%>
</table>
<%
end sub
sub editok()
dim id
id=trim(request("id"))
set rs=conn.execute("select Id,Name,Leixing,TuiJiang,Pic_slt,Pic_url,Info from pic where id="&id)
%>
<br /><br /><br />
<script>
function check(){
if(form1.Name2.value=='' || form1.Pic_slt2.value=='' || form1.Pic_url2.value=='' || form1.Info2.value==''){
alert("请认真填写上面所有项！");
return false;
}
}
function openScript(url, width, height){
var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',left=450,top=300,resizable=1,scrollbars=no,menubar=no,status=no' );
}
function openem()
{ 
openScript('upload.asp?UP=admin',300,100); 
}
</script>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=editok1&id=<%=rs("id")%>" method="post" name="form1" onSubmit="return check();">
<tr>
<td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><font color="#FF0000"><b>编辑图片信息</b></font></td>
</tr>
<tr>
<td width="187" height="25" align="center" bgcolor="#f5f5f5">图片名称：</td>
<td width="731">　
<input name="name2" type="text" id="name2" value="<%=rs("name")%>" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">图片类别：</td>
<td>　 
<select name="Leixing2" id="Leixing2">
<%
set leirs=conn.execute("select id,board from Picboard order by id desc")
while not leirs.eof
s=trim(leirs("id"))
d=trim(rs("leixing").value)
response.write("<option value="""&s&"""")
if s=d then
response.write(" selected")
end if
response.write(">"&leirs("board")&"</option>")
leirs.movenext
wend
leirs.close
%>
</select>
请先择。如没有类型，请先建立类别后再添加图片</td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">是否推荐：</td>
<td>
　 
是
<input name="tuijiang2" type="radio" value="1" <%if rs("Tuijiang")=1 then %>checked<%end if%>>
否
<input name="tuijiang2" type="radio" value="0" <%if rs("Tuijiang")=0 then %>checked<%end if%>></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">&nbsp;&nbsp;&nbsp;缩略图：</td>
<td>　
<input name="Pic_slt2" type="text" id="Pic_slt2" size="50" value="<%=rs("Pic_slt")%>">
<input type="button" name="Button3" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">图片路径：</td>
<td>　
<input name="pic_url2" type="text" id="pic_url2" size="50" value="<%=rs("Pic_url")%>">
<input type="button" name="Button22"  value="浏 览" onClick="JavaScript:openem()"></td>
</tr>
<tr>
<td height="110" align="center" bgcolor="#f5f5f5">图片介绍：</td>
<td height="110">　
<textarea name="info2" cols="60" rows="6" id="info2"><%=rs("info")%></textarea></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#F5F5F5">原图情况：</td>
<td height="25" align="left">
<%
set rs=conn.execute("select id,pic_Url from Pic order by id desc")
if instr(rs("pic_Url"),"UploadFile/")=0 then
response.write ("　无内部图片或图片是外部，建议重新上传内部图片来覆盖此！　<br />　当前图片地址：")
response.write ("<a href="&rs("pic_Url")&" target=_blank>"&rs("pic_Url")&"</a>")
else
response.write("　内部图片地址：<a href="&rs("pic_Url")&" target=_blank>"&rs("pic_Url")&"</a><br />　要删除此图片只要重新上传，不做操作则保持图片不变。")
end if
rs.close
%>
</td></tr><tr>
<td height="35" colspan="2" align="center"><input type="submit" name="Submit2" value="确 定 修 改"></td>
</tr></form></table>
<%
rs.close
end sub
sub editok1()
dim id,Name1,Leixing1,Tuijiang1,Pic_slt1,Pic_url1,Info1

id=trim(request("id"))
Name1=trim(request("Name2"))
Leixing1=trim(request("Leixing2"))
Tuijiang1=trim(request("Tuijiang2"))
Pic_slt1=trim(request("Pic_slt2"))
Pic_url1=trim(request("Pic_url2"))
Info1=request("Info2")

set rs=server.createobject("adodb.recordset")
sql="Select * From Pic where Id="+id
rs.open sql,conn,3,3

rs("Name")=Name1
rs("Leixing")=Leixing1
rs("Tuijiang")=Tuijiang1
rs("Pic_slt")=Pic_slt1
rs("Pic_url")=Pic_url1
rs("Info")=Info1
rs.update
rs.close
conn.close

response.Write "<script language='javascript'>alert('该图片记录更新成功！');window.location.href='Admin_PicEditDel.asp?action=edit';</script>"
response.End
end sub
%>
</body>
</html>