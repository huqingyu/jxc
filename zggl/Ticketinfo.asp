<!--#include file="Connection.asp"-->
<!--#include file="common/webconfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--��Ʊ��ϸ��Ϣ</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>

<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212" valign="top"><!--#include file="pw_left.asp" --></td>
    <td valign="top"><div align="center">
      </div>      
      <br><br>
<%
dim action
action=trim(request("action"))
select case action
case ""
Ticketinfo()
case "Giveme"
Giveme()
case "Giveme_ok"
Giveme_ok()
case else
response.write("<script>alert(' �����ڵ�λ��:��');history.back(1);</script>")
end select
sub Ticketinfo()%>
<table width="350" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
<%
dim id
id=request("id")
if id="" then
response.write"<script>alert(""�Ƿ�����!"");location.href=""Ticket.asp"";</script>"
response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from dingbiao where id="&id&" ",conn,1,1
if err.number<>0 then
response.write " �����ڵ�λ��:��"
end if
%>
<form name="form1" method="post" action="?action=Giveme&id=<%=id%>">
<tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#ff0000"><b>�鿴��Ʊ��Ϣ</b></font></div></td>
        </tr>
        <tr>
          <td width="100" height="25" bgcolor="#ebebeb"><div align="right">���չ�˾��</div></td>
          <td width="244"><%=rs("hankonggongsi")%></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
          <td><% if rs("cctype")="1" then 
response.write "���ں���"
else
response.write "���ʺ���"
end if
%></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">���Σ�</div></td>
          <td><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">����/������</div></td>
          <td><%=rs("type")%></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
          <td><%=rs("hdtype")%></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">�۸�</div></td>
          <td><font color="#FF0000">��<%=rs("shichanjia")%></font></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#ebebeb"><div align="right">��Ч���ڣ�</div></td>
          <td><%=rs("date")%></td>
        </tr>
        <tr>
          <td height="100" bgcolor="#ebebeb"><div align="right">��ע��</div></td>
          <td><%=rs("bz")%></td>
        </tr>
        <tr>
          <td height="35" colspan="2"><div align="center">
            <input type="submit" name="Submit" value=" Ԥ �� ">
          </div></td>
        </tr>
</form>
<%
rs.close
set rs=nothing
%>
</table>

<% End Sub
Sub Giveme()
%>
<script language="javascript">
function checkform(){
if(form2.name.value==''){
alert(" �����ڵ�λ��:��");
form2.name.focus();
return false;
}
if(form2.textfield.value=='���ѡ������'){
alert(" �����ڵ�λ��:��");
form2.textfield.focus();
return false;
}
if(form2.textfield.value=='���ѡ������'){
alert(" �����ڵ�λ��:��");
form2.textfield.focus();
return false;
}
if(form2.tel.value==''){
alert(" �����ڵ�λ��:��");
form2.tel.focus();
return false;
}
if(form2.email.value==''){
alert("���������E-mail��");
form2.email.focus();
return false;
}
if(form2.add.value==''){
alert(" �����ڵ�λ��:��");
form2.add.focus();
return false;
}
}
</script>
<table width="350" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
<form name="form2" method="post" action="?action=Giveme_ok" onSubmit="return checkform();">
<%
dim id
id=request("id")
if id="" then
response.write"<script>alert(""�Ƿ�����!"");location.href=""Ticket.asp"";</script>"
response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from dingbiao where id="&id&" ",conn,1,1
if err.number<>0 then
response.write " �����ڵ�λ��:��"
end if
%>
  <tr>
    <td height="30" colspan="3" background="Images/topBar_bg.gif"><div align="center"><font color="#ff0000"><b>Ԥ����Ʊ</b></font></div></td>
  </tr>
  <tr>
    <td width="100" height="25" bgcolor="#ebebeb"><div align="right">���չ�˾��</div></td>
    <td colspan="2"><%=rs("hankonggongsi")%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
    <td colspan="2"><% if rs("cctype")="1" then 
response.write "���ں���"
else
response.write "���ʺ���"
end if
%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">���Σ�</div></td>
    <td colspan="2"><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">����/������</div></td>
    <td colspan="2"><%=rs("type")%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
    <td colspan="2"><%=rs("hdtype")%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�۸�</div></td>
    <td colspan="2"><font color="#FF0000">��<%=rs("shichanjia")%></font></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">��Ч���ڣ�</div></td>
    <td colspan="2"><%=rs("date")%></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#ebebeb"><div align="right">��ע��</div></td>
    <td colspan="2"><%=rs("bz")%></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">��ϵ�ˣ�</div></td>
    <td colspan="2"><input name="name" type="text" id="name" size="15">
      <input name="hdname" type="hidden" id="hdname" value="<%=rs("chufachenshi")%>-<%=rs("mudichenshi")%>">
      <input name="hdid" type="hidden" id="hdid" value="<%=rs("id")%>">
      <input name="m_yudingtime" type="hidden" id="m_yudingtime" value="<%=date()%>"></td>
    </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">Ʊ����</div></td>
    <td width="40" height="5"><select name="piao" id="piao">
      <option value="1" selected>1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
    </select></td>
    <td width="202"><select name="piaotype" id="piaotype">
      <option value="��ͯ">��ͯ</option>
      <option value="����" selected>����</option>
      <option value="������">������</option>
    </select></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�˲����ͣ�</div></td>
    <td colspan="2"><select name="cctype" id="cctype">
      <option value="���ò�" selected>���ò�</option>
      <option value="�����">�����</option>
      <option value="ͷ�Ȳ�">ͷ�Ȳ�</option>
    </select></td>
    </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�ǻ����ڣ�</div></td>
    <td colspan="2"><input name="textfield" type="text" size="16" onFocus="javascript:setday(this)" value="���ѡ������"></td>
  </tr> 
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�������ڣ�</div></td>
    <td colspan="2"><input name="textfield2" type="text" size="16" onFocus="javascript:setday(this)" value="���ѡ������"></td>
  </tr>    
<tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">��ϵ�绰��</div></td>
    <td colspan="2"><input name="tel" type="text" id="tel" size="20"></td>
  </tr>  
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">�����ʼ���</div></td>
    <td colspan="2"><input name="email" type="text" id="email" size="20"></td>
  </tr>
  <tr>
    <td height="25" bgcolor="#ebebeb"><div align="right">��ϵ��ַ��</div></td>
    <td colspan="2"><input name="add" type="text" id="add" size="30"></td>
  </tr>
<tr>
    <td height="35" colspan="3"><div align="center">
      <input type="submit" name="Submit2" value=" Ԥ �� ">
    </div></td>
  </tr>
  <%
rs.close
set rs=nothing
%>
</form>
</table>
<br>
<%
End Sub
Sub Giveme_ok()
dim name1,hdname,hdid,piao,piaotype,cctype,textfield,textfield2,tel,email,add
name1=request("name")
hdname=request("hdname")
m_yudingtime=request("m_yudingtime")
hdid=request("hdid")
piao=request("piao")
piaotype=request("piaotype")
cctype=request("cctype")
textfield=request("textfield")
textfield2=request("textfield2")
tel=request("tel")
email=request("email")
add=request("add")
set rs=server.createobject("adodb.recordset")
sql="select * From Givemejipiao"
rs.open sql,conn,3,3
rs.addnew
rs("name")=name1
rs("hdname")=hdname
rs("m_yudingtime")=m_yudingtime
rs("hdid")=hdid
rs("piao")=piao
rs("piaotype")=piaotype
rs("cctype")=cctype
rs("textfield")=textfield
rs("textfield2")=textfield2
rs("tel")=tel
rs("email")=email
rs("add")=add
rs.update
rs.close
response.Write "<script language='javascript'>alert(' �����ڵ�λ��:֧��, �����ڵ�λ��:');window.location.href='Ticket.asp';</script>"
response.End
End Sub
%></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

<!--#include file="foot.asp" -->

