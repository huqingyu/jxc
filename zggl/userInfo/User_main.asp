<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/WebConfig.asp"-->
<!--#include file="../common//md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
<title><%=webname%>--会员资料</title>
</head>
<%
dim uid ,upwd
uid=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [userb] where username='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body bgcolor="#ffffff" scroll="no" style="margin:0px">
<br>
<div align="center">
    <%
dim action
action=trim(request("action"))
select case action
case ""
myinfo()
case "EditUserinfo"
EditUserinfo()
case "delok"
delok
case "editpass"
editpass()
case "savepass"
savepass()
case "payjilu"
payjilu()
case "editok"
editok()
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub myinfo()%>
    <div align="center">
      <table width="95%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <tr>
          <td height="35" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>
              <%if request.Cookies("Gemisum")("reglx")=3 then
response.write ""&request.Cookies("Gemisum")("username")&"(企业会员)"
else
response.write ""&request.Cookies("Gemisum")("username")&"(普通会员)"
end if%>
              (ID：<%=rs("id")%>)会员资料</b></font></div></td>
        </tr>
        <tr>
          <td height="25" colspan="2"> 你现在拥有<font color="#ff0000"><b><%=rs("jifen")%></b></font>点积分 ，预存款：<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
        </tr>
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif">会员状态</td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">上次进站时间:</td>
          <td width="74%"><%=rs("lastlogin")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">上线次数:</font></td>
          <td width="74%"><%=rs("logins")%></td>
        </tr>
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif">会员基本资料</td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">用户名:</td>
          <td width="74%"><%=rs("username")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">性别:</td>
          <td width="74%"><%=rs("sex")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">E-mail:</td>
          <td width="74%"><%=rs("email")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">注册日期:</td>
          <td width="74%"><%=rs("regdate")%></td>
        </tr>
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif">会员补充资料</td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">真实姓名:</font></td>
          <td width="74%"><%=rs("name")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">邮编:</font></td>
          <td width="74%"><%=rs("zip")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">联系电话:</td>
          <td width="74%"><%=rs("telphone")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">联系地址:</td>
          <td width="74%"><%=rs("address")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">身份证编号:</td>
          <td width="74%"><%=rs("idcard")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">出生日期:</td>
          <td width="74%"><%=rs("birthday")%></td>
        </tr>
        <tr>
          <td width="26%" height="25" align="right" bgcolor="#EFEFEF">工作:</td>
          <td width="74%"><%=rs("work")%></td>
        </tr>
      </table>
    </div>
    <%end sub
sub EditUserinfo()
%>
    <div align="center">
      <table width="95%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <form name="form1" method="post" action="User_main.asp?action=editok&id=<%=rs("id")%>">
          <tr>
            <td height="35" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>修改会员资料</b></font></div></td>
          </tr>
          <tr>
            <td height="25" colspan="2"> 你现在拥有<font color="#ff0000"><b><%=rs("jifen")%></b></font>点积分 ，预存款：<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
          </tr>
          <tr>
            <td height="30" colspan="2" background="Images/topBar_bg.gif">会员基本资料</td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">用户名:</td>
            <td width="74%"><input name="username" type="text" value="<%=rs("username")%>" readonly="true"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">性别:</td>
            <td width="74%"><input name="sex" type="text" value="<%=rs("sex")%>"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">E-mail:</font></td>
            <td width="74%"><input name="email" type="text" value="<%=rs("email")%>"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">注册日期:</font></td>
            <td width="74%"><input name="regdate" type="text" value="<%=rs("regdate")%>" readonly="true"></td>
          </tr>
          <tr>
            <td height="30" colspan="2" background="Images/topBar_bg.gif">会员补充资料</td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">真实姓名:</td>
            <td width="74%"><input name="name" type="text" value="<%=rs("name")%>"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">邮编:</td>
            <td width="74%"><input name="zip" type="text" value="<%=rs("zip")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">联系电话:</td>
            <td width="74%"><input name="telphone" type="text" value="<%=rs("telphone")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">联系地址:</td>
            <td width="74%"><input name="address" type="text" value="<%=rs("address")%>"></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">身份证编号:</td>
            <td width="74%"><input name="idcard" type="text" value="<%=rs("idcard")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
          </tr>
		  <!--___________企业用户资料______-->
		  <%if request.Cookies("Gemisum")("reglx")=3 then%>
		  <tr> 
            <td width="26%" height="25" ><div align="right">公司名称：</div></td>
            <td> 
              <input name=Qy_Name type=text id="Qy_Name" value="<%=trim(rs("Qy_Name"))%>" size="35" >              </td>
          </tr>
		            <tr> 
            <td width="26%" height="25" ><div align="right">公司电话：</div></td>
            <td> 
              <input name=Qy_Tel type=text id="Qy_Tel" value="<%=trim(rs("Qy_Tel"))%>" size="25"></td>
          </tr>
		            <tr> 
            <td width="26%" height="25" ><div align="right">公司E-Mail：</div></td>
            <td> 
              <input name=Qy_Email type=text id="Qy_Email" value="<%=trim(rs("Qy_Email"))%>" size="25"></td>
          </tr>
		  <% end if%>
		  <!--_____________________________-->
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">出生日期:</td>
            <td width="74%"><input name="birthday" type="text" value="<%=rs("birthday")%>">
                <font color="#FF0000">（格式：年-月-日）</font></td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">工作:</td>
            <td width="74%"><input name="work" type="text" value="<%=rs("work")%>"></td>
          </tr>
          <tr align="center">
            <td height="35" colspan="2" bgcolor="#EFEFEF"><input type="submit" name="Submit" value="提交修改">
&nbsp;
          <input type="reset" name="Submit2" value="重设表单"></td>
          </tr>
        </form>
      </table>
    </div>
    <%end sub
sub editpass()
%>
    <script language=JavaScript>
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function passcheck()
{
    if(document.userpass.userpassword.value.length < 6 || document.userpass.userpassword.value.length >20) {
	document.userpass.userpassword.focus();
    alert("密码长度不能不能这空，在6位到20位之间，请重新输入！");
	return false;
  }
   if(document.userpass.userpassword.value!==document.userpass.userpassword2.value) {
	document.userpass.userpassword.focus();
    alert("对不起，两次密码输入不一样！");
	return false;
  }
   if(checkspace(document.userpass.quesion.value)) {
	document.userpass.quesion.focus();
    alert("对不起，请填写密码提问！");
	return false;
  }
}
    </script>
    <%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb] where username='"&request.cookies("Gemisum")("username")&"' ",conn,1,1
%>
    <table width=323 border=0 align=center cellpadding=0 cellspacing=0 class="table-zuoshang">
      <form name="userpass" method="post" action="userinfo.asp?action=savepass">
        <tr class="a1">
          <td height="42" colspan=2 class="table-xiayou">
            <div align="center"><font color=#FF0000>尊敬的用户，我们向您承诺：<br>
          以下信息将被严格保密，绝对不提供给第三方或用作它用。</font></div></td>
        </tr>
        <tr class="a1">
          <td height="25" class="table-xiayou"><div align="right">用 户 名：</div></td>
          <td class="table-xiayou"><font color=#FF6600><%=request.cookies("Gemisum")("username")%></font></td>
        </tr>
        <tr>
          <td height=25 bgcolor=#ffffff class="table-xiayou">
            <div align="right">原密码：</div></td>
          <td height=22 bgcolor=#ffffff class="table-xiayou"><input name=userpassword3 type=password id="userpassword3" value="" size="16"></td>
        </tr>
        <tr>
          <td height=25 bgcolor=#ffffff class="table-xiayou">
            <div align="right">新 密 码： </div></td>
          <td height=22 bgcolor=#ffffff class="table-xiayou">
            <input name=userpassword type=password value="" size="16">
        (不修改请为空) </td>
        </tr>
        <tr>
          <td height=25 bgcolor=#ffffff class="table-xiayou">
            <div align="right">密码确认： </div></td>
          <td height=22 bgcolor=#ffffff class="table-xiayou">
            <input name=userpassword2 type=password value="" size="16">
          </td>
        </tr>
        <tr align="center">
          <td height=25 bgcolor=#ffffff colspan="2" class="table-xiayou">
            <div align="center">
              <input name="Submit2" type="submit" value="提交保存" onclick='return passcheck();'>
          </div></td>
        </tr>
      </form>
    </table>
    <%rs.close
set rs=nothing
end sub
sub editok()
id=request("id")
set rse=server.createobject("adodb.recordset")
sqle="select * from userb where id="&id
rse.open sqle,conn,3,3
rse("username")=request.form("username")
rse("name")=request.form("name")
rse("sex")=request.form("sex")
rse("email")=request.form("email")
rse("zip")=request.form("zip")
rse("telphone")=request.form("telphone")
rse("address")=request.form("address")
rse("idcard")=request.form("idcard")
rse("Qy_Name")=request.form("Qy_Name")
rse("Qy_Tel")=request.form("Qy_Tel")
rse("Qy_Email")=request.form("Qy_Email")
if request.form("birthday")<>"" Then
rse("birthday")=request.form("birthday")
End if
rse("work")=request.form("work")

rse.update
rse.close
response.Write "<script language=javascript>alert('用户资料更改成功！');history.go(-1);</script>"
end sub
sub savepass()
dim username
username=request.Cookies("Gemisum")("username")
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb] where username='"&username&"'",conn,1,3
if md5(trim(request("userpassword3")))<>trim(rs("userpassword")) then
response.Write "<script language=javascript>alert('对不起，您输入的原密码错误！');history.go(-1);</script>"
response.End
else
if trim(request("userpassword"))<>"" then
rs("userpassword")=md5(trim(request("userpassword")))
end if
rs.update
rs.close
set rs=nothing
response.Write "<script language=javascript>alert('密码更改成功！');window.location.href='"&request.servervariables("http_referer")&"';</script>"
response.End
end if
end sub
sub payjilu()
dim u
use=request.Cookies("Gemisum")("username")
topb="select * from payjilu where username = '"&use&"'"
set rsp=conn.execute (topb)
%>
    <table width="460" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
      <tr>
        <td width="43" height="30"><div align="center">编号</div></td>
        <td width="74"><div align="center">交易项目</div></td>
        <td width="146"><div align="center">交易名称</div></td>
        <td width="95"><div align="center">交易价格</div></td>
        <td width="90"><div align="center">交易时间</div></td>
      </tr>
      <%while not rsp.eof%>
      <tr>
        <td height="25"><div align="center"><%=rsp("id")%></div></td>
        <td><div align="center"><%=rsp("type")%></div></td>
        <td><div align="center"><%=rsp("name")%></div></td>
        <td><div align="center"><%=rsp("jiage")%> RMB</div></td>
        <td><div align="center"><%=rsp("paytime")%></div></td>
      </tr>
      <%
rsp.movenext
wend
rsp.close
end sub%>
    </table>
</div>
</body>
</html>
<%
conn.close
%>
