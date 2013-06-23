<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<!--#include file="md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css">
<title><%=webname%>--会员资料</title>
</head>
<%
dim uid ,upwd
uid=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [userb] where username='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body>
<div align="center">
    <TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD width="35%" height="81" align=left 
                  bgColor=#ffffff class=b><div align="center"><img src="../<%=weblogo%>"></div></TD>
          <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff class=b><div align="center"><img src="../<%=webbanner%>"></div></TD>
        </TR>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 class=9>
              <TBODY>
                <TR>
                  <TD align=left vAlign=middle background="../images/top_bar.gif" class=b>
                  <div align="center"><FONT color=#ffffff><a href="/"><FONT color=#ffffff>首页</Font></a> | <a href="../News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="../xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="../hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="../ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="../guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="../pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="../Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | <a href="userInfo.asp"><font color="#FFFFFF">会员中心</font></a> | <a href="../Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="../images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE>
    <TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="../images/top_nav_menu.gif">
      <TBODY>
        <TR bgColor=#ffffff>
          <TD colSpan=3 height=2></TD>
        </TR>
        <TR>
          <TD width="44" height=25 align=right><img src="../images/arrow3.gif" width="29" height="11"></TD>
          <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="/">网站的首页</a> &gt;&gt; 会员资料</TD>
          <TD width="11">&nbsp;</TD>
        </TR>
      </TBODY>
    </TABLE>
  <table border="0" cellspacing="0" width="770">
    <tr>
      <td height="3" valign="top" colspan="3">
        <hr color="#FF0000" size="1">
      </td>
    </tr>
    <tr>
      <td width="24%" valign="top" bgcolor="#6688CC"><div align="center">
          <table border="0" width="100%" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp"><font color="#FFFFFF">个人资料</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=EditUserinfo"><font color="#FFFFFF">修改个人资料</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=pay"><font color="#FFFFFF">在线支付</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=editpass"><font color="#FFFFFF">修改口令</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=payjilu"><font color="#FFFFFF">我的交易记录</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="logout.asp"><font color="#FFFFFF">注销退出</font></a></td>
            </tr>
          </table>
        </div>      </td>
      <td width="1%" height="273" rowspan="2"></td>
      <td width="75%" rowspan="2" valign="top">
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
case "pay"
pay()
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
sub myinfo()%><div align="center">
          <table width="100%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
            <tr>
              <td height="35" colspan="2" background="../Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b> 会员资料</b></font></div></td>     
            </tr>
            <tr>
              <td height="25" colspan="2">
                    你现在拥有<font color="#ff0000"><b><%=rs("jifen")%></b></font>点积分
，预存款：<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">会员状态</td>
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
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">会员基本资料</td>
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
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">会员补充资料</td>
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
        </div><%end sub
sub EditUserinfo()
%><div align="center">
          <table width="100%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
            <form name="form1" method="post" action="UserInfo.asp?action=editok&id=<%=rs("id")%>">
<tr>
              <td height="35" colspan="2" background="../Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>修改会员资料</b></font></div></td>     
            </tr>
            <tr>
              <td height="25" colspan="2">
                    你现在拥有<font color="#ff0000"><b><%=rs("jifen")%></b></font>点积分 ，预存款：<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">会员基本资料</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">用户名:</td>
              <td width="74%"><input name="username" type="text" value="<%=rs("username")%>"></td>
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
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">会员补充资料</td>
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
      <td height="42" colspan=2 class="table-xiayou"> <div align="center"><font color=#FF0000>尊敬的用户，我们向您承诺：<br>
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
        </div>
      </td>
    </tr>
  </form>
</table>
<%rs.close
set rs=nothing
end sub
sub pay()
%>
<script language='JavaScript'>
function conFirmv_amount()
{
	document.E_FORM.v_amount.value=Math.round(document.E_FORM.v_amount.value);
	if ( document.E_FORM.v_amount.value <= 0 )
	{
	alert('金额必须大于0');
    return false;
	}
	var stConFirm = '您的转帐金额为: ' + document.E_FORM.v_amount.value + ' 元!\n';
	return confirm(stConFirm);
}
</script>

	<center>
    <table width="430">
      <form method="post" action="checklist.asp" name="E_FORM" onSubmit="conFirmv_amount();" target="_blank">
	  <tr> 
        <td height="37" colspan="2" align="right"><div align="center"><img src="images/logo4.gif" border="0" width="200" height="79" alt="本网站采用网银在线安全支付平台"></div></td>
        </tr>
	  <tr>
	    <td width="26%" align="right">用户名:</td>
	    <td width="74%"><input name="dinghuorenxingming" type="text" value="<%=request.cookies("Gemisum")("username")%>" size="20" maxlength="35"></td>
	  </tr>      
	  <tr> 
        <td align="right">存入金额:</td>
        <td><input name="v_amount" type=text onkeyup="if(isNaN(value))execCommand('undo')" value="1.00" size="20">
          譬如：<font color="#FF0000">1.00</font></td>
      </tr>
      <tr>
        <td colspan="2" align="right"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">你在线支付成功之后我们，系统会自动存入你的预存款中，你可以使用预存款中的金额选择你所需要的服务,本系统是通过中国网银在线支付系统支付的，你可以放心使用，有任何问题请致电(<%=dianhua%>)我们热忱为你服务!</font></div></td>
        </tr>
      <tr>
        <td colspan="2" align="right"><div align="center">
          <input type=submit name=v_action value="提交" onClick="MM_validateForm('dinghuorenxingming','','R');return document.MM_returnValue">
        </div></td>
      </tr>
    </form>
	</table>
	</center>
<%end sub
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
rse("birthday")=request.form("birthday")
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
  <%while not rsp.eof%><tr>
    <td height="25"><div align="center"><%=rsp("id")%></div></td>
    <td><div align="center"><%=rsp("type")%></div></td>
    <td><div align="center"><%=rsp("name")%></div></td>
    <td><div align="center"><%=rsp("jiage")%> RMB</div></td>
    <td><div align="center"><%=rsp("paytime")%></div></td>
    </tr><%
rsp.movenext
wend
rsp.close
end sub%>
</table>

      </td>
    </tr>
  </table>
  <TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></TD>
        <TD 
height=25 align=middle background=../images/foot_patt01.gif><a href="/">网站首页</a> | <a href=../about.asp?action=about >关于我们</a> | <a href=../about.asp?action=lxwm >业务联系</a> | <a href=../help.asp?action=shiyongfalv >版权声明</a> | <a href=../help.asp?action=fukuan >付款方式</a> | <a href=../gbook.asp >留言/建议/投诉</a></TD>
        <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></TD>
      </TR>
      <TR>
        <TD height=60><div align="center">
            <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"　邮政编码："&youbian&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write "　页面执行时间："&FormatNumber((endtime-startime)*1000,3)&" 毫秒"
%>
        </div></TD>
      </TR>
    </TBODY>
  </TABLE>
  </center>
</div>

</body>

</html>
<%
rs.close
conn.close
%>
