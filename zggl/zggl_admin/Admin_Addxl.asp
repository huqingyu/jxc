<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="upload_inc.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
<%
dim action
action=trim(request("action"))
select case action
case "add"
add
case "addok"
addok
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
sub add
%>
<script>
function check(){
if(form1.ta.value=='' || form1.tb.value=='' || form1.tc.value=='' || form1.td.value=='' || form1.te.value=='' || form1.tf.value=='' || form1.tg.value=='' || form1.th.value==''){
alert("请认真填写上面所有项！");
return false;
}
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=addok" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="red">添加线路</font></b></td>
    </tr>
  <tr>
    <td width="187" height="25" align="center" bgcolor="#f5f5f5">线路名称：</td>
    <td width="731">　
      <input name="ta" type="text" id="ta" size="50"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路报价：</td>
    <td>　
    <input name="tb" type="text" id="tb" size="15">
    请用统一简结格式：XXXRMB/人、XXX人民币/人</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路类型：</td>
    <td>　
    <input name="tc" type="text" id="tc" size="15">
    如：常规线、精品线 等 </td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路类别：</td>
    <td>　
      <select name="td" id="td">
<%
set rs=conn.execute("select id,board from board order by id desc")
while not rs.eof
response.write("<option value="""&trim(rs("id"))&""">"&rs("board")&"</option>")
rs.movenext
wend
rs.close
%>
      </select>
    请先择。如没有类型，请先建立类别后再添加线路</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">是否置顶：</td>
    <td> 　 
      <select name="x_top" id="x_top">
        <option value="0" selected>不置顶</option>
        <option value="1">置　顶</option>
      </select>
      置顶后，此线路总是显示在最前面</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路时间：</td>
    <td>　
    <input name="te" type="text" id="te" size="20">
    请用统一简结格式：三天二晚游、四日五晚游 等 </td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">行程安排：</td>
    <td height="110">　
    <textarea name="tf" cols="60" rows="6" id="tf">无</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">线路途经景点：</td>
    <td height="110">　
    <textarea name="tg" cols="60" rows="6" id="tg">无</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">线路、行程说明：</td>
    <td height="110">　
    <textarea name="th" cols="60" rows="6" id="th">无</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">备　　　注：</td>
    <td height="110">　
      <textarea name="tk" cols="60" rows="6" id="tk">无</textarea></td>
  </tr>
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5">线路景点图片：</td>
    <td>　    
	<input name="ttt" type="file" id="ttt" size="40">    </td>
  </tr>
  <tr>
    <td height="24" colspan="2">　　*上传文件类型为：gif,jpg,bmp，大小<2M。除图片外所有项均为必填写项。</td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="确 定 添 加"></td>
    </tr>
</form>
</table>
<%
end sub
sub addok
set upload=new upload_5xsoft
dim ta,tb,tc,td,te,tf,tg,tj,tk,x_top
ta=replace(trim(upload.Form("ta")),"'","’")
tb=replace(trim(upload.Form("tb")),"'","’")
tc=replace(trim(upload.Form("tc")),"'","’")
td=replace(trim(upload.Form("td")),"'","’")
te=replace(trim(upload.Form("te")),"'","’")
tf=replace(trim(upload.Form("tf")),"'","’")
tg=replace(trim(upload.Form("tg")),"'","’")
th=replace(trim(upload.Form("th")),"'","’")
tk=replace(trim(upload.Form("tk")),"'","’")
x_top=trim(upload.Form("x_top"))
IDstring="Gemisum"&date & time
IDstring=Replace(IDstring,"-","")
IDstring=Replace(IDstring,":","")
pthString="XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if file.filesize>2097152 then
set file=nothing
response.write("<script>alert('上传图片的大小不能大于2M，即：2097152字节！');history.back(1);</script>")
else
FileTpe=Mid(file.filename,Len(file.filename)-2)
if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
response.write("<script>alert('上传图片格式只能为：JPG,BMP,GIF。');history.back(1);</script>")
else
file.saveAs Server.mappath(pthString & IDstring & "." & FileTpe)
filepath=pthString & IDstring & "." & FileTpe
end if
end if
else
filepath=""
end if
set file=nothing
conn.execute "insert into xianlu (x_name,x_baojia,x_leixun,x_shijian,x_shuoming,x_jingdian,x_anpai,x_zhushi,x_jingdiantupian,x_leiid,x_top) values ('"&ta&"','"&tb&"','"&tc&"','"&te&"','"&th&"','"&tg&"','"&tf&"','"&tk&"','"&filepath&"','"&td&"',"&x_top&")"
conn.close
response.write("<script>alert('添加线路成功！');location='admin_addxl.asp?action=edit';</script>")
end sub
sub del
%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5" style="BORDER-bottom: #999999 1px solid;BORDER-RIGHT: #999999 1px solid;BORDER-left: #999999 1px solid">
  <tr>
<%
set rs1=conn.execute("select id,board from board")
while not rs1.eof
%>
<td height=30 align=center><a href=admin_addxl.asp?action=del&id=<%=trim(rs1("id"))%>><%=trim(rs1("board"))%></a></td>
<%
rs1.movenext
wend
rs1.close
%>
</tr></table>

<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr bgcolor="#f5f5f5">
    <td width="728" height="30" align="center" background="images/admin_bg_1.gif">前15条线路名称，更多请点击上面分类(点击查看详细信息)</td>
    <td width="93" align="center" background="images/admin_bg_1.gif">图片</td>
    <td width="95" align="center" background="images/admin_bg_1.gif">删除</td>
  </tr>
<%
dim id
id=trim(request("id"))
if id="" or not isnumeric(id) then
sql="select top 15 id,x_name,x_leiid,x_jingdiantupian,x_top,user from xianlu order by x_top desc"
else
sql="select id,x_name,x_leiid,x_jingdiantupian,x_top,user from xianlu where x_leiid="&id&" order by x_top desc"
end if
set rs2=conn.execute(sql)
while not rs2.eof
response.write("<tr bgcolor=#FFF><td height=24>")
if trim(rs2("x_top"))=1 then
response.write ("<font color=red >荐</font>")
else
response.write ("<font color=red >普</font>")
end if
response.write(" <a href=""../Xl/Xl_"&rs2("id")&".html"" target=""_blank"">"&trim(rs2("x_name"))&"</a>")
if rs2("user")<>"" then
response.write("<font color=green>("&rs2("User")&"用户发布)</font>")
End If
response.write("</td><td align=center>")
if instr(rs2("x_jingdiantupian"),"system/uploadimages")>0 then
response.Write("<font color=#ff0000><a title='有图，删除线路后图片也将被删除'>有图</a></font>")
else
response.write("<a title='无图片或图片是外部图片'>无图</a>")
end if
response.write("</td><td align=center><a href=""admin_addxl.asp?action=delok&img="&rs2("x_jingdiantupian")&"&id="&rs2("id")&"""><img src=""images/mfk26.gif"" border=0></a></td></tr>")
rs2.movenext
wend
rs2.close
%>
</table>
<tr>
<%
end sub
sub delok
dim id,img,FileName
id=trim(request("id"))
img=trim(request("img"))
img=replace(img,"XlUploadImages/","")
FileName = "../Xl/Xl_"&id&".html"
if not isnumeric(id) then
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end if
if instr(img,"XlUploadImages/")>0 then
Set fso = CreateObject("Scripting.FileSystemObject")
Set f1 = fso.getfile(server.mappath("XlUploadImages/"&img))
f2.delete
set fso=nothing
set f1=nothing
end if
conn.execute("delete from xianlu where id="&id)
response.write("<script>alert('删除操作成功！按确定后新载入！');location='admin_addxl.asp?action=del';</script>")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f3 = fso.getfile(server.mappath(FileName))
f3.delete
set fso=nothing
set f3=nothing
end sub
sub edit
%>

<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5" style="BORDER-bottom: #999999 1px solid;BORDER-RIGHT: #999999 1px solid;BORDER-left: #999999 1px solid">
  <tr>
<%
set rs=conn.execute("select id,board from board")
while not rs.eof
%>
<td height=30 align=center><a href=admin_addxl.asp?action=edit&id=<%=trim(rs("id"))%>><%=trim(rs("board"))%></a></td>
<%
rs.movenext
wend
rs.close
%>
</tr></table>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="477" height="30" background="images/admin_bg_1.gif">前15条线路名称，更多请点击上面分类(点击查看详细信息)</td>
    <td width="196" height="30" background="images/admin_bg_1.gif">线路状态</td>
    <td width="89" background="images/admin_bg_1.gif">类别标识</td>
    <td width="94" background="images/admin_bg_1.gif">生成html</td>
    <td width="56" background="images/admin_bg_1.gif" bgcolor="#f5f5f5">编辑</td>
  </tr>
<%
dim id
id=trim(request("id"))
if id="" or not isnumeric(id) then
tt="select top 15 id,x_name,x_leiid,x_top,User,Audit from xianlu order by x_top desc"
else
tt="select id,x_name,x_leiid,x_top,User,Audit from xianlu where x_leiid="&id&" order by x_top desc"
end if
set er=conn.execute(tt)
while not er.eof
%>
  <tr>
    <td height="24">
<%
if trim(er("x_top"))=1 then
response.write ("<font color=red >荐</font>")
else
response.write ("<font color=red >普</font>")
end if
%>
    <a href="../Xl/Xl_<%=er("id")%>.html" target="_blank"><%=er("x_name")%></a><%if er("user")<>"" then
response.write("<font color=green>("&er("User")&"用户发布)</font>")
End If%></td>
    <td align="center"><%
if er("User")<>"" then
if trim(er("Audit"))="False" then
response.write ("<table><tr><form name=formAudit id =formAudit method=post action=AuditOk.asp><td><font color=red >用户发布(未审核) </font><input name='XId' type='hidden' id='XId' value='"&er("Id")&"'><input name='UserName' type='hidden' id='UserName' value='"&er("User")&"'><input type=button name=Submit value=审核 onClick=checkAudit();></td></form></tr></table>")
else
response.write ("<font color=Green >用户发布(已审核)</font>")
end if
Else
response.write ("<font color=orange>管理员发布</font>")
End if
%></td>

    <td align="center"><%=er("x_leiid")%></td>
    <td align="center"><a href=make_Xllist.asp?id=<%=er("id")%>>生成</a></td>
    <td align="center"><a href="admin_addxl.asp?action=editok&id=<%=er("id")%>" title='编辑'>编辑</a></td>
  </tr>
<%
er.movenext
wend
er.close
%>
</table>
<form name='formAuditOk' action='AuditOk.asp' method='post' target='formAuditk'>
<input type='hidden' name='username' value=''>
<input type='hidden' name='XId' value=''>
</form>
<script>
function checkAudit()
{
  if (document.formAudit.UserName.value=="")
	{
	alert("错误,不能进行审核！");
	return false;
	}
  else
    {
	document.formAuditOk.username.value=document.formAudit.UserName.value;
	document.formAuditOk.XId.value=document.formAudit.XId.value;
	var popupWin = window.open('AuditOk.asp', 'formAuditk', 'scrollbars=no,width=340,height=200');
	document.formAuditOk.submit();
	}
}
</script>
<%
end sub
sub editok
dim id
id=trim(request("id"))
set rs=conn.execute("select * from xianlu where id="&id)
%>
<script>
function check(){
if(form1.ta.value=='' || form1.tb.value=='' || form1.tc.value=='' || form1.td.value=='' || form1.te.value=='' || form1.tf.value=='' || form1.tg.value=='' || form1.th.value==''){
alert("请认真填写上面所有项！");
return false;
}
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=editok1" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="red">编辑线路</font></b></td>
    </tr>
  <tr>
    <td width="204" height="25" align="center" bgcolor="#f5f5f5">线路名称：</td>
    <td width="714">　
      <input name="ta" type="text" id="ta4" value="<%=rs("x_name")%>" size="50">
      <input name="xid" type="hidden" value="<%=rs("id")%>"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路报价：</td>
    <td>　
    <input name="tb" type="text" id="tb" value="<%=rs("x_baojia")%>" size="15">    </td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路类型：</td>
    <td>　
    <input name="tc" type="text" id="tc" value="<%=rs("x_leixun")%>" size="15"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路类别：</td>
    <td>　
      <select name="td" id="td">
<%
set leirs=conn.execute("select id,board from board order by id desc")
while not leirs.eof
s=trim(leirs("id"))
d=trim(rs("x_leiid").value)
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
</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">置顶情况：</td>
    <td>　
      <select name="x_top">
        <option value="0" <%if trim(rs("x_top"))=0 then response.write("selected")%>>不置顶</option>
        <option value="1" <%if trim(rs("x_top"))=1 then response.write("selected")%>>置　顶</option>
      </select></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">线路时间：</td>
    <td>　
    <input name="te" type="text" id="te" value="<%=rs("x_shijian")%>" size="20">    </td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">行程安排：</td>
    <td height="110">　
    <textarea name="tf" cols="60" rows="6" id="tf"><%=rs("x_anpai")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">线路途经景点：</td>
    <td height="110">　
    <textarea name="tg" cols="60" rows="6" id="tg"><%=rs("x_jingdian")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">线路、行程说明：</td>
    <td height="110">　
    <textarea name="th" cols="60" rows="6" id="th"><%=rs("x_shuoming")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">备　　　注：</td>
    <td height="110">　
      <textarea name="tk" cols="60" rows="6" id="tk"><%=rs("x_zhushi")%></textarea></td>
  </tr>
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5">线路景点图片：</td>
    <td>　    
	<input name="ttt" type="file" id="ttt" size="40"><input name="rimg" type="hidden" value="<%=rs("x_jingdiantupian")%>">    </td>
  </tr>
  <tr>
    <td height="36" align="center" bgcolor="#f5f5f5">原图片情况：</td>
    <td height="36"><%
if instr(rs("x_jingdiantupian"),"XlUploadImages/")=0 then
response.write ("　无内部图片或图片是外部，建议重新上传内部图片来覆盖此！　<br />　当前图片地址：")
response.write ("<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a>")
else
response.write("　内部图片地址：<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a><br />　要删除此图片只要重新上传，不做操作则保持图片不变。")
end if
	%></td>
  </tr>
  <tr>
    <td height="24" colspan="2">　　*上传文件类型为：gif,jpg,bmp，大小<2M。除图片外所有项均为必填写项。</td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="确 定 修 改"></td>
    </tr>
</form>
</table>
<%
rs.close
end sub
sub editok1
set upload=new upload_5xsoft
dim id,ta,tb,tc,td,te,tf,tg,tj,tk,x_top
id=trim(upload.form("xid"))
ta=replace(trim(upload.Form("ta")),"'","’")
tb=replace(trim(upload.Form("tb")),"'","’")
tc=replace(trim(upload.Form("tc")),"'","’")
td=replace(trim(upload.Form("td")),"'","’")
te=replace(trim(upload.Form("te")),"'","’")
tf=replace(trim(upload.Form("tf")),"'","’")
tg=replace(trim(upload.Form("tg")),"'","’")
th=replace(trim(upload.Form("th")),"'","’")
tk=replace(trim(upload.Form("tk")),"'","’")
x_top=trim(upload.form("x_top"))
img=trim(upload.form("rimg"))
IDstring="Gemisum"&date & time
IDstring=Replace(IDstring,"-","")
IDstring=Replace(IDstring,":","")
pthString="XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if instr(img,pthstring)=0 then
response.write ("不是内部图，无须删除！")
else
img1=replace(img,"XlUploadImages/","")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.getfile(server.mappath("XlUploadImages/"&img1))
f2.delete
conn.execute("update xianlu set x_jingdiantupian='' where id="&id)
end if
if file.filesize>2097152 then
set file=nothing
response.write("<script>alert('上传图片的大小不能大于2M，即：2097152字节！');history.back(1);</script>")
else
FileTpe=Mid(file.filename,Len(file.filename)-2)
if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
response.write("<script>alert('上传图片格式只能为：JPG,BMP,GIF。');history.back(1);</script>")
else
file.saveAs Server.mappath(pthString & IDstring & "." & FileTpe)
filepath=pthString & IDstring & "." & FileTpe
conn.execute("update xianlu set x_jingdiantupian='"&filepath&"' where id="&id)
set f2=nothing
set file=nothing
end if
end if
end if
sss="update xianlu set x_name='"&ta&"',x_baojia='"&tb&"',x_leixun='"&tc&"',x_shijian='"&te&"',x_shuoming='"&th&"',x_jingdian='"&tg&"',x_anpai='"&tf&"',x_zhushi='"&tk&"',x_leiid='"&td&"',x_top="&x_top&" where id="&id
conn.execute(sss)
conn.close
response.write("<script>alert('此线路编辑修改完成！按确定重新载入！');location='admin_addxl.asp?action=editok&id="&id&"';</script>")
end sub
%>