<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
<%
xlmc=trim(request.querystring("xlmc"))
xllx=trim(request.querystring("xllx"))
%>
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname%>--�Ƶ��ѯ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>

</head>
<body>

<!--#include file="top.asp" -->

<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF"><!--#include file="left.asp" -->
		</td>
    <td align="center" valign="top"><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>�����ڵ�λ��:</b><a href="/index.asp">��ҳ</a>Ԥ����ѯ���</td>
        </tr>
      </TABLE>
      <%
session("starttime")=request.form("starttime")
session("deptime")=request.form("deptime")
star=request.form("star")
jiage=request.form("jiage")
shucity=request.form("shucity")
hotelname=request.form("name")
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where city like '%"&shucity&"%' and c_name like '%"&hotelname&"%'" 

if star="all" then
else
	sqltext=sqltext &"and ( "
	if star=0 then
		sqltext=sqltext &" level='�ޱ�׼' or"
	end if
	if star=1 then
		sqltext=sqltext &" level='һ�Ǽ�' or level='׼һ�Ǽ�' or"
	end if
	if star=2 then
		sqltext=sqltext &" level='���Ǽ�' or level='׼���Ǽ�' or"
	end if
	if star=3 then
		sqltext=sqltext &" level='���Ǽ�' or level='׼���Ǽ�' or"
	end if
	if star=4 then
		sqltext=sqltext &" level='���Ǽ�' or level='׼���Ǽ�' or"
	end if
	if star=5 then
		sqltext=sqltext &" level='���Ǽ�' or level='׼���Ǽ�' or"
	end if
	sqltext=sqltext & " level='����')"
end if

sqltext=sqltext & "order by id desc"
rs.open sqltext,conn
%>
<script language="javascript">
function OpenSmallWindows(strURL)
{
window.open (strURL,"_blank",
"status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=780,height=300,left=2,top=100");
}
</script>
    <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30">&nbsp;&nbsp; �����ڵ�λ��:ѯ�Ľ����</td>
      </tr>
</table>
    <%
  if rs.eof then 
  	response.write "<script language=JavaScript>{window.alert(' �����ڵ�λ��: �����ڵ�λ��:�������²���!');window.history.go(-1);}</script>"
  	response.end
  end if
  if not rs.eof then
  	
  	do while not rs.eof 
  	
	c_id=rs("id")
	set rsroom=server.createobject("adodb.recordset")
	sqltext="select * from roomb where c_id="&c_id&"" 
	
	if jiage="all" then
	else
		sqltext=sqltext & " and ( "
		if jiage<>"" then
			sqltext=sqltext & jiage &" or "
		end if
		sqltext=sqltext & " breakfast='����')"
	end if
	
	sqltext=sqltext & " order by id asc"
	rsroom.open sqltext,conn
  if not rsroom.eof then
  %>
  <table width="770" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <tr>
            <td width="35%" height="31" background="images/topBar_bg.gif">
      <font class="medium" color="#000080">
      <b><%=rs("c_name")%></b></font>      </td>
            <td width="20%"><div align="center">�Ƶ��Ǽ�:<font color="#FF0000">
            <%if rs("level")="�ޱ�׼" then 
      		response.write "�ޱ�׼"
      	elseif rs("level")="һ�Ǽ�" then
      		response.write "��"	
      	elseif rs("level")="׼һ�Ǽ�" then
      		response.write "��"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="���Ǽ�" then
      		response.write "���"	
      	elseif rs("level")="׼���Ǽ�" then
      		response.write "���"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="���Ǽ�" then
      		response.write "����"	
      	elseif rs("level")="׼���Ǽ�" then
      		response.write "����"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="���Ǽ�" then
      		response.write "�����"	
      	elseif rs("level")="׼���Ǽ�" then
      		response.write "�����"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="���Ǽ�" then
      		response.write "������"	
      	elseif rs("level")="׼���Ǽ�" then
      		response.write "������"
      		response.write"<img src=star/zhun.gif>"
      	end if
      %>
        </font></div></td>
        <td width="21%" height="31"><div align="center"><span class="main1">����ʡ��:<%=rs("province")%></span></div></td>
      <td width="24%" height="31"><div align="center"><span lang="zh-cn">���ڳ��У�<%=rs("city")%></span></div></td>
    </tr>
    <tr>
      <td colspan="5" height="16">
      <table width="100%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
       <tr>
          <td width="23%" height="25" background="images/topBar_bg.gif"><div align="center">����</div></td>
          <td width="7%" height="25" background="images/topBar_bg.gif">
          <p align="center">���</td>
          <td width="11%" height="25" background="images/topBar_bg.gif"><div align="center">���м�</div></td>
          <td width="22%" height="25" colspan="2" background="images/topBar_bg.gif"><div align="center">ǰ̨�ָ���</div></td>
          <td width="12%" height="25" background="images/topBar_bg.gif"><div align="center">����֧����</div></td>
          <td width="13%" height="25" background="images/topBar_bg.gif"><div align="center">֧����ʽ</div></td>
          <td width="12%" height="25" background="images/topBar_bg.gif">
          <p align="center">���շ�̬</td>
        </tr>
      <%if not rsroom.eof then
      do while not rsroom.eof%>
        <tr>
          <td width="23%" height="14"><%=rsroom("type")%></td>
          <td width="7%" height="14">
          <p align="center"><%=rsroom("breakfast")%></td>
          <td width="11%" height="14">RMB <%=rsroom("marketprice")%></td>
          <td width="12%" height="14">RMB <%=rsroom("stageprice")%></td>
          <td width="10%" height="14">
          <p align="center">
          <a href="userinfo/login.asp?hotelid=<%=rs("id")%>&roomid=<%=rsroom("id")%>"><strong><font color="#FF0000">Ԥ��</font></strong></a></td>
          <td width="12%" height="14">RMB <%=rsroom("netprice")%></td>
          <td width="13%" height="14"><%=rsroom("paytype")%></td>
          <td width="12%" height="14">
          <p align="center"><%=rsroom("state")%></td>
        </tr>
        <%
        rsroom.movenext
        loop
        rsroom.close
        end if%>
      </table>
      </td>
    </tr>
    <tr bgcolor="#EBEBEB">
      <td height="30" colspan="5">
      <p align="right"><a href="#" onClick="Javascript:OpenSmallWindows('HotelRoomAll.asp?id=<%=rs("Id")%>')" >ȫ������</a></td>
    </tr>
</table>
  <%
  end if
  rs.movenext
  loop
  end if
  rs.close
  conn.close
  %>
      </td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->

</body>
</html>