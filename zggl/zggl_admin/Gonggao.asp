
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
<%
function HTMLEncode2(fString)
	fString = Replace(fString, CHR(13), "")
	fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
	fString = Replace(fString, CHR(10), "<br />")
	HTMLEncode2 = fString
end function
dim action
action=request.QueryString("action")
select case action
case "savegongao" 
set rs=server.CreateObject("adodb.recordset")
rs.open "select gonggao from config",conn,1,3
rs("gonggao")=htmlencode2(trim(request("gonggao")))
rs.update
set rs=nothing
response.Write "<script>alert('�����޸ĳɹ���');history.go(-1);</script>"
response.End
end select
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
<br /><table width="90%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#000000">������ҳ����</font></div>    </td>
  </tr>
  <tr> 
    <td> 
      <form name="form1" method="post" action="gonggao.asp?action=savegongao" id="Form1">
        <div align="center"><font color="#FF0000">����������ϢΪ��ҳ���棬�뼰ʱ���£�֧��HTML���롣</font></div>
        <table width="80%" border="0" align="center" cellpadding="3" cellspacing="0" id="Table2">
          <tr> 
            <td> 
              <div align="center"> 
                <textarea name="gonggao" cols="60" rows="10" id="Textarea1" class="wenbenkuang"><%set rs=server.CreateObject("adodb.recordset")
                rs.Open "select gonggao from config",conn,1,1
                response.Write trim(rs("gonggao"))
                rs.Close
                set rs=nothing
                %></textarea>
              </div>
            </td>
          </tr>
          <tr> 
            <td height="20"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="�� ��" id="Submit1">
                &nbsp;&nbsp; 
                <input type="reset" name="Submit2" value="�� ��" id="Reset1">
              </div>
            </td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>
</body>
</html>
