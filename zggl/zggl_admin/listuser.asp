
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
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%dim userid
		userid=request.querystring("id")
		set rs=server.createobject("adodb.recordset")
		rs.open "select * from [userb] where id="&userid ,conn,1,1%>
<br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#FF0000">�û���ϸ����</font></div>    </td>
  </tr>
  <tr> 
    <td height="163" valign="top"> 
      <form name="form1" method="post" action="saveuser.asp?action=save&id=<%=userid%>">
        <br />
        <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
          <tr> 
            <td width="20%" height="25" ><div align="right">�û����ƣ�</div></td>
            <td width="15%" ><font color=#FF0000><%=trim(rs("username"))%>�������� 
              </font></td>
            <td width="65%"><font color=#FF0000>�û�����</font><font color=#FF0000> 
              <select name="reglx" >
                <option value="1" <%if rs("reglx")=1 then%>selected<%end if%>>��ͨ��Ա</option>
                <option value="2" <%if rs("reglx")=2 then%>selected<%end if%>>VIP��Ա</option>
				<option value="3" <%if rs("reglx")=3 then%>selected<%end if%>>��ҵ��Ա</option>
              </select>
               �߼���Ա���� </font> 
              <input type="text" name="vipdate" size="10" value="<%=rs("vipdate")%>" >
              (��ͨ��Աû��ʱ������)</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">��½���룺</div></td>
            <td colspan="2"> 
              <input name="userpassword" type="text" id="userpassword" size="12" >
              ����������Ϊ��!</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">��ʵ������</div></td>
            <td colspan="2"> 
              <input name="name" type="text" id="name" size="12" value="<%=trim(rs("name"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">�����ʼ���</div></td>
            <td colspan="2"> 
              <input name="email" type="text" id="email" value="<%=trim(rs("email"))%>">
              </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">���֤���룺</div></td>
            <td colspan="2"> 
              <input name=idcard type=text id="idcard" onKeyPress="event.returnValue=IsDigit();" value="<%=trim(rs("idcard"))%>" size="20" maxlength="18">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">�Ա�</div></td>
            <td colspan="2"> 
              <input type="radio" name="sex" value="��" <%if rs("sex")="��" then%>checked<%end if%>>
              �С��� 
              <input type="radio" name="sex" value="Ů" <%if rs("sex")="Ů" then%>checked<%end if%>>
              Ů</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">��ϸ��ַ��</div></td>
            <td colspan="2"> 
              <input name="address" type="text" id="address" size="35" value="<%=trim(rs("address"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">�ʱࣺ</div></td>
            <td colspan="2"> 
              <input name="zip" type="text" id="zip" size="12" value="<%=rs("zip")%>" maxlength=6 onKeyPress="event.returnValue=IsDigit();">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">��ϵ�绰��</div></td>
            <td colspan="2"> 
              <input name="telphone" type="text" id="telphone" size="12" value="<%=trim(rs("telphone"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">������</div></td>
            <td colspan="2"> 
              <input name=work type=text id="work" value="<%=trim(rs("work"))%>" size="35">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">Ԥ��</div></td>
            <td colspan="2"> 
              <input name=yucun type=text value="<%=trim(rs("yucun"))%>" size="10" maxlength="8" onkeyup="if(isNaN(value))execCommand('undo')">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">���֣�</div></td>
            <td colspan="2"> 
              <input name=jifen type=text value="<%=trim(rs("jifen"))%>" size="10" maxlength="8" onkeyup="if(isNaN(value))execCommand('undo')">
              (���׳ɹ������Ա���ڴ˸��û�����)</td>
          </tr>
		  <!--___________��ҵ�û�����______-->
		  <%if rs("reglx")=3 then%>
		  <tr> 
            <td width="20%" height="25" ><div align="right">��˾���ƣ�</div></td>
            <td colspan="2"> 
              <input name=Qy_Name type=text id="Qy_Name" value="<%=trim(rs("Qy_Name"))%>" size="35" >              </td>
          </tr>
		            <tr> 
            <td width="20%" height="25" ><div align="right">��˾�绰��</div></td>
            <td colspan="2"> 
              <input name=Qy_Tel type=text id="Qy_Tel" value="<%=trim(rs("Qy_Tel"))%>" size="25"></td>
          </tr>
		            <tr> 
            <td width="20%" height="25" ><div align="right">��˾E-Mail��</div></td>
            <td colspan="2"> 
              <input name=Qy_Email type=text id="Qy_Email" value="<%=trim(rs("Qy_Email"))%>" size="25"></td>
          </tr>
		  <% end if%>
		  <!--_____________________________-->
		  
          <tr> 
            <td width="20%" height="25" ><div align="right">ע��ʱ�䣺</div></td>
            <td colspan="2"><%=rs("regdate")%></td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">����½��</div></td>
            <td colspan="2"><%=rs("lastlogin")%></td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">��½������</div></td>
            <td colspan="2"><%=rs("logins")%>��</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">���¶�������</div></td>
            <td colspan="2"> 
              <%dim rs2
			set rs2=server.CreateObject("adodb.recordset")
			rs2.open "select id from [payjilu] where username='"&trim(rs("username"))&"'",conn,1,1
			response.write rs2.recordcount&"�ʶ���"
			rs2.close
			set rs2=nothing
			%>
            </td>
          </tr>
          <%rs.close
			set rs=nothing
			conn.close
			set conn=nothing%>
          <tr> 
            <td height="28" colspan="3"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="ȷ���ύ">
                &nbsp;&nbsp;&nbsp; 
                <input type="button" name="Submit2" value="������һҳ" onClick='javascript:history.go(-1)'>
              </div>
            </td>
          </tr>
        </table>
      <br /></form>
    </td>
  </tr>
</table>
</body>
</html>
