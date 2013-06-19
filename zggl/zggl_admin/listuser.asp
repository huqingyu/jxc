
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%dim userid
		userid=request.querystring("id")
		set rs=server.createobject("adodb.recordset")
		rs.open "select * from [userb] where id="&userid ,conn,1,1%>
<br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#FF0000">用户详细资料</font></div>    </td>
  </tr>
  <tr> 
    <td height="163" valign="top"> 
      <form name="form1" method="post" action="saveuser.asp?action=save&id=<%=userid%>">
        <br />
        <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
          <tr> 
            <td width="20%" height="25" ><div align="right">用户名称：</div></td>
            <td width="15%" ><font color=#FF0000><%=trim(rs("username"))%>　　　　 
              </font></td>
            <td width="65%"><font color=#FF0000>用户类型</font><font color=#FF0000> 
              <select name="reglx" >
                <option value="1" <%if rs("reglx")=1 then%>selected<%end if%>>普通会员</option>
                <option value="2" <%if rs("reglx")=2 then%>selected<%end if%>>VIP会员</option>
				<option value="3" <%if rs("reglx")=3 then%>selected<%end if%>>企业会员</option>
              </select>
               高级会员期限 </font> 
              <input type="text" name="vipdate" size="10" value="<%=rs("vipdate")%>" >
              (普通会员没有时间限制)</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">登陆密码：</div></td>
            <td colspan="2"> 
              <input name="userpassword" type="text" id="userpassword" size="12" >
              不改密码请为空!</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">真实姓名：</div></td>
            <td colspan="2"> 
              <input name="name" type="text" id="name" size="12" value="<%=trim(rs("name"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">电子邮件：</div></td>
            <td colspan="2"> 
              <input name="email" type="text" id="email" value="<%=trim(rs("email"))%>">
              </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">身份证号码：</div></td>
            <td colspan="2"> 
              <input name=idcard type=text id="idcard" onKeyPress="event.returnValue=IsDigit();" value="<%=trim(rs("idcard"))%>" size="20" maxlength="18">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">性别：</div></td>
            <td colspan="2"> 
              <input type="radio" name="sex" value="男" <%if rs("sex")="男" then%>checked<%end if%>>
              男　　 
              <input type="radio" name="sex" value="女" <%if rs("sex")="女" then%>checked<%end if%>>
              女</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">详细地址：</div></td>
            <td colspan="2"> 
              <input name="address" type="text" id="address" size="35" value="<%=trim(rs("address"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">邮编：</div></td>
            <td colspan="2"> 
              <input name="zip" type="text" id="zip" size="12" value="<%=rs("zip")%>" maxlength=6 onKeyPress="event.returnValue=IsDigit();">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">联系电话：</div></td>
            <td colspan="2"> 
              <input name="telphone" type="text" id="telphone" size="12" value="<%=trim(rs("telphone"))%>">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">工作：</div></td>
            <td colspan="2"> 
              <input name=work type=text id="work" value="<%=trim(rs("work"))%>" size="35">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">预存款：</div></td>
            <td colspan="2"> 
              <input name=yucun type=text value="<%=trim(rs("yucun"))%>" size="10" maxlength="8" onkeyup="if(isNaN(value))execCommand('undo')">
            </td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">积分：</div></td>
            <td colspan="2"> 
              <input name=jifen type=text value="<%=trim(rs("jifen"))%>" size="10" maxlength="8" onkeyup="if(isNaN(value))execCommand('undo')">
              (交易成功后管理员可在此给用户积分)</td>
          </tr>
		  <!--___________企业用户资料______-->
		  <%if rs("reglx")=3 then%>
		  <tr> 
            <td width="20%" height="25" ><div align="right">公司名称：</div></td>
            <td colspan="2"> 
              <input name=Qy_Name type=text id="Qy_Name" value="<%=trim(rs("Qy_Name"))%>" size="35" >              </td>
          </tr>
		            <tr> 
            <td width="20%" height="25" ><div align="right">公司电话：</div></td>
            <td colspan="2"> 
              <input name=Qy_Tel type=text id="Qy_Tel" value="<%=trim(rs("Qy_Tel"))%>" size="25"></td>
          </tr>
		            <tr> 
            <td width="20%" height="25" ><div align="right">公司E-Mail：</div></td>
            <td colspan="2"> 
              <input name=Qy_Email type=text id="Qy_Email" value="<%=trim(rs("Qy_Email"))%>" size="25"></td>
          </tr>
		  <% end if%>
		  <!--_____________________________-->
		  
          <tr> 
            <td width="20%" height="25" ><div align="right">注册时间：</div></td>
            <td colspan="2"><%=rs("regdate")%></td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">最后登陆：</div></td>
            <td colspan="2"><%=rs("lastlogin")%></td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">登陆次数：</div></td>
            <td colspan="2"><%=rs("logins")%>次</td>
          </tr>
          <tr> 
            <td width="20%" height="25" ><div align="right">已下订单数：</div></td>
            <td colspan="2"> 
              <%dim rs2
			set rs2=server.CreateObject("adodb.recordset")
			rs2.open "select id from [payjilu] where username='"&trim(rs("username"))&"'",conn,1,1
			response.write rs2.recordcount&"笔订单"
			rs2.close
			set rs2=nothing
			%>
            </td>
          </tr>
          <%rs.close
			set rs=nothing
			conn.close
			set conn=nothing%>
          <tr> 
            <td height="28" colspan="3"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="确认提交">
                &nbsp;&nbsp;&nbsp; 
                <input type="button" name="Submit2" value="返回上一页" onClick='javascript:history.go(-1)'>
              </div>
            </td>
          </tr>
        </table>
      <br /></form>
    </td>
  </tr>
</table>
</body>
</html>
