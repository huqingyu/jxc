<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
<%
keywords=trim(request.querystring("keywords"))
%>
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname%>-��·����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>

</head>
<body>
<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF"><!--#include file="left.asp" -->
		</td>
    <td align="center" valign="top"><TABLE WIDTH=98% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>�����ڵ�λ��:</b><a href="index.asp">��ҳ</a>��ѯ</td>
        </tr>
      </TABLE>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="565" align="center" valign="top"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="6"></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" background="Images/pic16.gif" style="border:1px solid #CCCCCC;">
            <tr>
              <td width="45" height="28" align="center" style="font-size:14px; color:#CC6600; font-weight:bold;">&nbsp;</td>
              <td style="font-size:14px; font-weight:bold;">����<font color="#FF6600">"<%=trim(keywords)%>"</font></td>
              </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:24px;">
              <tr>
                <td height="840" valign="top" style="border-left:1px solid #EBF6D8; border-right:1px solid #EBF6D8; border-bottom:1px solid #EBF6D8;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center"><table width="98%" border="0" cellspacing="0" cellpadding="0">
<%
sql="select * from news where bt like '%"&keywords&"%' or nr like '%"&keywords&"%'"

set rs=server.createobject("adodb.recordset") 
rs.open sql,conn,1
rs.pagesize=25' �����ڵ�λ��:
pagecount=rs.pagecount '��ҳ��
if rs.bof and rs.eof then
%>
<tr>
                            <td height="32" align="left" ><span style="font-size:14px;"> �����ڵ�λ��:¼</span></td>
</tr>
<%
else
	page=clng(request.querystring("page"))
	if page<1 then page=1
	if page>rs.pagecount then page=rs.pagecount
	rs.absolutepage=page  '��������ҳ
        for i=1 to rs.pagesize
%>
                          <tr>
                            <td height="32" align="left" style="border-bottom:1px dotted #CCECB6"><a href="show.asp?id=<%=rs("id")%>" target="_blank"> <span style="font-size:14px;">��<%=left(rs("bt"),34)%></span></a> <font color="#0066FF">[<%=datevalue(rs("riqi"))%>]</font></td>
                          </tr>
<%
         rs.movenext
         if rs.eof then exit for 
         next
end if%>
                        </table>
<table width="95%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td height="22" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
                                						
								<span style="color:#666666">[��<%=rs.pagecount%>ҳ&nbsp;��ǰ��<%=page%>ҳ&nbsp;<%
	if page<=1 then
	   Response.Write("��ҳ&nbsp;&nbsp;")
       Response.Write ("��һҳ")
    else
	  Response.Write("<a href='?keywords="&keywords&"&Page=1' class='list'>��ҳ</a>&nbsp;&nbsp;")
	  Response.Write("<a href='?keywords="&keywords&"&Page=" & (Page-1) & "' class='list'>��һҳ</a>")

    end if
	response.write "&nbsp;&nbsp;"
    if page>=Rs.PageCount then
        Response.Write ("��һҳ")
		Response.Write("&nbsp;&nbsp;βҳ")
    else
  		Response.Write("<a href='?keywords="&keywords&"&Page=" & (Page+1) & "' class='list'>��һҳ</a>")
  		Response.Write("&nbsp;&nbsp;<a href='?keywords="&keywords&"&Page=" & rs.pagecount & "' class='list'>βҳ</a>")
    end if

%>]</span></td>
                            </tr>
                        </table>
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
      </td>
    <td valign="top">
	<!--#include file="right_i.asp" -->
	</td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->

</body>
</html>
