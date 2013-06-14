
<!--#include file="admin_common/conn.asp" -->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#000000">后台用户管理</font></div>    </td>
  </tr>
  <tr> 
    <td> 
      <br /><table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr> 
          <td width="23%" height="25" bgcolor="f1f1f1"> 
            <div align="center">管理员</div>          </td>
          <td width="21%" bgcolor="f1f1f1"> 
            <div align="center">密 码</div>
          </td>
          <td width="31%" bgcolor="f1f1f1"> 
            <div align="center">权 限</div>
          </td>
          <td width="25%" bgcolor="f1f1f1"> 
            <div align="center">操 作</div>
          </td>
        </tr>
        <%set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from master order by flag",conn,1,1
        do while not rs.EOF%>
        <form name="form1" method="post" action="saveadmin.asp?action=edit&id=<%=int(rs("id"))%>">
          <tr> 
            <td> 
              <div align="center"> 
                <input name="admin" type="text" size="12" value="<%=trim(rs("name"))%>">
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input name="password" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <%select case rs("flag")
                case "1"
                response.Write "<input type=radio name=flag value=1 checked>管理&nbsp;<input name=flag type=radio value=2 >添加&nbsp;<input type=radio name=flag value=3>查看"
                case "2"
                response.Write "<input type=radio name=flag value=1>管理&nbsp;<input name=flag type=radio value=2 checked>添加&nbsp;<input type=radio name=flag value=3>查看"
				case "3"
				response.Write "<input type=radio name=flag value=1>管理&nbsp;<input name=flag type=radio value=2>添加&nbsp;<input type=radio name=flag value=3  checked>查看"
                end select%>
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input type="submit" name="Submit" value="修 改" >
                &nbsp;<input type="button" value="删 除" onclick="if (confirm('确实要此条记录吗？')) window.location='saveadmin.asp?id=<%=int(rs("id"))%>&action=del'">
              </div>
            </td>
          </tr>
        </form>
        <%rs.movenext
        loop
        rs.close
        set rs=nothing
        %>
      </table>
    <br /></td>
  </tr>
</table>
<br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#000000">后台用户添加</font></div>    </td>
  </tr>
  <tr> 
    <td> 
     <br /> <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr> 
          <td width="21%" height="25" bgcolor="f1f1f1"> 
            <div align="center">管理员</div>          </td>
          <td width="23%" bgcolor="f1f1f1"> 
            <div align="center">密 码</div>
          </td>
          <td width="35%" bgcolor="f1f1f1"> 
            <div align="center">权 限</div>
          </td>
          <td width="21%" bgcolor="f1f1f1"> 
            <div align="center">操 作</div>
          </td>
        </tr>
        <form name="form1" method="post" action="saveadmin.asp?action=add">
          <tr> 
            <td> 
              <div align="center"> 
                <input name="admin2" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input name="password2" type="text" size="12" >
              </div>
            </td>
            <td> 
              <div align="center"> 
                <input type="radio" name="flag2" value="1">
                管理 
                <input name="flag2" type="radio" value="2" checked>
                添加 
                <input type="radio" name="flag2" value="3">
                查看</div>
            </td>
            <td> 
              <div align="center"> 
                <input type="submit" name="Submit2" value="添 加" >
              </div>
            </td>
          </tr>
        </form>
      </table>
      <br />
    </td>
  </tr>
</table>
<br />
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td  rowspan="2"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="22"> 
                              <div align="center"><font color="#000000">操作注意事项及说明</font></div>
                            </td>
                          </tr>
                          <tr> 
                            <td height="38"> 
                              <table width="80%" border="0" align="center" cellpadding="5" cellspacing="0">
                                <tr> 
                                  <td height="48"><font color="#FF0000">·后台管理用户与前台用户毫无牵连。<br />
                                    ·添加人员只能添加,修改,删除资料。<br />
                                    ·查看人员可以管理用户订单。<br />
                                    ·管理员拥有本站所有管理权限。<br />
                                    ·登陆密码采用MD5不可逆转方式加密，如不修改密码，请留空。 </font></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
