<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('�㲻����ҵ��Ա��');history.go(-1);</script>"
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub Add
%>
<script>
function check(){
if(form1.x_Name.value=='' || form1.x_Baojia.value=='' || form1.x_Leixing.value=='' || form1.x_Time.value=='' || form1.x_Anpai.value=='' || form1.x_Jingdiang.value=='' || form1.x_Xingcheng.value=='' || form1.x_Beizhu.value==''){
alert("��������д���������");
return false;
}
}
</script>

<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <form action="?action=addok" method="post" name="form1" onSubmit="return check();">
    <tr>
      <td height="30" colspan="2" align="center" background="Images/topBar_bg.gif"><b><font color="red">��ҵ�û������·</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="208" height="25" align="center" bgcolor="#f5f5f5">��·���ƣ�</td>
      <td width="513" bgcolor="#FFFFFF">��
          <input name="x_Name" type="text" id="x_Name" size="50">
          <input name="User" type="hidden" id="User" value="<%=request.Cookies("Gemisum")("username")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">��·���ۣ�</td>
      <td>��
          <input name="x_Baojia" type="text" id="x_Baojia" size="15">
        ����ͳһ����ʽ��XXXRMB/�ˡ�XXX�����/��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">��·���ͣ�</td>
      <td>��
          <input name="x_Leixing" type="text" id="x_Leixing" size="15">
        �磺�����ߡ���Ʒ�� �� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">��·���</td>
      <td>��
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
        ��������û�����ͣ����Ƚ��������������·</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">�Ƿ��ö���</td>
      <td> ��
          <select name="x_Top" id="x_Top">
            <option value="0" selected>���ö�</option>
            <option value="1">�á���</option>
          </select>
        �ö��󣬴���·������ʾ����ǰ��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="center" bgcolor="#f5f5f5">��·ʱ�䣺</td>
      <td>��
          <input name="x_Time" type="text" id="x_Time" size="20">
        ����ͳһ����ʽ����������Ρ����������� �� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">�г̰��ţ�</td>
      <td height="110">��
          <textarea name="x_Anpai" cols="60" rows="6" id="x_Anpai">��</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">��·;�����㣺</td>
      <td height="110">��
          <textarea name="x_Jingdiang" cols="60" rows="6" id="x_Jingdiang">��</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">��·���г�˵����</td>
      <td height="110">��
          <textarea name="x_Xingcheng" cols="60" rows="6" id="x_Xingcheng">��</textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="110" align="center" bgcolor="#f5f5f5">��������ע��</td>
      <td height="110">��
          <textarea name="x_Beizhu" cols="60" rows="6" id="x_Beizhu">��</textarea></td>

    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" align="center" bgcolor="#f5f5f5">��·����ͼƬ��</td>
      <td>��
          <input name="ttt" type="file" id="ttt" size="40">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" bgcolor="#F5F5F5"><div align="center">������(ǰ̨��ʾ):</div></td>
      <td height="24">��
        <input name="x_Fabuzhe" type="text" id="x_Fabuzhe" size="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="24" colspan="2">����*�ϴ��ļ�����Ϊ��gif,jpg,bmp����С<2M����ͼƬ���������Ϊ����д�</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="ȷ �� �� ��"></td>
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
response.Write "<script language='javascript'>alert('��������ӳɹ�,��ȴ�����Ա���!');window.location.href='UserInfo.asp';</script>"
response.End
end sub
Sub Edit
dim UserName
UserName=request.Cookies("Gemisum")("username")
set er=server.createobject("adodb.recordset")
ersql="select id,x_name,x_jingdiantupian,x_top,User,Audit from xianlu where User='"&UserName&"' order by x_top desc"
er.open ersql,conn,1,1
if er.eof then
response.write "�㻹û�з����κ���·��Ϣ!"
Else
%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="401" height="30" background="Images/topBar_bg.gif">�������㷢������·��Ϣ</td>
    <td width="119" height="30" background="Images/topBar_bg.gif">��·״̬</td>
    <td width="76" background="Images/topBar_bg.gif">ɾ��</td>
    <td width="48" background="Images/topBar_bg.gif" bgcolor="#f5f5f5">�༭</td>
  </tr>
<%
do while not er.eof
%>
  <tr bgcolor="#FFFFFF">
    <td height="24">
<%
if trim(er("x_top"))=1 then
response.write ("<font color=red >��</font>")
else
response.write ("<font color=red >��</font>")
end if
%>
    <a href="Xl/Xl_<%=er("id")%>.html" target="_blank"><%=er("x_name")%></a></td>
    <td align="center"><%
if er("Audit")="True" then
response.write ("<font color=Green >ͨ�����</font>")
else
response.write ("<font color=Red >��δ���</font>")
end if
%></td>
    <td align="center"><a href="User_addxl.asp?action=delok&img=<%=er("x_jingdiantupian")%>&id=<%=er("id")%>">ɾ��</a></td>
    <td align="center"><a href="User_addxl.asp?action=editok&id=<%=er("id")%>" title='�༭'>�༭</a></td>
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end if
if instr(img,"Admin/XlUploadImages/")>0 then
Set fso = CreateObject("Scripting.FileSystemObject")
Set f1 = fso.getfile(server.mappath("Admin/XlUploadImages/"&img))
f2.delete
set fso=nothing
set f1=nothing
end if
conn.execute("delete from xianlu where id="&id)
response.write("<script>alert('ɾ�������ɹ�����ȷ���������룡');location='User_addxl.asp?action=Edit';</script>")
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
alert("��������д���������");
return false;
}
}
</script>
<br><br><br>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<form action="?action=editok1" method="post" enctype="multipart/form-data" name="form1" onSubmit="return check();">
  <tr>
    <td height="30" colspan="2" align="center" background="Images/topBar_bg.gif"><b><font color="red">�༭��·</font></b></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td width="204" height="25" align="center" bgcolor="#f5f5f5">��·���ƣ�</td>
    <td width="714" bgcolor="#FFFFFF">��
      <input name="ta" type="text" id="ta4" value="<%=rs("x_name")%>" size="50">
      <input name="xid" type="hidden" value="<%=rs("id")%>"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ۣ�</td>
    <td>��
    <input name="tb" type="text" id="tb" value="<%=rs("x_baojia")%>" size="15">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">��·���ͣ�</td>
    <td>��
    <input name="tc" type="text" id="tc" value="<%=rs("x_leixun")%>" size="15"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
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
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">�ö������</td>
    <td>��
      <select name="x_top">
        <option value="0" <%if trim(rs("x_top"))=0 then response.write("selected")%>>���ö�</option>
        <option value="1" <%if trim(rs("x_top"))=1 then response.write("selected")%>>�á���</option>
      </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center" bgcolor="#f5f5f5">��·ʱ�䣺</td>
    <td>��
    <input name="te" type="text" id="te" value="<%=rs("x_shijian")%>" size="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">�г̰��ţ�</td>
    <td height="110">��
    <textarea name="tf" cols="60" rows="6" id="tf"><%=rs("x_anpai")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">��·;�����㣺</td>
    <td height="110">��
    <textarea name="tg" cols="60" rows="6" id="tg"><%=rs("x_jingdian")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">��·���г�˵����</td>
    <td height="110">��
    <textarea name="th" cols="60" rows="6" id="th"><%=rs("x_shuoming")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="110" align="center" bgcolor="#f5f5f5">��������ע��</td>
    <td height="110">��
      <textarea name="tk" cols="60" rows="6" id="tk"><%=rs("x_zhushi")%></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="24" align="center" bgcolor="#f5f5f5">��·����ͼƬ��</td>
    <td>��    
	<input name="ttt" type="file" id="ttt" size="40"><input name="rimg" type="hidden" value="<%=rs("x_jingdiantupian")%>">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="36" align="center" bgcolor="#f5f5f5">ԭͼƬ�����</td>
    <td height="36"><%
if instr(rs("x_jingdiantupian"),"Admin/XlUploadImages/")=0 then
response.write ("�����ڲ�ͼƬ��ͼƬ���ⲿ�����������ϴ��ڲ�ͼƬ�����Ǵˣ���<br>����ǰͼƬ��ַ��")
response.write ("<a href="&rs("x_jingdiantupian")&" target=_blank>"&rs("x_jingdiantupian")&"</a>")
else
response.write("���ڲ�ͼƬ��ַ��<a href=admin/"&rs("x_jingdiantupian")&" target=_blank>admin/"&rs("x_jingdiantupian")&"</a><br>��Ҫɾ����ͼƬֻҪ�����ϴ������������򱣳�ͼƬ���䡣")
end if
	%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="24" colspan="2">����*�ϴ��ļ�����Ϊ��gif,jpg,bmp����С<2M����ͼƬ���������Ϊ����д�</td>
  </tr>
  <tr bgcolor="#FFFFFF">
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
pthString="admin/XlUploadImages/"
set file=upload.file("ttt")
if file.filesize>0 then
if instr(img,pthstring)=0 then
response.write ("�����ڲ�ͼ������ɾ����")
else
img1=replace(img,"admin/XlUploadImages/","")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.getfile(server.mappath("admin/XlUploadImages/"&img1))
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
response.write("<script>alert('����·�༭�޸���ɣ���ȷ���������룡');location='User_addxl.asp?action=editok&id="&id&"';</script>")
end sub

%>
</body>
</html>