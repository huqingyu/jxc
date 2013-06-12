
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

  <tr> 
    <td width="259" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;"><div align="center">Í¼Æ¬ÍÆ¼ö 
        <%
set rsp=Server.Createobject("Adodb.Recordset")
sql= "Select Top 2 Id,Name,Pic_slt,Tuijiang From Pic Where Tuijiang=1 order by id desc"
rsp.Open sql,Conn
if rsp.bof and rsp.eof then
	
else
%>
      </div>
      <table width="175" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="87"><a href="pic_info.asp?id=<%=rsp("id")%>"><img src="admin/<%=rsp("pic_slt")%>" width="106" height="84" border="0" style="border:1px solid #CCCCCC;"></a></td>
          <td width="88"></td>
        </tr>
        <tr> 
          <td height="20"><div align="center"><%=rsp("name")%></div></td>
          <td height="20">&nbsp;</td>
        </tr>
        <% rsp.movenext %>
        <tr> 
          <td><a href="pic_info.asp?id=<%=rsp("id")%>"><img src="admin/<%=rsp("pic_slt")%>" width="106" height="84" border="0" style="border:1px solid #CCCCCC;"></a></td>
          <td></td>
        </tr>
        <tr> 
          <td height="20"><div align="center"><%=rsp("name")%></div></td>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
      <%
end if
rsp.close
set rsp=nothing
%>
    </td>
  </tr>

