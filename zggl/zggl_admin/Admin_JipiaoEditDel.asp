
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>�༭������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<script language="JavaScript">
<!--
function CheckForm()
{
	if (document.form1.hankonggongsi2.value.length == 0)
 {
		alert("�����뺽�չ�˾!");
		document.form1.hankonggongsi2.focus();
		return false;
	}
	if (document.form1.hbh2.value.length == 0)
 {
		alert("�����뺽���!");
		document.form1.hbh2.focus();
		return false;
	}
	if (document.form1.chufachenshi2.value.length == 0)
 {
		alert("�������������!");
		document.form1.chufachenshi2.focus();
		return false;
	}
	if (document.form1.mudichenshi2.value.length == 0)
 {
		alert("������Ŀ�ĵس���!");
		document.form1.mudichenshi2.focus();
		return false;
	}
	if (document.form1.shichanjia2.value.length == 0)
 {
		alert("������۸�!");
		document.form1.shichanjia2.focus();
		return false;
	}
	if (document.form1.date2.value.length == 0)
 {
		alert("��������Чʱ��!");
		document.form1.date2.focus();
		return false;
	}
		return true;
}
///onSubmit="return CheckForm();"
//-->
</script>
<!--#include file="admin_common/conn.asp" -->
<%
dim id,action
id=Request("id")
action=Request("action")
if id="" then
session("errormsg")="�Ҳ���ָ����ID�ţ�"
response.Redirect "error.asp"
else
if action="" then
session("errormsg")="���Ķ�������ȷ���޷���ɣ�"
response.Redirect "error.asp"
end if 
end if
if action="del" then
sl="delete * from dingbiao where id = " + id
conn.Execute sl
conn.close
response.Write "<script language='javascript'>alert('�ú�����Ϣɾ���ɹ���');window.location.href='Admin_Emdjipiao.asp';</script>"
response.End
end if
%>
<%
if action="edit" then
set rs=server.createobject("adodb.recordset")
sql="select * from dingbiao where id=" +id
rs.open sql,conn
%>
<form name="form1" method="post" action="admin_Jipiaoeditdel.asp?id=<%=rs("id")%>&action=editok&action1=ok" ID=Form1>
  <br /><br /><br />
  <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
      <tr>
        <td height="35" colspan="3" background="images/admin_bg_1.gif"><div align="center"><font color="#FF0000"><b>�޸ĺ�����Ϣ</b></font></div></td>
      </tr>
                  <tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
        <td width="76%">���ں���
          <input name="hbtype2" type="radio" value="1" <%if rs("hbtype")="1" then%>checked<%end if%>>
          ���ʺ���
            <input name="hbtype2" type="radio"value="2" <%if rs("hbtype")="2" then%>checked<%end if%>></td>
      </tr>
<tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">���չ�˾��</div></td>
        <td width="76%"><input name="hankonggongsi2" type="text" id="hankonggongsi2" value="<%=rs("hankonggongsi")%>">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">����ţ�</div></td>
        <td><input name="hbh2" type="text" id="hbh2" value="<%=rs("hbh")%>">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�������У�</div></td>
        <td><input name="chufachenshi2" type="text" id="chufachenshi2" value="<%=rs("chufachenshi")%>">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">Ŀ�ĵس��У�</div></td>
        <td><input name="mudichenshi2" type="text" id="mudichenshi2" value="<%=rs("mudichenshi")%>">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
        <td><select name="hdtype2" id="hdtype2">
            <option value="ֱ��" <%if rs("hdtype")="ֱ��" then%>selected<%end if%>>ֱ��</option>
            <option value="ת��" <%if rs("hdtype")="ת��" then%>selected<%end if%>>ת��</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">����/������</div></td>
        <td><select name="type2" id="type2">
            <option value="����" <%if rs("type")="����" then%>selected<%end if%>>����</option>
            <option value="����" <%if rs("type")="����" then%>selected<%end if%>>����</option>
            <option value="����" <%if rs("type")="����" then%>selected<%end if%>>����</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�۸�</div></td>
        <td><input name="shichanjia2" type="text" id="shichanjia2" value="<%=rs("shichanjia")%>" size="10">
            <font color="red">*</font></td>
      </tr>
            <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�˲����ͣ�</div></td>
        <td><select name="cctype2" id="cctype2">
          <option value="1" <%if rs("cctype")="1" then%>selected<%end if%>>���ò�</option>
          <option value="2" <%if rs("cctype")="2" then%>selected<%end if%>>�����</option>
          <option value="3" <%if rs("cctype")="3" then%>selected<%end if%>>ͷ�Ȳ�</option>
        </select></td>
      </tr>
<tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�Ƿ��Ƽ���</div></td>
        <td> ��
            <input name="tuijiang2" type="radio" value="1" <%if rs("tuijiang")="1" then%>checked<%end if%>>
      ��
      <input name="tuijiang2" type="radio" value="0" <%if rs("tuijiang")="0" then%>checked<%end if%>></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">��Чʱ�䣺</div></td>
        <td><input name="date2" type="text" id="date2" value="<%=rs("date")%>">
            <font color="red">����ʽ��YYYY-MM-DD��YYYY-MM-DD��</font></td>
      </tr>
      <tr>
        <td height="90" bgcolor="#ebebeb"><div align="right">��ע��</div></td>
        <td><textarea name="bz2" cols="50" rows="5" id="bz2"><%=rs("bz")%></textarea></td>
      </tr>
      <tr>
        <td height="35" colspan="2"><div align="center">
            <input type="submit" name="Submit" value="�ύ�޸�" onClick="return CheckForm()">
    &nbsp;
            <input type="reset" name="Submit2" value="����">
        </div></td>
      </tr>
    </table>
</form>
<%
rs.close
conn.close
end if
%>
<%
dim action1
action1=request("action1")
if action1="ok" then
set rs=server.createobject("adodb.recordset")
sql="select * from dingbiao where id=" +id
rs.open sql,conn,3,3
dim hankonggongsi1,hbh1,chufachenshi1,mudichenshi1,hdtype1,type1,shichanjia1,cctype1,tuijiang1,date1,bz1

hbtype1=Request("hbtype2")
hankonggongsi1=Request("hankonggongsi2")
hbh1=Request("hbh2")
chufachenshi1=Request("chufachenshi2")
mudichenshi1=Request("mudichenshi2")
hdtype1=Request("hdtype2")
type1=Request("type2")
shichanjia1=Request("shichanjia2")
cctype1=Request("cctype2")
tuijiang1=Request("tuijiang2")
date1=Request("date2")
bz1=Request("bz2")

rs("hbtype")=hbtype1
rs("hankonggongsi")=hankonggongsi1
rs("hbh")=hbh1
rs("chufachenshi")=chufachenshi1
rs("mudichenshi")=mudichenshi1
rs("hdtype")=hdtype1
rs("type")=type1
rs("shichanjia")=shichanjia1
rs("cctype")=cctype1
rs("tuijiang")=tuijiang1
rs("date")=date1
rs("bz")=bz1

rs.update
rs.close
conn.close
response.Write "<script language='javascript'>alert('�ú�����Ϣ�༭�ɹ���');window.location.href='Admin_Emdjipiao.asp';</script>"
response.End
end if
%>
<br />
</body>
</html>
