<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert(' �����ڵ�λ��:��û�е�¼,���¼��');history.go(-1);</script>"
end if
%>
<!--#include file="Connection.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<!--#include file="admin/system/md5.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--��Ա����</title>
<SCRIPT>
win = "on";
function switchSysBar() {
	if (win == "on") {
		win = "off";
		switchPoint.src = "images/arrow02.gif";
		document.all("leftFrm").style.display = "none";
	} else {
		win = "on";
		switchPoint.src = "images/arrow01.gif";
		document.all("leftFrm").style.display = "";
	}
}
</SCRIPT>
</head>
<%
dim uid ,upwd
uid=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [userb] where username='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body>
<div align="center">
<table width="770" height="759"border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="60"><TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      
        <tr>
          <TD width="35%" height="81" align=left 
                  bgColor=#ffffff class=b><div align="center"><img src="<%=weblogo%>"></div></td>
          <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff class=b><div align="center"><img src="<%=webbanner%>"></div></td>
        </tr>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 class=9>
              
                <tr>
                  <TD align=left vAlign=middle background="images/top_bar.gif" class=b>
                    <div align="center"><FONT color=#ffffff><a href="index.asp"><FONT color=#ffffff>��ҳ</Font></a> | <a href="News.asp"><FONT color=#ffffff>���Ŷ�̬</Font></a> | <a href="xl.html"><FONT color=#ffffff>�ȼٲ�Ʒ</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>�Ƶ�Ԥ��</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> ��ƱԤ��</font></a> | <a href="guide.asp"><font color="#FFFFFF">�����Ƽ�</font></a> | <a href="pic.asp"><font color="#FFFFFF">��ͼ����</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">�������</font></a> | <a href="userInfo.asp"><font color="#FFFFFF">��Ա����</font></a> | <a href="Help.asp"><font color="#FFFFFF">���߰���</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
                </tr>
              
          </TABLE></td>
        </tr>
      
    </TABLE>
      <TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
        
          <TR bgColor=#ffffff>
            <TD colSpan=3 height=2></td>
          </tr>
          <tr>
            <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
            <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="index.asp">��վ����ҳ</a>����</td>
            <TD width="11">&nbsp;</td>
          </tr>
        
      </TABLE></td>
  </tr>
  <tr>
    <td height="1" bgcolor="#C0C0C0"></td>
  </tr>
  <tr>
    <td width="100%" height="100%"><table border=0 cellpadding=0 cellspacing=0 height=100% width=100%>
      <tr>
        <td width="1%" valign=top bgcolor="#0F77B1" id=leftfrm>
          <table border="0" width="150" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp" target="main"><font color="#FFFFFF">��������</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=EditUserinfo" target="main"><font color="#FFFFFF">�޸ĸ�������</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=editpass" target="main"><font color="#FFFFFF">�޸Ŀ���</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=payjilu" target="main"><font color="#FFFFFF">�ҵĽ��׼�¼</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="LoginOut.asp"><font color="#FFFFFF">ע���˳�</font></a></td>
            </tr>
          </table>
          <%if Response.Cookies("Gemisum")("reglx")=3 then%>
		  <table border="0" width="100%" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_Addxl.asp?action=add" target="main"><font color="#FFFF00">������·��Ϣ</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_hotelReg.asp" target="main"><font color="#FFFF00">�����Ƶ���Ϣ</font></a></td>
            </tr>
            <tr>
              <td></td>
              <td><a href="User_Addxl.asp?action=Edit" target="main"><font color="#FFFF00">��·��Ϣ����</font></a></td>
            </tr>
            <tr>
              <td></td>
              <td><a href="User_HotelInfo.asp" target="main"><font color="#FFFF00">�Ƶ���Ϣ����</font></a></td>
            </tr>
          </table>
		  <%End if%></td>
        <td width="1%" bgcolor="#C0C0C0">
      <table border=0 cellpadding=0 cellspacing=0 height=100%>
        <tr>
          <td style="cursor:hand" onclick=switchSysBar()><img id=switchPoint src="images/arrow01.gif"></td>
          <td bgcolor="#090C11"><img src="" width="1"></td>
         </tr>
      </table></td>
        <td width="98%" style=width:100%><iframe frameborder=0 name=main scrolling=yes src="User_main.asp" style=height:100%;visibility:inherit;width:100%;z-index:1></iframe></td>
      </tr>
    </table>
      </td>
  </tr>
</table>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  
    <tr>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
      <TD 
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>��վ��ҳ</a> | <a href=about.asp?action=about >��������</a> | <a href=about.asp?action=lxwm >ҵ����ϵ</a> | <a href=help.asp?action=shiyongfalv >��Ȩ����</a> | <a href=help.asp?action=fukuan >���ʽ</a> | <a href=gbook.asp >����/����/Ͷ��</a></td>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
    </tr>
    <tr>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "����˾��ַ��"&dizhi&"���������룺"&youbian&"<br>"
response.Write "���ͷ����䣺<a href=mailto:"&webemail&">"&webemail&"</a>���ͷ��绰��"&dianhua&"<br>��"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " �����ڵ�λ��:��"&FormatNumber((endtime-startime)*1000,3)&" ����"
%>
      </div></td>
    </tr>
  
</TABLE>
</div>
</body>
</html>
