
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
<title>�༭����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<script language="JavaScript">
function CheckForm()
{
	if (document.myform.d_name2.value.length == 0)
 {
		alert("�������û���!");
		document.myform.d_name2.focus();
		return false;
	}
	if (document.myform.add2.value.length == 0)
 {
		alert("�����뵼����ϵ��ַ!");
		document.myform.add2.focus();
		return false;
	}		
	if (document.myform.tel2.value.length == 0)
 {
		alert("�����뵼����ϵ�绰!");
		document.myform.tel2.focus();
		return false;
	}		
			if (document.myform.nianling2.value.length == 0)
 {
		alert("�����뵼�ε�����!.");
		document.myform.nianling2.focus();
		return false;
	}		
			if (document.myform.mail2.value.length == 0)
 {
		alert("�����뵼�ε�E-MAIL!.");
		document.myform.mail2.focus();
		return false;
	}		
			if (document.myform.info2.value.length == 0)
 {
		alert("�����뵼�ε���Ϣ!");
		document.myform.info2.focus();
		return false;
	}		
		return true;
}
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
sl="delete * from daoyou where id = " + id
conn.Execute sl
conn.close
response.Write "<script language='javascript'>alert('�õ��μ�¼ɾ���ɹ���');window.location.href='Admin_Emddaoyou.asp';</script>"
response.End
end if
%>
<%
dim photo
if action="edit" then
set rs=server.createobject("adodb.recordset")
sql="select * from daoyou where id=" +id
rs.open sql,conn
%>
<form name="form1" method="post" action="admin_daoyoueditdel.asp?id=<%=rs("id")%>&action=editok&action1=ok" ID=Form1>
  <br /><br /><br />
  <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
    <tr>
      <td height="35" colspan="3" background="images/admin_bg_1.gif"><div align="center"><font color="#FF0000"><b>�޸�<%=rs("d_name")%>���ε�����</b></font></div></td>
    </tr>
    <tr>
      <td width="207" height="25" align="right" bgcolor="#ebebeb">������&nbsp;</td>
      <td colspan="2"><input name="d_name2" type="text" id="d_name2" value="<%=rs("d_name")%>"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�Ա�&nbsp;</td>
      <td colspan="2"><select name="sex2" id="sex2">
        <option value="1" <%if rs("sex")=1 then%>selected<%end if%> >��</option>
        <option value="0" <%if rs("sex")=0 then%>selected<%end if%> >Ů</option>
            </select>
      </td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">���䣺&nbsp;</td>
      <td colspan="2"><input name="nianling2" type="text" id="nianling23" value="<%=rs("nianling")%>">
      </td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�ȼ���&nbsp;</td>
      <td colspan="2"><input type="radio" name="vip2" value="1" <%if rs("vip")=1 then%>checked<%end if%>>
        ��ͨ��Ա
          <input type="radio" name="vip2" value="2" <%if rs("vip")=2 then%>checked<%end if%>>
          �߼���Ա
          <input type="radio" name="vip2" value="3" <%if rs("vip")=3 then%>checked<%end if%>>
      �����Ա</td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">���壺&nbsp;</td>
      <td colspan="2"><select name="mingzu2">
        <option value="a" <%if rs("mingzu")="a" then%>selected<%end if%> >��</option>
        <option value="b" <%if rs("mingzu")="b" then%>selected<%end if%> >��</option>
        <option value="c" <%if rs("mingzu")="c" then%>selected<%end if%> >��</option>
        <option value="d" <%if rs("mingzu")="d" then%>selected<%end if%> >ά</option>
        <option value="e" <%if rs("mingzu")="e" then%>selected<%end if%> >��</option>
        <option value="f" <%if rs("mingzu")="f" then%>selected<%end if%> >��</option>
        <option value="δ֪" <%if rs("mingzu")="δ֪" then%>selected<%end if%> >δ֪</option>
      </select></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�Ƿ��Ƽ���</td>
      <td colspan="2"><input type="radio" name="tuijian2" value="1" <%if rs("tuijian")=1 then%>checked<%end if%>>
        �ǡ���
          <input type="radio" name="tuijian2" value="0" <%if rs("tuijian")=0 then%>checked<%end if%>>
      ��</td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">��ϵ�绰��&nbsp;</td>
      <td colspan="2"><input name="tel2" type="text" id="tel2" value="<%=rs("tel")%>"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">��ϵ��ַ��&nbsp;</td>
      <td colspan="2"><input name="add2" type="text" id="add23" value="<%=rs("add")%>"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">E-mail��&nbsp;</td>
      <td colspan="2"><input name="mail2" type="text" id="mail23" value="<%=rs("mail")%>"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">������ϵ��ʽ��&nbsp;</td>
      <td colspan="2"><input name="lianxi2" type="text" id="lianxi23" value="<%=rs("lianxi")%>">
      </td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�ó���·��&nbsp;</td>
      <td colspan="2"><input name="xianlu2" type="text" id="xianlu2" value="<%=rs("xianlu")%>" size="50"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�������ԣ�&nbsp;</td>
      <td colspan="2"><input name="lang2" type="text" id="lang2" value="<%=rs("lang")%>" size="50"></td>
    </tr>
    <tr>
      <td height="90" align="right" bgcolor="#ebebeb">���ܣ�&nbsp;</td>
      <td height="90" colspan="2"><textarea name="info2" cols="50" rows="5" id="textarea3"><%=rs("info")%></textarea>
      </td>
    </tr>
    <tr>
      <td height="90" align="right" bgcolor="#ebebeb">��ע��&nbsp;</td>
      <td height="90" colspan="2"><textarea name="back2" cols="50" rows="5" id="textarea4"><%=rs("back")%></textarea>
      </td>
    </tr>
    <tr>
      <td height="11" align="right" bgcolor="#ebebeb">��Ƭ��(����ͼ)&nbsp;</td>
      <td width="293" height="11" valign="middle">
      <input name="img2" type="text" id="img23" value="<%=rs("img")%>" size="30">
      120*130 </td>
      <td width="124" valign="middle"><div align="center">
          <input type="button" name="Button3" class="button01-out" value="� ��" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr>
      <td height="12" align="right" bgcolor="#ebebeb">��Ƭ��(������)&nbsp;</td>
      <td height="12" valign="middle">      <input name="poho2" type="text" id="poho23" value="<%=rs("poho")%>" size="30">
      249*295</td>
      <td valign="middle"><div align="center">
          <input type="button" name="Button22" class="button01-out" value="� ��" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr align="center">
      <td height="31" colspan="4">
        <input type="submit" name="Submit3" value="ȷ�����" class="button" onClick="return CheckForm()">
        <input type="reset" name="Submit22" value="�������" class="button">
      </td>
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
sql="select * from daoyou where id=" +id
rs.open sql,conn,3,3
dim d_name1,sex1,nianling1,vip1,tuijian1,mingzu1,tel1,add1,mail1,lianxi1,info1,back1,img1,poho1
d_name1=Request("d_name2")
sex1=request("sex2")
nianling1=request("nianling2")
vip1=request("vip2")
tuijian1=request("tuijian2")
mingzu1=request("mingzu2")
tel1=request("tel2")
add1=request("add2")
mail1=request("mail2")
lianxi1=request("lianxi2")
xianlu1=request("xianlu2")
lang1=request("lang2")
info1=request("info2")
back1=request("back2")
img1=request("img2")
poho1=request("poho2")
if img1="" then
img1="images/nophoto.gif"
end if
if poho1="" then
poho1="images/nophoto.gif"
end if

rs("d_name")=d_name1
rs("sex")=sex1
rs("nianling")=nianling1
rs("vip")=vip1
rs("tuijian")=tuijian1
rs("mingzu")=mingzu1
rs("tel")=tel1
rs("add")=add1
rs("mail")=mail1
rs("lianxi")=lianxi1
rs("xianlu")=xianlu1
rs("lang")=lang1
rs("info")=info1
rs("back")=back1
rs("img")=img1
rs("poho")=poho1
rs.update
rs.close
conn.close
response.Write "<script language='javascript'>alert('�õ��μ�¼�༭�ɹ���');window.location.href='Admin_Emddaoyou.asp';</script>"
response.End
end if
%>
<br />
</body>
</html>
