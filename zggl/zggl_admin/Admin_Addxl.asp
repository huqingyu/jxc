<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub add
%>
<script>
function check(){
if(form1.ta.value=='' || form1.tb.value=='' || form1.tc.value=='' || form1.td.value=='' || form1.te.value=='' || form1.tf.value=='' || form1.tg.value=='' || form1.th.value==''){
alert("��������д���������");
return false;
}
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=addok" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="red">�����·</font></b></td>
    </tr>
  <tr>
    <td width="187" height="25" align="center" bgcolor="#f5f5f5">��·���ƣ�</td>
    <td width="731">��
      <input name="ta" type="text" id="ta" size="50"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ۣ�</td>
    <td>��
    <input name="tb" type="text" id="tb" size="15">
    ����ͳһ����ʽ��XXXRMB/�ˡ�XXX�����/��</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ͣ�</td>
    <td>��
    <input name="tc" type="text" id="tc" size="15">
    �磺�����ߡ���Ʒ�� �� </td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���</td>
    <td>��
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
    ��������û�����ͣ����Ƚ��������������·</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">�Ƿ��ö���</td>
    <td> �� 
      <select name="x_top" id="x_top">
        <option value="0" selected>���ö�</option>
        <option value="1">�á���</option>
      </select>
      �ö��󣬴���·������ʾ����ǰ��</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·ʱ�䣺</td>
    <td>��
    <input name="te" type="text" id="te" size="20">
    ����ͳһ����ʽ����������Ρ����������� �� </td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">�г̰��ţ�</td>
    <td height="110">��
    <textarea name="tf" cols="60" rows="6" id="tf">��</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��·;�����㣺</td>
    <td height="110">��
    <textarea name="tg" cols="60" rows="6" id="tg">��</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��·���г�˵����</td>
    <td height="110">��
    <textarea name="th" cols="60" rows="6" id="th">��</textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��������ע��</td>
    <td height="110">��
      <textarea name="tk" cols="60" rows="6" id="tk">��</textarea></td>
  </tr>
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5">��·����ͼƬ��</td>
    <td>��    
	<input name="ttt" type="file" id="ttt" size="40">    </td>
  </tr>
  <tr>
    <td height="24" colspan="2">����*�ϴ��ļ�����Ϊ��gif,jpg,bmp����С<2M����ͼƬ���������Ϊ����д�</td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="ȷ �� �� ��"></td>
    </tr>
</form>
</table>
<%
end sub
sub addok
set upload=new upload_5xsoft
dim ta,tb,tc,td,te,tf,tg,tj,tk,x_top
ta=replace(trim(upload.Form("ta")),"'","��")
tb=replace(trim(upload.Form("tb")),"'","��")
tc=replace(trim(upload.Form("tc")),"'","��")
td=replace(trim(upload.Form("td")),"'","��")
te=replace(trim(upload.Form("te")),"'","��")
tf=replace(trim(upload.Form("tf")),"'","��")
tg=replace(trim(upload.Form("tg")),"'","��")
th=replace(trim(upload.Form("th")),"'","��")
tk=replace(trim(upload.Form("tk")),"'","��")
x_top=trim(upload.Form("x_top"))
IDstring="Gemisum"&date & time
IDstring=Replace(IDstring,"-","")
IDstring=Replace(IDstring,":","")
pthString="XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if file.filesize>2097152 then
set file=nothing
response.write("<script>alert('�ϴ�ͼƬ�Ĵ�С���ܴ���2M������2097152�ֽڣ�');history.back(1);</script>")
else
FileTpe=Mid(file.filename,Len(file.filename)-2)
if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
response.write("<script>alert('�ϴ�ͼƬ��ʽֻ��Ϊ��JPG,BMP,GIF��');history.back(1);</script>")
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
response.write("<script>alert('�����·�ɹ���');location='admin_addxl.asp?action=edit';</script>")
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
    <td width="728" height="30" align="center" background="images/admin_bg_1.gif">ǰ15����·���ƣ����������������(����鿴��ϸ��Ϣ)</td>
    <td width="93" align="center" background="images/admin_bg_1.gif">ͼƬ</td>
    <td width="95" align="center" background="images/admin_bg_1.gif">ɾ��</td>
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
response.write ("<font color=red >��</font>")
else
response.write ("<font color=red >��</font>")
end if
response.write(" <a href=""../Xl/Xl_"&rs2("id")&".html"" target=""_blank"">"&trim(rs2("x_name"))&"</a>")
if rs2("user")<>"" then
response.write("<font color=green>("&rs2("User")&"�û�����)</font>")
End If
response.write("</td><td align=center>")
if instr(rs2("x_jingdiantupian"),"system/uploadimages")>0 then
response.Write("<font color=#ff0000><a title='��ͼ��ɾ����·��ͼƬҲ����ɾ��'>��ͼ</a></font>")
else
response.write("<a title='��ͼƬ��ͼƬ���ⲿͼƬ'>��ͼ</a>")
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end if
if instr(img,"XlUploadImages/")>0 then
Set fso = CreateObject("Scripting.FileSystemObject")
Set f1 = fso.getfile(server.mappath("XlUploadImages/"&img))
f2.delete
set fso=nothing
set f1=nothing
end if
conn.execute("delete from xianlu where id="&id)
response.write("<script>alert('ɾ�������ɹ�����ȷ���������룡');location='admin_addxl.asp?action=del';</script>")
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
    <td width="477" height="30" background="images/admin_bg_1.gif">ǰ15����·���ƣ����������������(����鿴��ϸ��Ϣ)</td>
    <td width="196" height="30" background="images/admin_bg_1.gif">��·״̬</td>
    <td width="89" background="images/admin_bg_1.gif">����ʶ</td>
    <td width="94" background="images/admin_bg_1.gif">����html</td>
    <td width="56" background="images/admin_bg_1.gif" bgcolor="#f5f5f5">�༭</td>
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
response.write ("<font color=red >��</font>")
else
response.write ("<font color=red >��</font>")
end if
%>
    <a href="../Xl/Xl_<%=er("id")%>.html" target="_blank"><%=er("x_name")%></a><%if er("user")<>"" then
response.write("<font color=green>("&er("User")&"�û�����)</font>")
End If%></td>
    <td align="center"><%
if er("User")<>"" then
if trim(er("Audit"))="False" then
response.write ("<table><tr><form name=formAudit id =formAudit method=post action=AuditOk.asp><td><font color=red >�û�����(δ���) </font><input name='XId' type='hidden' id='XId' value='"&er("Id")&"'><input name='UserName' type='hidden' id='UserName' value='"&er("User")&"'><input type=button name=Submit value=��� onClick=checkAudit();></td></form></tr></table>")
else
response.write ("<font color=Green >�û�����(�����)</font>")
end if
Else
response.write ("<font color=orange>����Ա����</font>")
End if
%></td>

    <td align="center"><%=er("x_leiid")%></td>
    <td align="center"><a href=make_Xllist.asp?id=<%=er("id")%>>����</a></td>
    <td align="center"><a href="admin_addxl.asp?action=editok&id=<%=er("id")%>" title='�༭'>�༭</a></td>
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
	alert("����,���ܽ�����ˣ�");
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
alert("��������д���������");
return false;
}
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=editok1" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="red">�༭��·</font></b></td>
    </tr>
  <tr>
    <td width="204" height="25" align="center" bgcolor="#f5f5f5">��·���ƣ�</td>
    <td width="714">��
      <input name="ta" type="text" id="ta4" value="<%=rs("x_name")%>" size="50">
      <input name="xid" type="hidden" value="<%=rs("id")%>"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ۣ�</td>
    <td>��
    <input name="tb" type="text" id="tb" value="<%=rs("x_baojia")%>" size="15">    </td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ͣ�</td>
    <td>��
    <input name="tc" type="text" id="tc" value="<%=rs("x_leixun")%>" size="15"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·���</td>
    <td>��
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
    <td height="25" align="center" bgcolor="#f5f5f5">�ö������</td>
    <td>��
      <select name="x_top">
        <option value="0" <%if trim(rs("x_top"))=0 then response.write("selected")%>>���ö�</option>
        <option value="1" <%if trim(rs("x_top"))=1 then response.write("selected")%>>�á���</option>
      </select></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5">��·ʱ�䣺</td>
    <td>��
    <input name="te" type="text" id="te" value="<%=rs("x_shijian")%>" size="20">    </td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">�г̰��ţ�</td>
    <td height="110">��
    <textarea name="tf" cols="60" rows="6" id="tf"><%=rs("x_anpai")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��·;�����㣺</td>
    <td height="110">��
    <textarea name="tg" cols="60" rows="6" id="tg"><%=rs("x_jingdian")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��·���г�˵����</td>
    <td height="110">��
    <textarea name="th" cols="60" rows="6" id="th"><%=rs("x_shuoming")%></textarea></td>
  </tr>
  <tr>
    <td height="110" align="center" bgcolor="#f5f5f5">��������ע��</td>
    <td height="110">��
      <textarea name="tk" cols="60" rows="6" id="tk"><%=rs("x_zhushi")%></textarea></td>
  </tr>
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5">��·����ͼƬ��</td>
    <td>��    
	<input name="ttt" type="file" id="ttt" size="40"><input name="rimg" type="hidden" value="<%=rs("x_jingdiantupian")%>">    </td>
  </tr>
  <tr>
    <td height="36" align="center" bgcolor="#f5f5f5">ԭͼƬ�����</td>
    <td height="36"><%
if instr(rs("x_jingdiantupian"),"XlUploadImages/")=0 then
response.write ("�����ڲ�ͼƬ��ͼƬ���ⲿ�����������ϴ��ڲ�ͼƬ�����Ǵˣ���<br />����ǰͼƬ��ַ��")
response.write ("<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a>")
else
response.write("���ڲ�ͼƬ��ַ��<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a><br />��Ҫɾ����ͼƬֻҪ�����ϴ������������򱣳�ͼƬ���䡣")
end if
	%></td>
  </tr>
  <tr>
    <td height="24" colspan="2">����*�ϴ��ļ�����Ϊ��gif,jpg,bmp����С<2M����ͼƬ���������Ϊ����д�</td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="ȷ �� �� ��"></td>
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
ta=replace(trim(upload.Form("ta")),"'","��")
tb=replace(trim(upload.Form("tb")),"'","��")
tc=replace(trim(upload.Form("tc")),"'","��")
td=replace(trim(upload.Form("td")),"'","��")
te=replace(trim(upload.Form("te")),"'","��")
tf=replace(trim(upload.Form("tf")),"'","��")
tg=replace(trim(upload.Form("tg")),"'","��")
th=replace(trim(upload.Form("th")),"'","��")
tk=replace(trim(upload.Form("tk")),"'","��")
x_top=trim(upload.form("x_top"))
img=trim(upload.form("rimg"))
IDstring="Gemisum"&date & time
IDstring=Replace(IDstring,"-","")
IDstring=Replace(IDstring,":","")
pthString="XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if instr(img,pthstring)=0 then
response.write ("�����ڲ�ͼ������ɾ����")
else
img1=replace(img,"XlUploadImages/","")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.getfile(server.mappath("XlUploadImages/"&img1))
f2.delete
conn.execute("update xianlu set x_jingdiantupian='' where id="&id)
end if
if file.filesize>2097152 then
set file=nothing
response.write("<script>alert('�ϴ�ͼƬ�Ĵ�С���ܴ���2M������2097152�ֽڣ�');history.back(1);</script>")
else
FileTpe=Mid(file.filename,Len(file.filename)-2)
if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
response.write("<script>alert('�ϴ�ͼƬ��ʽֻ��Ϊ��JPG,BMP,GIF��');history.back(1);</script>")
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
response.write("<script>alert('����·�༭�޸���ɣ���ȷ���������룡');location='admin_addxl.asp?action=editok&id="&id&"';</script>")
end sub
%>