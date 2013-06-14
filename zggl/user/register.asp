<!--#include file="conn.asp"-->
<%
IP=request.servervariables("REMOTE_ADDR")
if request("ID")<>"" then
  set rs1=Server.CreateObject("adodb.recordset")
  rs1.open "select account,ptnativenumber from account1000y where ID="&request("ID") ,conn,1,3
  if not rs1.eof then
    tjaccount=replace(rs1("account")," ","")
      if Request.Cookies("IPaddr")="" then
		  set rs= Server.CreateObject("adodb.recordset")
		  rs.open "select * from Wealth where UID="&Request("ID")&" And wdate="&date() ,conn,1,3
		  if rs.eof then
			rs.addnew
			rs("Wealth")=rs("Wealth")+1
			rs("uid")=request("id")
			rs("wdate")=date()
			rs.update
			rs1("ptnativenumber")=rs1("ptnativenumber")+1
			rs1.update
		  else
			 if int(rs("Wealth"))+1<=500 then
				rs("Wealth")=rs("wealth")+1
				rs.update
				rs1("ptnativenumber")=rs1("ptnativenumber")+1
				rs1.update
			 end if
		  end if 
		  response.Cookies("IPaddr")="1"
		  response.Cookies("IPaddr").expires=Date+1
		  rs.close
		  set rs=nothing
	   end if
   else
     tjaccount=""
   end if
   rs1.close
   set rs1=nothing
end if
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chk.js"></script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	left:427px;
	top:82px;
	width:427px;
	height:162px;
	z-index:1;
	background-color: #CCCCCC;
}
-->
</style>
</head>

<body onLoad="get_Code();">

<table width="55%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/reg1.png" width="801" height="81" /></td>
  </tr>
  <tr>
    <td height="554" valign="top" background="images/reg2.png"><table width="100%" border="0" cellspacing="0" cellpadding="0">
     <form action="" method="post" enctype="multipart/form-data" name="form1"> 
       <tr>
        <td width="24%" height="40" align="right" style="color:#666666;font-size:14px">通行证帐号：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td width="28%"><label>
          <input name="account" type="text" class="input" id="account" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';jc(this.value);}else{this.style.background='#FFDBCA';}">
        </label></td>
        <td width="48%" style="color:#666666"><span id="regtitle"></span>由字母(a_z)，数字(0_9)和下画线(_)组成,最少<font color="#FF0000">4</font>位</td>
       </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">设置密码：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="password" type="password" class="input" id="password" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="password"></span>由任意字符组成</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">确认密码：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="password1" type="password" class="input" id="password1" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';pwderr.innerHTML='';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="pwderr"></span>重复密码</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">姓    名：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="username" type="text" class="input" id="username" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="username"></span>请填入真实姓名，用于找回密码的重要凭证</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">身份证号码：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="nativenumber" type="text" class="input" id="nativenumber" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="idcard"></span>请填入标准的身份证号，用于找回密码</td>
      </tr>
      <tr>
        <td height="48" colspan="3" valign="bottom" style="font-size:14px;color:#0066CC">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/lock.png" width="13" height="14" hspace="4" align="absmiddle">设置密码保护资料<IMG src="images/down.png" name="hideIcon" hspace="4" align="absmiddle" class="iconArrow iconArrowDown" id="hideIcon"></SPAN></H2>          </td>
        </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">邮箱：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="email" type="text" class="input" id="email" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="yxgs"></span>请填入邮箱地址，用于修改密码和找回密码</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">手机：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="telephone" type="text" class="input" id="telephone" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
        <td style="color:#666666"><span id="telephone"></span>用于修改密码和找回密码</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">验证图片： </td>
        <td><span id="imgid" style="float:left;margin-top:-5px;height:30px;"></span></td>
        <td style="color:#666666">如果看不清楚,请点击图片刷新验证码</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">验证码：<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="codes" type="text" class="input" id="codes" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td>&nbsp;<span id="codes"></span></td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">推荐人：</td>
        <td><input name="ptname" type="text" class="input" id="ptname" value="" <%if request("id")<>"" then%>readonly<%end if%>></td>
        <td><a href="javascript:" onClick="document.form1.ptname.value=''">清空推荐人</a></td>
      </tr>
      <tr>
        <td height="40" align="right">&nbsp;</td>
        <td><label>
          <input name="agree" type="checkbox" id="agree" value="1">
          我接受千年通行证用户服务协议</label></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="66" align="right">&nbsp;</td>
        <td><img src="images/regbtn.png" width="155" height="40" onClick="chk()" style="cursor:pointer"></td>
        <td>&nbsp;<span id="regloading"></span></td>
      </tr></form>
    </table></td>
  </tr>
</table>
<%if tjaccount<>"" then%>
<script>
if(confirm('你现在的游戏帐号注册推荐人为 <%=tjaccount%> 你是否确定由推荐人 <%=tjaccount%> 推荐注册帐号!'))
	{document.form1.ptname.value='<%=tjaccount%>';}
</script>
<%end if%>

<table width="56%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="70" align="right" valign="top"><img src="images/reg3.png" height="70"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/l.png" height="1"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
