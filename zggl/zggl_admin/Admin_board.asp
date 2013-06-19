
<!--#include file="admin_common/conn.asp" -->
<!--#include file="admin_check_permission.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
<%
dim action
action=trim(request("action"))
select case action
case "add"
add
case "del"
del
case "edit"
edit
case "addok"
addok
case "delok"
delok
case "editok"
editok
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select

sub add
%>
<script>
function check(){
if(form1.t1.value==''){
alert('类名必须填写！');
return false;
}
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=addok" method="post" name="form1" onSubmit="return check();">
  <tr bgcolor="#f5f5f5">
    <td width="22%" height="30" background="images/admin_bg_1.gif">&nbsp;</td>
    <td width="44%" align="center" background="images/admin_bg_1.gif" bgcolor="#f5f5f5">内　　容</td>
    <td width="34%" align="center" background="images/admin_bg_1.gif" bgcolor="#f5f5f5">说　　明</td>
  </tr>
  <tr>
    <td height="28" align="center" bgcolor="#f5f5f5">类别名称：</td>
    <td>　
    <input name="t1" type="text" id="t1" size="25" maxlength="40">    </td>
    <td>　40汉字以内。*必填</td>
  </tr>
  <tr>
    <td height="28" align="center" bgcolor="#f5f5f5">相对说明：</td>
    <td>　
    <input name="t2" type="text" id="t2" size="30" maxlength="50">    </td>
    <td> 　50汉字以内。*可选</td>
  </tr>
  <tr>
    <td height="28" align="center" bgcolor="#f5f5f5">排序情况：</td>
    <td>　
    <input name="t3" type="text" id="t3" size="10">
    *可选</td>
    <td>　默认排序情况，数字越大排得越前</td>
  </tr>
  <tr align="center">
    <td height="30" colspan="3"><input type="submit" name="Submit" value="确 定 添 加"></td>
  </tr>
</form>
</table>
<%
end sub

sub addok
dim t1,t2,t3
t1=replace(trim(request("t1")),"'","’")
t2=replace(trim(request("t2")),"'","’")
t3=replace(trim(request("t3")),"'","’")
if not isNumeric(t3) then
response.write("<script>alert('错误的参数！排序必须为数字！\r\r请返回修正！');history.go(-1);</script>")
end if
sql="insert into board (board,xid,bio) values('"&t1&"','"&t3&"','"&t2&"')"
conn.execute(sql)
response.write("<script>alert('添加成功！按确定返回！');location='admin_board.asp?action=add';</script>")
end sub

sub del
if session("flag")=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
set rs=conn.execute("select * from board order by xid desc")
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="9%" height="30" background="images/admin_bg_1.gif">ID</td>
    <td width="33%" background="images/admin_bg_1.gif">类别名称</td>
    <td width="37%" background="images/admin_bg_1.gif">相对说明</td>
    <td width="10%" background="images/admin_bg_1.gif">排序</td>
    <td width="11%" background="images/admin_bg_1.gif">删除</td>
  </tr>
<%
while not rs.eof
%>
  <tr>
    <td height="26" align="center"><%=rs("id")%></td>
    <td>　<%=rs("board")%></td>
    <td>　<%=rs("bio")%></td>
    <td align="center"><%=rs("xid")%></td>
    <td align="center"><a href="?action=delok&id=<%=rs("id")%>"><img src="images/mfk26.gif" width="14" height="15" border="0"></a></td>
  </tr>
<%
rs.movenext
wend
rs.close
%>
  <tr>
    <td height="26" colspan="5" align="center">要删除类，请先确认已经没有此类别的线路。如有此类别的线路删除不成功。</td>
  </tr>
</table>
<%
end sub

sub delok
if session("flag")=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
dim id
id=trim(request("id"))
if not isNumeric(id) then
response.write("<script>alert('错误的参数！请从有效链接进入！');history.go(-1);</script>")
end if
set rs=conn.execute("select id,x_leiid from xianlu where x_leiid="&id)
if not rs.eof then
rs.close
response.write("<script>alert('被删除的类别下面有线路，无法删除！\r\r要删除此类别请先删除属于此类别的线路！');history.go(-1);</script>")
else
conn.execute ("delete from board where id="&id)
response.write("<script>alert('此类删除成功！按确定返回！');location='admin_board.asp?action=del';</script>")
end if
end sub

sub edit
if session("flag")=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
set rs=conn.execute("select * from board order by xid desc")
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="9%" height="30" background="images/admin_bg_1.gif">ID</td>
    <td width="33%" background="images/admin_bg_1.gif">类别名称</td>
    <td width="37%" background="images/admin_bg_1.gif">相对说明</td>
    <td width="10%" background="images/admin_bg_1.gif">排序</td>
    <td width="11%" background="images/admin_bg_1.gif">修改</td>
  </tr>
  <%
  while not rs.eof
  %>
  <tr>
<form action="?action=editok" method="post" name="form<%=rs("id")%>">
    <td height="26" align="center"><input name="id" type="hidden" size="2" value=<%=rs("id")%> readonly><%=rs("id")%></td>
    <td align="center"><input name="board" type="text" size="25" value=<%=rs("board")%>></td>
    <td align="center"><input name="bio" type="text" size="36" value=<%=rs("bio")%>></td>
    <td align="center"><input name="xid" type="text" size="3" value=<%=rs("xid")%>></td>
    <td align="center"><input type="submit" name="Submit2" value="修改"></td>
</form>
  </tr>
<%
rs.movenext
wend
%>
<tr align="center">
  <td height="26" colspan="5">排序数字的大小与排序的前后成正比。</td>
</tr>
</table>
<%
end sub

sub editok
if session("flag")=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
dim id,board,bio,xid
id=trim(request("id"))
xid=trim(request("xid"))
board=replace(trim(request("board")),"'","’")
bio=replace(trim(request("bio")),"'","’")
if not isNumeric(xid) then
founderr=true
founderrmsg="排序内容必须为数字！\r"
end if
if board="" then
founderr=true
founderrmsg=founderrmsg&"类别名不能为空！\r"
end if
if not isNumeric(id) then
founderr=true
founderrmsg=founderrmsg&"传递参数错误！请确定你从有效链接进入！"
end if
if founderr then
response.write("<script>alert('找到以下错误：\r"&founderrmsg&"');history.go(-1);</script>")
else
sql="update board set board='"&board&"',bio='"&bio&"',xid="&xid&" where id="&id
conn.execute(sql)
response.write("<script>alert('此次修改操作成功！按确定返回！');location='admin_board.asp?action=edit';</script>")
end if
end sub

%>