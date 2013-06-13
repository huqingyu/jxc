<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('你不是企业会员！');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="upload_inc.asp"-->
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="admin/system/Style.css" type="text/css">
<body>
<br>
<%
dim action
action=trim(request("action"))
select case action
case "add"
add
case "addok"
Addok
case "Edit"
Edit
case "delok"
delok
case "editok"
editok
case "editok1"
editok1
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub Add
%>
<script>
function check(){
if(form1.x_Name.value=='' || form1.x_Baojia.value=='' || form1.x_Leixing.value=='' || form1.x_Time.value=='' || form1.x_Anpai.value=='' || form1.x_Jingdiang.value=='' || form1.x_Xingcheng.value=='' || form1.x_Beizhu.value==''){
alert("请认真填写上面所有项！");
return false;
}
}
</script>

<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <form action="?action=addok" method="post" name="form1" onSubmit="return check();">
    <tr>
      <td height="30" colspan="2" align="center" background="Images/topBar_bg.gif"><b><font color="red">企业用户添加线路</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="208" height="25" align="center" bgcolor="#f5f5f5">线路名称：</td>
      <td width="513" bgcolor="#FFFFFF">　
          <input name="x_Name" type="text" id="x_Name" size="50">
          <input name="User" type="hidden" id="User" value="<%=request.Cookies("Gemisum")("username")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">线路报价：</td>
      <td>　
          <input name="x_Baojia" type="text" id="x_Baojia" size="15">
        请用统一简结格式：XXXRMB/人、XXX人民币/人</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">线路类型：</td>
      <td>　
          <input name="x_Leixing" type="text" id="x_Leixing" size="15">
        如：常规线、精品线 等 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">线路类别：</td>
      <td>　
          <select name="x_Leibie" id="x_Leibie">
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
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">是否置顶：</td>
      <td> 　
          <select name="x_Top" id="x_Top">
            <option value="0" selected>不置顶</option>
            <option value="1">置　顶</option>
          </select>
        置顶后，此线路总是显示在最前面</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">线路时间：</td>
      <td>　
          <input name="x_Time" type="text" id="x_Time" size="20">
        请用统一简结格式：三天二晚游、四日五晚游 等 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">行程安排：</td>
      <td height="110">　
          <textarea name="x_Anpai" cols="60" rows="6" id="x_Anpai">无</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">线路途经景点：</td>
      <td height="110">　
          <textarea name="x_Jingdiang" cols="60" rows="6" id="x_Jingdiang">无</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">线路、行程说明：</td>
      <td height="110">　
          <textarea name="x_Xingcheng" cols="60" rows="6" id="x_Xingcheng">无</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">备　　　注：</td>
      <td height="110">　
          <textarea name="x_Beizhu" cols="60" rows="6" id="x_Beizhu">无</textarea></td>

    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" align="center" bgcolor="#f5f5f5">线路景点图片：</td>
      <td>　
          <input name="ttt" type="file" id="ttt" size="40">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" bgcolor="#F5F5F5"><div align="center">发布者(前台显示):</div></td>
      <td height="24">　
        <input name="x_Fabuzhe" type="text" id="x_Fabuzhe" size="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" colspan="2">　　*上传文件类型为：gif,jpg,bmp，大小<2M。除图片外所有项均为必填写项。</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="确 定 添 加"></td>
    </tr>
  </form>
</table><br>
<%
End sub
Sub Addok

Dim x_Name,User,x_Baojia,x_Leixing,x_Leibie,x_Top,x_Time,x_Anpai,x_Jingdiang,x_Xingcheng,x_Beizhu,x_Fabuzhe
x_Name=trim(request("x_Name"))
User=trim(request("User"))
x_Baojia=trim(request("x_Baojia"))
x_Leixing=trim(request("x_Leixing"))
x_Leibie=trim(request("x_Leibie"))
x_Top=trim(request("x_Top"))
x_Time=trim(request("x_Time"))
x_Anpai=trim(request("x_Anpai"))
x_Jingdiang=trim(request("x_Jingdiang"))
x_Xingcheng=trim(request("x_Xingcheng"))
x_Beizhu=trim(request("x_Beizhu"))
x_Fabuzhe=trim(request("x_Fabuzhe"))
filepath=trim(request("ttt"))

set rs=server.createobject("adodb.recordset")
sql="select x_name,x_baojia,x_leixun,x_shijian,x_shuoming,x_jingdian,x_anpai,x_jingdiantupian,x_leiid,x_top,User,Fabuzhe,Audit from Xianlu"
rs.open sql,conn,3,3
rs.addnew

	rs("x_name")=x_Name
	rs("x_baojia")=x_Baojia
	rs("x_leiid")=x_Leibie
	rs("x_leixun")=x_Leixing
	rs("x_shijian")=x_Time
	rs("x_shuoming")=x_Beizhu
	rs("x_jingdian")=x_Jingdiang
	rs("x_anpai")=x_Xingcheng
	rs("x_jingdiantupian")=filepath
	rs("x_top")=x_Top
	rs("User")=User
	rs("Fabuzhe")=x_Fabuzhe
	rs("Audit")=False
rs.update
rs.close
response.Write "<script language='javascript'>alert('该文章添加成功,请等待管理员审核!');window.location.href='UserInfo.asp';</script>"
response.End
end sub
Sub Edit
dim UserName
UserName=request.Cookies("Gemisum")("username")
set er=server.createobject("adodb.recordset")
ersql="select id,x_name,x_jingdiantupian,x_top,User,Audit from xianlu where User='"&UserName&"' order by x_top desc"
er.open ersql,conn,1,1
if er.eof then
response.write "你还没有发布任何线路信息!"
Else
%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="401" height="30" background="Images/topBar_bg.gif">以下是你发布的线路信息</td>
    <td width="119" height="30" background="Images/topBar_bg.gif">线路状态</td>
    <td width="76" background="Images/topBar_bg.gif">删除</td>
    <td width="48" background="Images/topBar_bg.gif" bgcolor="#f5f5f5">编辑</td>
  </tr>
<%
do while not er.eof
%>
  <tr bgcolor="#FFFFFF">
    <td height="24">
<%
if trim(er("x_top"))=1 then
response.write ("<font color=red >荐</font>")
else
response.write ("<font color=red >普</font>")
end if
%>
    <a href="Xl/Xl_<%=er("id")%>.html" target="_blank"><%=er("x_name")%></a></td>
    <td align="center"><%
if er("Audit")="True" then
response.write ("<font color=Green >通过审核</font>")
else
response.write ("<font color=Red >尚未审核</font>")
end if
%></td>
    <td align="center"><a href="User_addxl.asp?action=delok&img=<%=er("x_jingdiantupian")%>&id=<%=er("id")%>">删除</a></td>
    <td align="center"><a href="User_addxl.asp?action=editok&id=<%=er("id")%>" title='编辑'>编辑</a></td>
  </tr>
<%
er.movenext
loop
end if
er.close
%>
</table>
<%End Sub
sub delok
dim id,img,FileName
id=trim(request("id"))
img=trim(request("img"))
img=replace(img,"Admin/XlUploadImages/","")
FileName = "Xl/Xl_"&id&".html"
if not isnumeric(id) then
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end if
if instr(img,"Admin/XlUploadImages/")>0 then
Set fso = CreateObject("Scripting.FileSystemObject")
Set f1 = fso.getfile(server.mappath("Admin/XlUploadImages/"&img))
f2.delete
set fso=nothing
set f1=nothing
end if
conn.execute("delete from xianlu where id="&id)
response.write("<script>alert('删除操作成功！按确定后新载入！');location='User_addxl.asp?action=Edit';</script>")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f3 = fso.getfile(server.mappath(FileName))
f3.delete
set fso=nothing
set f3=nothing
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
<br><br><br>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<form action="?action=editok1" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="Images/topBar_bg.gif"><b><font color="red">编辑线路</font></b></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td width="204" height="25" align="center" bgcolor="#f5f5f5">线路名称：</td>
    <td width="714" bgcolor="#FFFFFF">　
      <input name="ta" type="text" id="ta4" value="<%=rs("x_name")%>" size="50">
      <input name="xid" type="hidden" value="<%=rs("id")%>"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">线路报价：</td>
    <td>　
    <input name="tb" type="text" id="tb" value="<%=rs("x_baojia")%>" size="15">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">线路类型：</td>
    <td>　
    <input name="tc" type="text" id="tc" value="<%=rs("x_leixun")%>" size="15"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
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
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">置顶情况：</td>
    <td>　
      <select name="x_top">
        <option value="0" <%if trim(rs("x_top"))=0 then response.write("selected")%>>不置顶</option>
        <option value="1" <%if trim(rs("x_top"))=1 then response.write("selected")%>>置　顶</option>
      </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">线路时间：</td>
    <td>　
    <input name="te" type="text" id="te" value="<%=rs("x_shijian")%>" size="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">行程安排：</td>
    <td height="110">　
    <textarea name="tf" cols="60" rows="6" id="tf"><%=rs("x_anpai")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">线路途经景点：</td>
    <td height="110">　
    <textarea name="tg" cols="60" rows="6" id="tg"><%=rs("x_jingdian")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">线路、行程说明：</td>
    <td height="110">　
    <textarea name="th" cols="60" rows="6" id="th"><%=rs("x_shuoming")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">备　　　注：</td>
    <td height="110">　
      <textarea name="tk" cols="60" rows="6" id="tk"><%=rs("x_zhushi")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="24" align="center" bgcolor="#f5f5f5">线路景点图片：</td>
    <td>　    
	<input name="ttt" type="file" id="ttt" size="40"><input name="rimg" type="hidden" value="<%=rs("x_jingdiantupian")%>">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="36" align="center" bgcolor="#f5f5f5">原图片情况：</td>
    <td height="36"><%
if instr(rs("x_jingdiantupian"),"Admin/XlUploadImages/")=0 then
response.write ("　无内部图片或图片是外部，建议重新上传内部图片来覆盖此！　<br>　当前图片地址：")
response.write ("<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a>")
else
response.write("　内部图片地址：<a href=admin/"&rs("x_jingdiantupian")&" target=_blank>admin/"&rs("x_jingdiantupian")&"</a><br>　要删除此图片只要重新上传，不做操作则保持图片不变。")
end if
	%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="24" colspan="2">　　*上传文件类型为：gif,jpg,bmp，大小<2M。除图片外所有项均为必填写项。</td>
  </tr>
  <tr bgcolor="#FFFFFF">
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
pthString="admin/XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if instr(img,pthstring)=0 then
response.write ("不是内部图，无须删除！")
else
img1=replace(img,"admin/XlUploadImages/","")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.getfile(server.mappath("admin/XlUploadImages/"&img1))
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
response.write("<script>alert('此线路编辑修改完成！按确定重新载入！');location='User_addxl.asp?action=editok&id="&id&"';</script>")
end sub

%>
</body>
</html>