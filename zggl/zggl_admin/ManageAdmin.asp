
<!--#include file="admin_common/conn.asp" -->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_login.asp';</script>"
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
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#000000">��̨�û�����</font></div>    </td>
  </tr>
  <tr> 
    <td> 
      <br /><table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr> 
          <td width="23%" height="25" bgcolor="f1f1f1"> 
            <div align="center">����Ա</div>          </td>
          <td width="21%" bgcolor="f1f1f1"> 
            <div align="center">�� ��</div>
          </td>
          <td width="31%" bgcolor="f1f1f1"> 
            <div align="center">Ȩ ��</div>
          </td>
          <td width="25%" bgcolor="f1f1f1"> 
            <div align="center">�� ��</div>
          </td>
        </tr>
        <%set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from master order by flag",conn,1,1
        do while not rs.EOF%>
        <form name="form1" method="post" action="saveadmin.asp?action=edit&id=<%=int(rs("id"))%>">
          <tr> 
            <td> 
              <div align="center"> 
                <input name="admin" type="text" size="12" value="<%=trim(rs("name"))%>">
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input name="password" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <%select case rs("flag")
                case "1"
                response.Write "<input type=radio name=flag value=1 checked>����&nbsp;<input name=flag type=radio value=2 >���&nbsp;<input type=radio name=flag value=3>�鿴"
                case "2"
                response.Write "<input type=radio name=flag value=1>����&nbsp;<input name=flag type=radio value=2 checked>���&nbsp;<input type=radio name=flag value=3>�鿴"
				case "3"
				response.Write "<input type=radio name=flag value=1>����&nbsp;<input name=flag type=radio value=2>���&nbsp;<input type=radio name=flag value=3  checked>�鿴"
                end select%>
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input type="submit" name="Submit" value="�� ��" >
                &nbsp;<input type="button" value="ɾ ��" onclick="if (confirm('ȷʵҪ������¼��')) window.location='saveadmin.asp?id=<%=int(rs("id"))%>&action=del'">
              </div>
            </td>
          </tr>
        </form>
        <%rs.movenext
        loop
        rs.close
        set rs=nothing
        %>
      </table>
    <br /></td>
  </tr>
</table>
<br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#000000">��̨�û����</font></div>    </td>
  </tr>
  <tr> 
    <td> 
     <br /> <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr> 
          <td width="21%" height="25" bgcolor="f1f1f1"> 
            <div align="center">����Ա</div>          </td>
          <td width="23%" bgcolor="f1f1f1"> 
            <div align="center">�� ��</div>
          </td>
          <td width="35%" bgcolor="f1f1f1"> 
            <div align="center">Ȩ ��</div>
          </td>
          <td width="21%" bgcolor="f1f1f1"> 
            <div align="center">�� ��</div>
          </td>
        </tr>
        <form name="form1" method="post" action="saveadmin.asp?action=add">
          <tr> 
            <td> 
              <div align="center"> 
                <input name="admin2" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input name="password2" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input type="radio" name="flag2" value="1">
                ���� 
                <input name="flag2" type="radio" value="2" checked>
                ��� 
                <input type="radio" name="flag2" value="3">
                �鿴</div>
            </td>
            <td> 
              <div align="center"> 
                <input type="submit" name="Submit2" value="�� ��" >
              </div>
            </td>
          </tr>
        </form>
      </table>
      <br />
    </td>
  </tr>
</table>
<br />
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td  rowspan="2"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="22"> 
                              <div align="center"><font color="#000000">����ע�����˵��</font></div>
                            </td>
                          </tr>
                          <tr> 
                            <td height="38"> 
                              <table width="80%" border="0" align="center" cellpadding="5" cellspacing="0">
                                <tr> 
                                  <td height="48"><font color="#FF0000">����̨�����û���ǰ̨�û�����ǣ����<br />
                                    �������Աֻ�����,�޸�,ɾ�����ϡ�<br />
                                    ���鿴��Ա���Թ����û�������<br />
                                    ������Աӵ�б�վ���й���Ȩ�ޡ�<br />
                                    ����½�������MD5������ת��ʽ���ܣ��粻�޸����룬�����ա� </font></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
