<html>
	<head>
		<title>
		����ͳ��
		</title>
	
<link href="display.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body LEFTMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="16" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="186" valign="top"> <table width="82%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
        <tr> 
          <td height="243" valign="top">
<table width="100%" height="137" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="25" align="center" bgcolor="#F6F6F6" 
				 onmouseover="this.bgColor = '#f0f0f0'"  onmouseout="this.bgColor = '#F6F6F6'"><a href="main.asp" class="Af">��������</a></td>
              </tr>
              <tr> 
                <td height="24">&nbsp;</td>
              </tr>
              <tr> 
                <td height="24" align="center" bgcolor="#F6F6F6" 
 onmouseover="this.bgColor = '#f0f0f0'" onmouseout="this.bgColor = '#F6F6F6'" ><a href="flash.asp" class="Af">����ͳ��</a></td>
              </tr>
              <tr>
                <td height="24" >&nbsp;</td>
              </tr>
              <tr>
                <td height="24" align="center" bgcolor="#F6F6F6" 
 onmouseover="this.bgColor = '#f0f0f0'" onmouseout="this.bgColor = '#F6F6F6'" ><a href="admin.asp" class="Af">��̨����</a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
	  <%if session("name")="" or session("password")="" then%>
      <table width="82%" height="88" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="22" align="center" bgcolor="#006699"><font color="#FFFFFF">����Ա��½</font></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F0F0F0">
              <form name="form1" method="post" action="ChkUSER.asp">
                <tr> 
                  <td width="48%" height="21" align="center">����Ա</td>
                  <td width="52%"><input name="name" type="text" id="name" size="10"></td>
                </tr>
                <tr> 
                  <td height="22" align="center">����</td>
                  <td><input name="password" type="password" id="password" size="10"></td>
                </tr>
                <tr> 
                  <td height="30" colspan="2"> <div align="center"> 
                      <input type="submit" name="Submit" value="�� ½"  >
                    </div></td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>
	  <%else%>
      <table width="82%" height="88" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="22" align="center" bgcolor="#006699"><font color="#FFFFFF">��½--�ɹ�</font></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F0F0F0">
      
                <tr> 
                  <td width="100%" height="30" colspan="2"> <div align="center"> 
                    <a href="logout.asp" class="Af">��ȫ�˳� </a></div></td>
                </tr>

            </table></td>
        </tr>
      </table>
      <%end if%></td>
    <td width="584"><table width="554" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
        <tr> 
          <td width="550" align="center"> 
            <%
PollID=Request.Querystring("PollID")

Dtrdatasrc="pieData.asp"

Dtrdatasrc=flshpollencURL(Dtrdatasrc)
%>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="550" height="220" align="middle">
              <param name=movie value="flashpoll.swf?dataurl=<%=Dtrdatasrc%>">
              <param name=quality value=high>
              <embed src="flashpoll.swf?dataurl=<%=Dtrdatasrc%>" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="550" height="220" align="middle" bgcolor=#99ccff> 
              </embed> </object> </td>
        </tr>
        <tr> 
          <td><div align="center"> 
              <!--#include file="pieDatax.asp" -->
            </div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
Function flshpollencURL(strURL)
	strURL=replace(strURL,"?","&")
	strURL=replace(strURL,"&","*")
	flshpollencURL=strURL
End Function
%>
