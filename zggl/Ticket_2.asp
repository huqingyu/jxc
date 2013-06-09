<!--#include file="Connection.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--国际机票信息</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>

<!--#include file="top.asp" -->

<table width="980" height="548" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212" valign="top"><!--#include file="pw_left.asp" --></td>
    <td valign="top"><div align="center">
      </div>      
      <br>
      <!--#include file="admin/system/system_code.asp" -->
<table width="572" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#ff0000"><b> 您现在的位置:果</b></font></div></td>
        </tr>
        <tr>
          <td height="442" colspan="2" valign="top">  <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ebebeb">
            <tr>
              <td width="22%"> &nbsp;航空公司</td>
              <td width="17%"> &nbsp;航段</td>
              <td width="12%">航段类型</td>
              <td width="14%">单程/往返</td>
              <td width="14%">航班类型</td>
              <td width="11%">价格</td>
              <td width="10%">预定</td>
            </tr>
            <tr bgcolor="#CCCCCC">
              <td height="1" colspan="8"></td>
            </tr>
          </table>
<%
set rs=server.createobject("adodb.recordset")
stsql="select * from dingbiao where hbtype = 2 "
rs.open stsql, conn, 1, 1
if not rs.eof then
rs.PageSize =25 '每页记录条数
result_num=rs.RecordCount '记录总数
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
 <table width="99%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="22%"><%=rs("hankonggongsi")%></td>
                <td width="17%"><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
                <td width="12%"><%=rs("hdtype")%></td>
                <td width="14%"><%=rs("type")%></td>
                <td width="14%"><% if rs("hbtype")="1" then 
response.write "国内航班"
else
response.write "国际航班"
end if
%></td>
                <td width="11%"><font color="#FF0000">＄<%=rs("shichanjia")%></font></td>
                <td width="10%"><a href="Ticketinfo.asp?id=<%=rs("id")%>">预定</a></td>
              </tr>
              <tr bgcolor="#CCCCCC">
                <td height="1" colspan="8"></td>
              </tr>
            </table>
          <%
rs.movenext      
if rs.EOF then Exit For      
next      
end if      
rs.close      
set rs=nothing
%></td>
        </tr>
        <tr>
          <td height="30" colspan="2"><div align="center">
              <% call LastNextPage(maxpage,page,result_num) %>
          </div></td>
        </tr>
      </table>    </td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

<!--#include file="foot.asp" -->

