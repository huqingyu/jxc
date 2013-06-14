<%
'飞鸟计数器'V1.0
%>
<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%sum=0
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fromw order by coun desc"
rs.Open sql,conn,1,2
if request.Form("ifgoto")<>"" then
rs.addnew
rs("vwhere")=request.Form("vwhere")
rs("coun")=request.Form("coun")
rs.update
rs.movefirst
end if
while not rs.eof
sum=sum+rs("coun")
rs.movenext
wend
if rs.eof then
conn.execute("update sum set  sum="&sum&"")
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fromw order by coun desc"
rs.Open sql,conn,1,2
%>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr bgcolor="#AE5700"> 
    <td height="29" colspan="3"> <div align="center"><font color="#FFFFFF">地域统计--管理</font></div></td>
  </tr>
  <tr> 
    <td width="33%" height="23" bgcolor="#FFC184"> <div align="center">地域</div></td>
    <td width="31%" align="center" bgcolor="#FFC184">访问量</td>
    <td align="center" bgcolor="#FFC184">操作</td>
  </tr>
  <%
  i=1
while not rs.eof
if i mod 2 =0 then 
colorstr="#F3F3F3"
else
colorstr="#ffffff"
end if%>
  <tr> 
    <td height="18" bgcolor=<%=colorstr%>> <div align="center"><%=rs("vwhere")%> 
      </div></td>
    <td align="center" bgcolor=<%=colorstr%>><%=rs("coun")%></td>
    <td width="36%" align="left" bgcolor=<%=colorstr%>> <div align="center"><a href="dydelete.asp?id=<%=rs("id")%>"
	 onClick="javascript:if(confirm('确定要删除吗?')){return true;}else{return false;}" class="Af">删除</a></div></td>
  </tr>  <%i=i+1
rs.movenext
wend%><form name="form1" method="post" action="">
<input name="ifgoto"  value="yes"  type="hidden">
  <tr>
      <td height="29" align="center" bgcolor=<%=colorstr%>> 
        <input name="vwhere" type="text" id="vwhere">
      </td>
    <td align="center" bgcolor=<%=colorstr%>><input type="text" name="coun"></td>
      <td align="center" bgcolor=<%=colorstr%>><input type="submit" name="Submit" value="添 加"></td>
  </tr></form>

</table>
