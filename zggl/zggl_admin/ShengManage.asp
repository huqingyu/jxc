
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>省管理</title>
<script>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<center><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
    <form method="post" action="shengset.asp?action=update">
      <tr height=25> 
        <td height="30" colspan="8" align="center" background="Images/topBar_bg.gif"><font color=red>省设置</font></td>
      </tr>
      <tr align=center height=25> 
        <td bgcolor="f1f1f1">序号</td>
        <td bgcolor="f1f1f1">省名称</td>
        <td bgcolor="f1f1f1">省编号</td>
        <td bgcolor="f1f1f1">排序<br />
          (必填项，数字)</td>
        <td bgcolor="f1f1f1">删除</td>
      </tr>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open "SELECT  * From szSheng  order by shengorder",conn,1,1
if rs.recordcount=0 then 
%>
      <tr bgcolor="#FFF"> 
        <td colspan="8" height=25 align="center" width="100%"> 还没有添加省 </td>
      </tr>
<%
else
    do while not rs.eof
%>
      <tr height=25 bgcolor="#FFF"> 
        <td align=center><%=rs("ID")%></td>
        <td align=center> 
          <input type="hidden" name="shengid" value="<%=rs("id")%>">
          <input type="text" class="wenbenkuang" name="shengname" size="10" value="<%=trim(rs("shengname"))%>">
        </td>
        <td align=center> 
          <input type="text" class="wenbenkuang" name="shengno" size="10" value="<%=trim(rs("shengno"))%>" ONKEYPRESS="event.returnValue=IsDigit();" >
        </td>
        <td align=center> 
          <input type="text" class="wenbenkuang" name="shengorder" size="10" value="<%=rs("shengorder")%>" ONKEYPRESS="event.returnValue=IsDigit();" >
        </td>
        <td align=center> <a href="shengkill.asp?shengid=<%=rs("id")%>">删除</a> 
        </td>
      </tr>
      <%
    rs.MoveNext
    Loop
%>
      <tr bgcolor="#FFF"> 
        <td colspan="8" height=25 align="center" width="100%"> 
          <input type="submit" name="Submit2" class="go-wenbenkuang" value="保存修改">
          &nbsp; 
          <input type="reset" value="重新设定" class="go-wenbenkuang" name="重置" >
        </td>
      </tr>
<%
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
    </form>
    <form method="post" action="shengset.asp?action=add">
      <tr height=25 bgcolor="#FFF"> 
        <td align=center>添加省 </td>
        <td align=center> 
          <input type="text" name="shengname" size="10" class="wenbenkuang">
        </td>
        <td align=center> 
          <input type="text" name="shengno" size="10" class="wenbenkuang" ONKEYPRESS="event.returnValue=IsDigit();">
        </td>
        <td align=center> 
          <input type="text" name="shengorder" size="10" class="wenbenkuang" ONKEYPRESS="event.returnValue=IsDigit();">
        </td>
        <td align=center colspan="2"> 
          <input type="submit" name="Submit2" class="go-wenbenkuang" value="添加">
        </td>
      </tr>
    </form>
  </table>
</center>
</body>
</html>