
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>市管理</title>
<script>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<center><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
    <form method="post" action="shiset.asp?action=update">
      <tr height=25> 
        <td height="30" colspan="8" align="center" background="images/admin_bg_1.gif"><font color=red>市设置</font></td>
      </tr>
      <tr height=25> 
        <td colspan="8" align="center">
          <%
Set rs_s = Server.CreateObject("ADODB.Recordset")
rs_s.open "SELECT * From szsheng order by shengorder",conn,1,1
while not rs_s.eof
response.write "[<a href=shimanage.asp?shengid="&rs_s("id")&">"&rs_s("shengname")&"</a>]&nbsp;"
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
        </td>
      </tr>
      <tr align=center height=25> 
        <td bgcolor="f1f1f1">序号</td>
        <td bgcolor="f1f1f1">所属省</td>
        <td bgcolor="f1f1f1">市名称</td>
        <td bgcolor="f1f1f1">市编号</td>
        <td bgcolor="f1f1f1">排序<br />
          (必填项，数字)</td>
        <td bgcolor="f1f1f1">删除</td>
      </tr>
<%
dim shengid
shengid=request("shengid")
Set rs = Server.CreateObject("ADODB.Recordset")
if shengid<>"" then
  rs.open "SELECT  * From szshi  where shengid="&shengid&" order by shengid,shiorder",conn,1,1
else
response.Write "请选择以下省份进行处理"
end if
if rs.recordcount=0 then 
%>
      <tr> 
        <td colspan="8" height=25 align="center" width="100%"> 还没有添加市 </td>
      </tr>
<%
else
    do while not rs.eof
%>
      <tr height=25> 
        <td align=center><%=rs("ID")%></td>
        <td align=center> 
          <select name="shengid" size="1" class="wenbenkuang">
<%
Set rs_s = Server.CreateObject("ADODB.Recordset")
rs_s.open "SELECT  * From szsheng  order by shengorder",conn,1,1
while not rs_s.eof
%>
<option value="<%=rs_s("id")%>" <%if rs_s("id")=rs("shengid") then%>selected<%end if%>><%=rs_s("shengname")%></option>
<%
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
          </select>
        </td>
        <td align=center> 
          <input type="hidden" name="shiid" value="<%=rs("id")%>">
          <input class="wenbenkuang" type="text" name="shiname" size="10" value="<%=trim(rs("shiname"))%>">
        </td>
        <td align=center> 
          <input class="wenbenkuang" type="text" name="shino" size="10" value="<%=trim(rs("shino"))%>" ONKEYPRESS="event.returnValue=IsDigit();" >
        </td>
        <td align=center> 
          <input class="wenbenkuang" type="text" name="shiorder" size="10" value="<%=rs("shiorder")%>" ONKEYPRESS="event.returnValue=IsDigit();" >
        </td>
        <td align=center> <a href="shikill.asp?shiid=<%=rs("id")%>&id=<%=shengid%>">删除</a> 
        </td>
      </tr>
      <%
    rs.MoveNext
    Loop
%>
      <tr> 
        <td colspan="8" height=25 align="center" width="100%"> 
          <input type="submit" name="Submit2" value="保存修改" class="go-wenbenkuang">
          &nbsp; 
          <input type="reset" value="重新设定" class="go-wenbenkuang" name="重置" >
          <input type="hidden" name="id" value="<%=shengid%>">
        </td>
      </tr>
<%
end if
rs.close
set rs=nothing
%>
    </form>
    <form method="post" action="shiset.asp?action=add">
      <tr height=25> 
        <td align=center>添加市 </td>
        <td align=center> 
          <select name="shengid" size="1" class="wenbenkuang">
<%
Set rs_s = Server.CreateObject("ADODB.Recordset")
rs_s.open "SELECT  * From szsheng  order by shengorder",conn,1,1
while not rs_s.eof
%>
<option value="<%=rs_s("id")%>"><%=rs_s("shengname")%></option>
<%
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
conn.close
set conn=nothing
%>
          </select>
        </td>
        <td align=center> 
          <input class="wenbenkuang" type="text" name="shiname" size="10">
        </td>
        <td align=center> 
          <input class="wenbenkuang" type="text" name="shino" size="10" ONKEYPRESS="event.returnValue=IsDigit();">
        </td>
        <td align=center> 
          <input class="wenbenkuang" type="text" name="shiorder" size="10" ONKEYPRESS="event.returnValue=IsDigit();">
        </td>
        <td align=center colspan="2"> 
          <input type="submit" name="Submit2" value="添加" class="go-wenbenkuang">
          <input type="hidden" name="id" value="<%=shengid%>">
        </td>
      </tr>
    </form>
  </table>
</center>
</body>
</html>