<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="../common/system_code.asp" -->
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#ff0000">�鿴��Ϣ����</font></div></td>
  </tr>
  <tr>
    <td height="84" valign="top"> 
      <table width="95%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr> 
          <td> 
            <div align="right">ѡ��鿴���� 
              <select name="select" class="wenbenkuang" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" ><base target=Right> 
                <option selected>ѡ����Ϣ����</option>
                <option value="viewfk.asp?lx=0" >�鿴��������</option>
                <option value="viewfk.asp?lx=1" >�򵥵�����</option>
                <option value="viewfk.asp?lx=2" >����վ�����</option>
                <option value="viewfk.asp?lx=3" >�Թ�˾�Ľ���</option>
                <option value="viewfk.asp?lx=4" >���к�������</option>
                <option value="viewfk.asp?lx=5" >��ƷͶ��</option>
                <option value="viewfk.asp?lx=6" >����Ͷ��</option>
                <option value="viewfk.asp?lx=7" >������Ϣ</option>
              </select>
            </div>
          </td>
        </tr>
      </table>
      <%sub leixing()
select case rs("fkleixing")
case "1"
response.write "�򵥵�����"
case "2"
response.write "����վ�����"
case "3"
response.write "�Թ�˾�Ľ���"
case "4"
response.write "���к�������"
case "5"
response.write "��ƷͶ��"
case "6"
response.write "����Ͷ��"
end select
end sub
%>
<%'��ʼ��ҳ
dim lx
lx=request.QueryString("lx")
set rs=server.createobject("adodb.recordset")
	  if lx="" or lx=0 then
	  rs.open "select * from Gbook order by fkdate desc",conn,1,1
	  else
	  rs.open "select * from Gbook where fkleixing="&lx&" order by fkdate desc",conn,1,1
	  end if
if not rs.eof then
rs.PageSize =25 'ÿҳ��¼����
result_num=rs.RecordCount '��¼����
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
else
result_num=0
maxpage=0
page=0
end if
if not rs.eof then 
for i=1 to rs.PageSize
%>
      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr bgcolor="#f1f1f1"> 
          <td width="89%" height="25" bgcolor="#f1f1f1" style="padding-left:8px"> 
            <%response.write "�������ͣ�<font color=red>"
		  call leixing()
		  response.write "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�û���<a href=mailto:"&trim(rs("fkemail"))&" title=���û�����IP��ַ�ǣ�"&trim(rs("fkip"))&"><font color=red>"&trim(rs("fkusername"))&"</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ڵأ�"&trim(rs("fklaizi"))&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰��"&trim(rs("fktel"))%></td>
          <td width="11%"> 
            <div align="center"><a href="delfk.asp?id=<%=rs("fkid")%>" onClick="return confirm('��ȷ��ɾ����')">ɾ 
              ��</a></div>
          </td>
        </tr>
        <tr> 
          <td height="41" colspan="2"> 
            <div align="center"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td> 
                    <div align="center"><b><%=trim(rs("fksubject"))%></b></div>
                  </td>
                </tr>
                <tr> 
                  <td><%=trim(rs("fkcontent"))%><br />
                    <div align=right><%="����ʱ�䣺"&rs("fkdate")%></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table><br />
<%rs.movenext      
if rs.EOF then Exit For      
next      
end if      
rs.close      
set rs=nothing      
%>
    </td>
  </tr>
  <tr>
    <td height="30"><div align="center">
        <% call LastNextPage(maxpage,page,result_num) %>
    </div></td>
  </tr>
</table>
</body>
</html>
