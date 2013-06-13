<%
Response.Redirect "/UserInfo/User_reg.asp"
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="admin/system/webconfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<%
dim action
action=request.QueryString("action")%>
<html><head><title><%=webname%>--新用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkuserinfo()
{
   if(checkspace(document.userinfo.username.value)) {
	document.userinfo.username.focus();
    alert("对不起，请填写用户名！");
	return false;
  }
    if(checkspace(document.userinfo.userpassword.value) || document.userinfo.userpassword.value.length < 6 || document.userinfo.userpassword.value.length >20) {
	document.userinfo.userpassword.focus();
    alert("密码长度不能不能这空，在6位到20位之间，请重新输入！");
	return false;
  }
    if(document.userinfo.userpassword.value != document.userinfo.userpassword1.value) {
	document.userinfo.userpassword.focus();
	document.userinfo.userpassword.value = '';
	document.userinfo.userpassword1.value = '';
    alert("两次输入的密码不同，请重新输入！");
	return false;
  }

 if(document.userinfo.useremail.value.length!=0)
    if (document.userinfo.useremail.value.charAt(0)=="." ||        
         document.userinfo.useremail.value.charAt(0)=="@"||       
         document.userinfo.useremail.value.indexOf('@', 0) == -1 || 
         document.userinfo.useremail.value.indexOf('.', 0) == -1 || 
         document.userinfo.useremail.value.lastIndexOf("@")==document.userinfo.useremail.value.length-1 || 
         document.userinfo.useremail.value.lastIndexOf(".")==document.userinfo.useremail.value.length-1)
     {
      alert("Email地址格式不正确！");
      document.userinfo.useremail.focus();
      return false;
      }
if(checkspace(document.userinfo.useremail.value)) {
   alert("Email不能为空！");
   document.userinfo.useremail.focus();
   return false;
   }
   if(checkspace(document.userinfo.userzhenshiname.value)) {
	document.userinfo.userzhenshiname.focus();
    alert("对不起，请填写真实姓名！");
	return false;
  }
   if(checkspace(document.userinfo.idcard.value)) {
	document.userinfo.idcard.focus();
    alert("对不起，请填写真实身份证！");
	return false;
  }
     if(checkspace(document.userinfo.work.value)) {
	document.userinfo.work.focus();
    alert("对不起，请填写你工作！");
	return false;
  }
  if(checkspace(document.userinfo.address.value)) {
	document.userinfo.address.focus();
    alert("对不起，请填写详细地址！");
	return false;
  }
  if(checkspace(document.userinfo.youbian.value)) {
	document.userinfo.youbian.focus();
    alert("对不起，请填写邮编！");
	return false;
  }
  if(document.userinfo.youbian.value.length!=6) {
	document.userinfo.youbian.focus();
    alert("对不起，请正确填写邮编！");
	return false;
  } 
    if(checkspace(document.userinfo.usertel.value)) {
	document.userinfo.usertel.focus();
    alert("对不起，请留下您的联系电话！");
	return false;
  }
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function showmm(Qy){
if(Qy.style.display=="none"){
Qy.style.display="";
}else{
Qy.style.display="none";
}
}
//-->
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onMouseOver="window.status='【<%=webname%>】<%=weburl%> 如果您喜欢本站,别忘了把本站介绍给您的好友哦！：）';return true">
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/top.jpg" tppabs="/img/top.jpg" width="980" height="81" border="0" usemap="#Map"></td>
  </tr>
</table>
<table width="980" height="30" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="539">&nbsp;<img src="img/shouye.gif" tppabs="/img/shouye.gif" width="11" height="11"><span class="word1"><A 
            onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('index.htm'/*tpa=/*/);return false;" 
            href="index.htm#" tppabs="/#">设为首页</A> <img src="img/shoucang.gif" tppabs="/img/shoucang.gif" width="11" height="11"> <A  
            href="javascript:window.external.AddFavorite('index.htm'/*tpa=/*/,%20'河南省中国国际旅行社')">加入收藏</A></span></td>
    <td width="401"><span class="STYLE1">咨询热线：0371-65852305 65852352 13903817736</span></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center" ><table width="930"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60" height="36" align="center" background="img/over_sample.gif" tppabs="/img/over_sample.gif" class="menu2"><a href="index.asp" tppabs="/index.asp"><font color="ffffff">首 页</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/about.asp?action=about" tppabs="/inguolv.asp"><font color="#0D7DC8">走进国旅</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=64" tppabs="/news.asp"><font color="#0D7DC8">新闻中心</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/cjy.asp" tppabs="/category.asp?category=1&categoryname=出境游"><font color="#0D7DC8">出境游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/gny.asp" tppabs="/category.asp?category=2&categoryname=国内游"><font color="#0D7DC8">国内游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/sny.asp" tppabs="/category.asp?category=3&categoryname=省内游"><font color="0D7DC8">省内游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/" tppabs="/newest.asp"><font color="#0D7DC8">最新线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/glxl.asp" tppabs="/guolv.asp"><font color="#0D7DC8">国旅线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/tjxl.asp" tppabs="/special.asp"><font color="#0D7DC8">特价线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/djy.asp" tppabs="/category.asp?category=4&categoryname=地接游"><font color="#0D7DC8">地接游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=67" tppabs="/jingqu.asp"><font color="#0D7DC8">河南景区</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/hotel.asp" tppabs="/hotel.asp"><font color="#0D7DC8">河南酒店</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=70" tppabs="/zhinan.asp"><font color="#0D7DC8">旅游指南</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=76" tppabs="/changshi.asp"><font color="#0D7DC8">旅游常识</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=66" tppabs="/qianzheng.asp"><font color="#0D7DC8">签 证</font></a></td>
          <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=75" tppabs="http://m.citshn.com/" target="_blank"><font color="#0D7DC8">会议考察</font></a></td>
      </tr>
    </table></td>
  </tr>
</table>


<map name="Map" id="Map"><area shape="rect" coords="837,44,909,66" href="javascript:if(confirm('http://www.hnggw.net.cn/  \n\n文件并未依 Teleport Pro 取回，因为 它的域或路径超过开始网址中设置的范围。  \n\n你要从服务器上打开它吗？'))window.location='http://www.hnggw.net.cn/'" tppabs="http://www.hnggw.net.cn/" /><area shape="rect" coords="836,16,910,39" href="javascript:if(confirm('http://en.citshn.com/  \n\n文件并未依 Teleport Pro 取回，因为 它的域或路径超过开始网址中设置的范围。  \n\n你要从服务器上打开它吗？'))window.location='http://en.citshn.com/'" tppabs="http://en.citshn.com/" />
</map>




<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" bgcolor="0D7DC8">&nbsp;</td>
  </tr>
  <tr>
    <td height="15" colspan="3" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td width="78" align="center" bgcolor="#015AB6"><img src="img/1.jpg" tppabs="/img/1.jpg" width="51" height="193"></td>
    <td width="786" align="center" bgcolor="#015AB6"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="780" height="226">
      <param name="movie" value="img/flash.swf" tppabs="/img/flash.swf">
      <param name="quality" value="high">
      <embed src="img/flash.swf" tppabs="/img/flash.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="780" height="226"></embed>
    </object></td>
    <td width="78" align="center" bgcolor="#015AB6"><img src="img/2.jpg" tppabs="/img/2.jpg" width="50" height="188"></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="618"><table width="621" border="0" align="left" cellpadding="0" cellspacing="0">
      <form action="/UserInfo/User_CheckLogin.asp" method="post" name="Login" id="Login" onSubmit="return CheckForm();">
        <tr>
          <td width="3%"><img src="img/member.gif" tppabs="/img/member.gif" width="12" height="20" /></td>
          <td width="9%" align="center" class="menu1">用户名：</td>
          <td width="16%" class="menu1"><input type="text"  name="username" size="14" class='an5'>
          </td>
          <td width="8%" align="center" class="menu1">密码：</td>
          <td width="20%" class="menu1"><input type="password"  name="userpassword" size="14" class='an5'>
                <input name="ComeUrl" type="hidden" id="ComeUrl" value="index.asp" />
          </td>
		  <td width="8%" align="center" class="menu1">密码：</td>
          <td width="18%" class="menu1"><input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6 class="an6"> <img src=GetCode.asp></td>
          <td width="9%"><input name="image" type="image" src="img/login.gif" width="48" height="19" border="0" tppabs="/img/login.gif" /></td>
          <td width="9%" class="menu1"><a href="/User_Reg.asp" tppabs="/User_Reg.asp" target="_blank">免费注册</a></td>
        </tr>
      </form>
    </table></td>
    <td width="350"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8%"><img src="img/news.gif" tppabs="/img/news.gif" width="23" height="18" /></td>
        <td width="19%"><span class="menu1">本站公告：</span></td>
        <td width="73%"><marquee direction= "left" scrollamount="2" scrolldelay="5" class="word1"  onmouseover="this.stop()" onMouseOut="this.start()">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 1 * from news where mytype=63 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="25"><a href="show.asp?id=<%=rs("id")%>" target="_blank"> <%=left(rs("bt"),14)%> </a></td>
            </tr>
            <% rs.movenext 
wend 
			 %>
          </table>
        </marquee></td>
      </tr>
    </table></td>
  </tr>
</table>
    <TABLE width="980" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
      <TBODY>
        <TR bgColor=#ffffff>
          <TD colSpan=3 height=2></TD>
        </TR>
        <TR>
          <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></TD>
          <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a> &gt;&gt; 会员注册</TD>
          <TD width="11">&nbsp;</TD>
        </TR>
      </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=980 align=center border=0 style="BORDER-LEFT: #d8d8d8 1px solid;BORDER-RIGHT: #d8d8d8 1px solid;">
  <TBODY>
    <TR>
      <TD class=b vAlign=top align=left width=980><%select case action
case ""%>
        <table width="760" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td height="22" bgcolor="#FFFFFF" bordercolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><table width="80%" align="center" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="40" align="center"><font color=red><strong>请用户仔细阅读<%=webname%>注册条约捞固瘤</strong></font></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="80%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
                            <tr bgcolor="#ffffff">
                              <td><%call tiaoyue()%>
                              </td>
                            </tr>
                        </table></td>
                      </tr>
                    </table>
                      <table name=agree border="0" cellpadding="10" cellspacing="0" align=center width="80%">
                        <tr align=center>
                          <td width="50%" align="right">
						  <FORM name=register method=post action=User_Reg.asp?action=yes>
                              <input type="hidden" name="action" value="agree">
                              <INPUT class="go-wenbenkuang" type=submit value=" 同意注册 " name=Submit>
                          </FORM></td>
                          <td width="50%" align="left"><FORM action="/default.htm" method=post>
                              <INPUT class=go-wenbenkuang type=submit value=" 我不同意 ">
                          </FORM></td>
                        </tr>
                    </table></td>
                </tr>
            </table></td>
          </tr>
        </table>
        <SCRIPT>
	secs = 60; // Number of secs to delay -CHINA-studio
	wait = secs * 100;
	document.forms.register.Submit.disabled =true;
	for(i=1;i<=(wait/100);i++) {
		window.setTimeout("doUpdate(" + i + ")", i * 100);
	}
	window.setTimeout("Timer()", wait);

	function doUpdate(num) {
		if(num == (wait/100)) {
			document.forms.register.Submit.value = " 同意注册 ";
		} else {
			wut = (wait/100)-num;
			document.forms.register.Submit.value = " 同意前请先阅读 (" + wut + ")";
		}
	}

	function Timer() {
		document.forms.register.Submit.disabled =false;
}
        </SCRIPT>
        <%case "yes"%>
        <table width="970" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center"><font color="#FF3300"><b><br>
                    请您务必详细填写您的信息，并核对无误，国内用户请留下您的真实中文姓名。<br>
              未经您的允许，您的个人信息对外保密。(带 <font color=red>*</font> 号为必填项) </b></font>
                      <form name=userinfo method=post action=User_Reg.asp?action=save>
                        <table width="80%" border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" align="center">
                          <tr>
                            <td height=30 colspan=2 background="Images/topBar_bg.gif"><font color="#FF3300"><img src="Images/ring01.gif" width="9" height="9"> 用户名和密码</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>用 户 名：</td>
                            <td width=70% class=pad><input class="wenbenkuang" name="username" type="text" id="username" maxLength="18">
                                <font color=red>* 支持中文,不支持特殊符号如:*%#!-&%$</td></tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>密　　码：</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword" type="password" id="userpassword" maxLength="18">
                                <font color=red>*不支持特殊符号如:*%#!-&%$</td></tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>确认密码：</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword1" type="password" id="userpassword1" maxLength="18">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>电子邮箱：</td>
                            <td class=pad><input name="useremail" type="text" class="wenbenkuang" id="useremail" maxlength="25">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td height="30" colspan="2" valign="middle" background="Images/topBar_bg.gif"><font color="#FF3300"><img src="Images/ring01.gif" width="9" height="9"> 用户详细资料</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>您的真实姓名：</td>
                            <td class=pad><input name="userzhenshiname" type="text" id="userzhenshiname" size="15" maxlength="10">
                                <font color=red>* 以便确认</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>您的身份证号：</td>
                            <td class=pad><input class="wenbenkuang" name="idcard" type="text" id="idcard" maxlength="18" onKeyPress="event.returnValue=IsDigit();">
                              <font color=red>*</font>                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>姓　　别：</td>
                            <td class=pad><input type=radio name=sex id=Select1 value=男 checked>
                              男
                                <input type=radio name=sex id=Select1 value=女>
                                女 </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right> 工作：</td>
                            <td class=pad><input name="work" type="text" id="work" size="15" maxlength="20">
                              <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>通讯地址：</td>
                            <td class=pad><input class="wenbenkuang" name="address" type="text" id="address" size="40" maxlength="30">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>邮　　编：</td>
                            <td class=pad><input class="wenbenkuang" name="youbian" type="text" id="youbian" maxlength="6" size="10" onKeyPress="event.returnValue=IsDigit();">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>联系电话：</td>
                            <td class=pad><input class="wenbenkuang" name="usertel" maxlength="18" type="text" id="usertel">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align="right">是否注册企业会员：</td>
                            <td class=pad><input name="qy" type="checkbox" id="qy" onClick="showmm(Qy);" value="yes">
                            <font color="#FF0000">（注册企业会员后可以发布线路和酒店信息，需要管理员审核）</font></td>
                          </tr>
					    </table>
						  <table width="80%" border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" align="center" id="Qy" style="display:none" >
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align="right">公司名称：</td>
                            <td width=70%><input type="text" name="qy_name"><font color="#FF0000">(你选择了企业会员后此项必填!)</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td align="right">公司联系电话：</td>
                            <td class=pad><input type="text" name="qy_tel"><font color="#FF0000">(你选择了企业会员后此项必填!)</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td align="right">公司E-Mail：</td>
                            <td><input type="text" name="qy_email"><font color="#FF0000">(你选择了企业会员后此项必填!)</font></td>
                        </tr></table>
                          <table>
						  <tr bgcolor="#FFFFFF">
                            <td><input class="go-wenbenkuang" onClick="return checkuserinfo();" type=submit name="submit" value=" 提交信息 ">
                              <input class="go-wenbenkuang" onClick="ClearReset()" type=reset name="Clear" value=" 重新填写 "></td>
                          </tr>
                        </table>
                    </form></td>
                </tr>
            </table></td>
          </tr>
        </table>
        <table width="760" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><%case "save"%>
                <!--#include file="admin/system/md5.asp"-->
				<%if request("Qy")="yes" then
if request("Qy_Name")="" then
response.Write "<script language='javascript'>alert('你选择了注册企业信息,那么企业名称必须填写！');window.location.href='User_Reg.asp?action=yes';</script>"
				end if
				if request("Qy_Tel")="" then
response.Write "<script language='javascript'>alert('你选择了注册企业信息,那么企业联系电话必须填写！');window.location.href='User_Reg.asp?action=yes';</script>"
				end if
				if request("Qy_Email")="" then
response.Write "<script language='javascript'>alert('你选择了注册企业信息,那么企业E-mail必须填写！');window.location.href='User_Reg.asp?action=yes';</script>"
				end if
call saveuser()
Else
call saveuser()
End if
end select

sub tiaoyue()
set rs=server.CreateObject("adodb.recordset")
rs.Open "select regtiaoyue from config",conn,1,1
response.Write trim(rs("regtiaoyue"))
rs.Close
set rs=nothing
end sub

sub saveuser()
set rse=server.CreateObject("adodb.recordset")
rse.open "select * from [userb] where email='"&trim(request("useremail"))&"' or username='"&trim(request("username"))&"'",conn,1,1
if not(rse.bof or rse.eof) then
call usererr()
rse.close
Else
'Star_____________________________________

set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb]",conn,1,3
rs.addnew
rs("username")=trim(request("username"))
rs("userpassword")=md5(trim(request("userpassword")))
rs("email")=trim(request("useremail"))
rs("name")=trim(request("userzhenshiname"))
rs("sex")=trim(request("sex"))
rs("telphone")=trim(request("usertel"))
rs("zip")=trim(request("youbian"))
rs("address")=trim(request("address"))
rs("idcard")=trim(request("idcard"))
rs("work")=trim(request("work"))
rs("jifen")=0
rs("lastlogin")=now()
rs("userlastip")=Request.ServerVariables("REMOTE_ADDR")
rs("logins")=1
rs("regdate")=now()
Qy=request("Qy")
if Qy="yes" then
		rs("reglx")=3
	else
		rs("reglx")=1
end if
rs("Qy_Name")=trim(request("Qy_Name"))
rs("Qy_Tel")=trim(request("Qy_Tel"))
rs("Qy_Email")=trim(request("Qy_Email"))
rs.update
rs.close
set rs=nothing

response.Cookies("Gemisum")("username")=trim(request("username"))
Qy=request("Qy")
if Qy="yes" then
response.Cookies("Gemisum")("reglx")=3
	else
response.Cookies("Gemisum")("reglx")=1
end if
response.Cookies("Gemisum")("yucun")=0
response.Cookies("Gemisum")("jifen")=0
session("regtimes")=1
session.Timeout=1
'发送邮件
'if Forum_Setting(47)=1 then
	on error resume next
	'发送注册邮件
	topic="您在" & webname & "的注册资料"
	getpass=trim(request("userpassword"))
	
	mailbody="<html>"
	mailbody=mailbody & "<title>注册信息</title>"
	mailbody=mailbody & "<body>"
	mailbody=mailbody & "<TABLE border=0 width='95%' align=center><TBODY><TR>"
	mailbody=mailbody & "<TD valign=middle align=top>"
	mailbody=mailbody & trim(request("username"))&"，您好：<br><br>"
	mailbody=mailbody & "欢迎您注册" & webname & "，我们将提供给您最好的服务！<br>"
	mailbody=mailbody & "下面是您在" & webname & "的注册信息：<br><br>"
	mailbody=mailbody & "注册名："&trim(request("username"))&"<br>"
	mailbody=mailbody & "密  码："&getpass&"<br>"
	mailbody=mailbody & "<br><br>"
	mailbody=mailbody & "<center><font color=red>再次感谢您注册" & webname & "！</font>"
	mailbody=mailbody & "</TD></TR></TBODY></TABLE><br><hr width=95% size=1>"
	mailbody=mailbody & "</body>"
	mailbody=mailbody & "</html>"
	
Set JMail=Server.CreateObject("JMail.Message")
	JMail.Charset="gb2312"
	JMail.ContentType = "text/html"
jmail.from = mailsend
jmail.silent = true
jmail.Logging = true
jmail.FromName = mailname
jmail.mailserverusername = mailusername
jmail.mailserverpassword = mailuserpass
jmail.AddRecipient trim(request("useremail"))
jmail.body=mailbody
JMail.Subject=topic
if not jmail.Send ( mailaddress ) then
SendMail=""
else
SendMail="OK"
end if
	if SendMail="OK" then
	sendmsg="<p>· 您的注册信息已经发往您的邮箱，请注意查收!</p>"
	else
	sendmsg="<p>· 系统出错，注册信息资料未能发送到您的邮箱!</p>"
	end if
'End--------------------------------------
response.Write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center> "
response.Write "<table width=450 border=0 align=center cellpadding=0 cellspacing=0><tr><td height=260>"
response.Write "<p>· <font color=red>用户注册成功!</font></p><p>· 恭喜您注册成为 ["&webname&"] 的正式用户，请记好您的用户名及密码!</p>"
response.Write "<p>· <a href=default.htm>返回首页</a></p></td></tr></table></td></tr></table>"
end if
end sub

sub usererr()
response.write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center>"
response.write "<table width=450 border=0 align=center cellpadding=2 cellspacing=0><tr><td height=260>"
response.write "<p>· <font color=red>用户注册失败!</font></p><p>· 您输入的用户名或e-mail地址已存在，请返回重新输入!</p><p>· <a href=javascript:history.go(-1)>返回上一页</a></p> </td></tr></table></td></tr></table>"
end sub
%>
            </td>
          </tr>
        </table></TD>
    </TR>
  </TBODY>
</TABLE>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#39AE29">&nbsp;</td>
    <td width="890" height="30" align="center" background="images/endd_02.jpg" bgcolor="#39AE29" style=" color:#FFFFFF;"><a href=Default.htm>网站首页</a> | <a href=about.asp?action=about >关于我们</a> | <a href=about.asp?action=lxwm >业务联系</a> | <a href=help.asp?action=shiyongfalv >版权声明</a> | <a href=help.asp?action=fukuan >付款方式</a> | <a href=gbook.asp >留言/建议/投诉</a></td>
    <td bgcolor="#39AE29">&nbsp;</td>
  </tr>
  <tr>
    <td height="75" colspan="3" align="center" background="images/endd_04.jpg">
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" style="line-height:16px;"> <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
%><br>传真：0371-65852352　客服QQ：<a href="tencent://message/?uin=909888314&Site=河南国旅&Menu=yes">909888314</a></td>
        <td><img src="Images/coy.jpg" width="25" height="31" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>