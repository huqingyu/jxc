<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>window.location.href='../userInfo/Xl_login.asp?id="&id&"';</script>"
  Response.End
end if

dim id
id=trim(Request("id"))
%>
<!--#include virtual="common/conn.asp" -->
<!--#include virtual="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/common.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />
<title><%=webname%>--��дԤ����Ϣ</title>

</head>
<body>

<script>
function ff(tt){
tt.focus();
}
function showmm(dd){
if(dd.style.display=="none"){
dd.style.display="";
}else{
dd.style.display="none";
}
}
function checkform(){
if(form1.textfield3.value==''){
form1.textfield3.focus();
return false;
}
if(form1.textfield4.value==''){
form1.textfield4.focus();
return false;
}
if(form1.textfield9.value==''){
form1.textfield9.focus();
return false;
}
if(form1.textfield16.value==''){
alert("����д����");
form1.textfield16.focus();
return false;
}
if(form1.textfield19.value=='���ѡ������'){
alert("����д��������");
form1.textfield19.focus();
return false;
}
if(form1.textfield20.value=='���ѡ������'){
alert("����д��������");
form1.textfield20.focus();
return false;
}
}
</script>
<script src="../js/indexdatejs.js"></script>
<!--#include file="../top.asp" -->
<div id="J_page" class="w980 center">
<br /><br /><br />

<form name="form1" method="post" action="giveme_ok.asp" onSubmit="return checkform();">
<%
if id="" or not IsNumeric(id) then
Response.Redirect "error.asp?errormsg=<li> �����ڵ�λ��:��</li><br><li> �����ڵ�λ��:���ӽ��룡</li>"
end if
set rs=server.createobject("adodb.recordset")
sql="select id,x_name,x_leixun,x_baojia from xianlu where id=" +id
rs.open sql,conn,1,1
if rs.eof or rs.bof then
Response.Redirect "error.asp?errormsg=<li>�������Ϸ���</li><br><li> �����ڵ�λ��: �����ڵ�λ��:��</li>"
end if

set rst=server.CreateObject("adodb.recordset")
rst.open "select * from [userb] where username='"&request.cookies("Gemisum")("username")&"' ",conn,1,1
%>                
<table border=0 align="center" cellPadding=0 >
	<tr>
                    <td><table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                        <tr>
                          <td height=30 align=center background=images/topbar_bg.gif><strong><font color=#EC5B2B> �����ڵ�λ��: �����ڵ�λ��:��[<%=rs("x_leixun")%>]-<%=rs("x_name")%></font></strong> <input name=x_baojia type=hidden id="x_baojia" value=<%=rs("x_baojia")%> ></td>
                        </tr>
                      </table>
                        <table id=zy width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td width="87" height=30 align=center>�ա�������</td>
                            <td width="139"  align=left><input name=textfield3 type=text onMouseOver='ff(this);' value="<%=rst("name")%>" size=15>
                                <input type=hidden name=textfield size=10 value=<%=rst("id")%>></td>
                            <td width="121" align=center>���ڵ�ַ��</td>
                            <td width="216" align=left><input name=textfield4 type=text onMouseOver='ff(this);' value="<%=rst("address")%>" size=30></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>�硡������</td>
                            <td align=left><input name=textfield9 type=text title=' �����ڵ�λ��:��' onMouseOver='ff(this);' value="<%=rst("telphone")%>" size=15></td>
                            <td align=center>����������</td>
                            <td align=left><input type=text name=textfield16 size=10 onMouseOver='ff(this);' title='ֻ��������'>
                                <input type=hidden name=textfield2 value=<%=rs("x_name")%>></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>��Ҫ���Σ�</td>
                            <td align=left><select name=textfield15>
                                <option value=��Ҫ selected>��Ҫ</option>
                                <option value=����Ҫ>����Ҫ</option>
                                <option value=���>���</option>
                            </select></td>
                            <td align=center>ϣ��ƴ�ţ�</td>
                            <td align=left><select name=textfield17>
                                <option value=ϣ�� selected>ϣ��</option>
                                <option value=��ϣ��>��ϣ��</option>
                                <option value=����ν>����ν</option>
                            </select></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>Ԥ��ʱ�䣺</td>
                            <td align=left><input type=text name=textfield18 size=20 readonly value='<%=now()%>'></td>
                            <td align=center>�������ڣ�</td>
                            <td align=left><input type=text name=textfield19 size=20 onfocus="javascript:setday(this)" title='��ʽ��xxxx/xx/xx��xxxx-xx-xx��xxxx xx xx' value='���ѡ������'></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>�������ڣ�</td>
                            <td align=left><input type=text name=textfield20 size=20 onfocus="javascript:setday(this)" title='��ʽ��xxxx/xx/xx��xxxx-xx-xx��xxxx xx xx' value='���ѡ������'></td>
                            <td align=center>�������</td>
                            <td align=left><input name=textfield23 type=text size=30 onMouseOver='ff(this);' title=' �����ڵ�λ��:'></td>
                          </tr>
                        </table>
                        <table border=0 cellpadding=0 cellspacing=0>
                          <tr>
                            <td height=4></td>
                          </tr>
                        </table>
                        <table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td width=567 height=30 align=center background=images/topbar_bg.gif><strong><font color=#EC5B2B> �����ڵ�λ��:, �����ڵ�λ��: �����ڵ�λ��: �����ڵ�λ��:��Ϣ��</font></strong></td>
                          </tr>
                        </table>
                        <table id=qt width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9 >
                          <tr>
                            <td width=72 height=30 align=center>���֤��</td>
                            <td height=30 align=left><input name=textfield13 type=text onMouseOver='ff(this);' value="<%=rst("idcard")%>" size=16>
                            </td>
                            <td height=30 align=center>�������룺</td>
                            <td height=30 align=left><input name=textfield14 type=text onMouseOver=ff(this); value="<%=rst("zip")%>" size=10>
                            </td>
							<td height=30 width=81 align=center>�����ʼ���</td>
                            <td width="119" height=30 align=left><input name=textfield5 type=text onMouseOver=ff(this); value="<%=rst("email")%>" size=16></td>
                          </tr>
                          <tr>
                            <td height=80 align=center>������ע��</td>
                            <td height=80 colspan=5 align=left><textarea name=textfield22 rows=4 cols=50 onMouseOver=ff(this);></textarea>
                            </td>
                          </tr>
                        </table>
                        <table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td height=35 align=center  background=images/topbar_bg.gif><input type=submit name=Submit value=ȷ��Ԥ��>
                                ��������
                                <input type=reset name=Submit2 value=�������></td>
                          </tr>
                      </table></td>
                  </tr>

</table>
<input name=textfield21 type="hidden" />

<input type=hidden name=textfield6 />
<input type=hidden name=textfield7 />
<input type=hidden name=textfield8 />
<input type=hidden name=textfield10 />
<input type=hidden name=textfield11 />
<input name=textfield12 type="hidden" />

</tr>
 </form>
<% 
rst.close 
rs.close 
%>
<!--#include file="../foot.asp" -->
</div>
</body>
</html>