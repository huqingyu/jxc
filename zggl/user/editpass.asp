<html>
<head>
<title>千年帐号注册</title>
<Script Language="JavaScript">
if(window == top){
	window.location.href = "http://www.shenzhou2.com";
}
</Script>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<style type="text/css">
body {
	margin:0px;
	padding:0px;
	text-align:left;
	font-size:12px;
	background-color:transparent;
}
input {
	width:120px;
	height:20px;
}
td {
	font-size:12px;
	padding-left:4px;
	height:35px;
}
button {
	margin:0px;
	padding:0px;
	border:0px;
	width:127px;
	height:41px;
}
</style>
<script type="text/javascript">
function checkfr(){
	var $id,$pass,$pass2,$email,$sfz;
	$id    = document.getElementsByName("_id")[0].value;
	$pass  = document.getElementsByName("_pass")[0].value;
	$email = document.getElementsByName("_email")[0].value;
	$name = document.getElementsByName("_name")[0].value;
	$newpass   = document.getElementsByName("_newpass")[0].value;
	$newpass2  = document.getElementsByName("_newpass2")[0].value;
	if((/<|>|=|%|&|'| /ig.test($id)) || (/<|>|=|%|&|'| /ig.test($pass)) || (/<|>|=|%|&|'| /ig.test($email)) || (/<|>|=|%|&|'| /ig.test($name)) || (/<|>|=|%|&|'| /ig.test($newpass)) || (/<|>|=|%|&|'| /ig.test($newpass2))){
		alert("您输入了系统禁止的字符（<|>|=|%|&|'| ）！");
		return false;
	}
	if(!/^[\w]{3,12}$/g.test($id)){
		alert("您输入的游戏帐号不合法！正确的帐号只能由3-12位的英文、数字和下画线组成。");
		return false;
	}
	if(!/^.{6,12}$/.test($pass)){
		alert("您输入的游戏密码长度不合法，正确的长度应在6-12个字符之间！");
		return false;
	}
	if(!/@.+\./.test($email)){
		alert("您输入的电子邮箱不合法！");
		return false;
	}
	if(/[^\u4E00-\u9FA5]/g.test($name)){
		alert("您输入的姓名不合法,请输入正确的姓名！");
		return false;
	}
	if(!/^.{6,12}$/.test($newpass)){
		alert("您输入的新游戏密码长度不合法，正确的长度应在6-12个字符之间！");
		return false;
	}
	if($newpass2 != $newpass){
		alert("您两次输入的密码不一致！");
		return false;
	}
	document.getElementsByTagName("form")[0].submit();
}
</script>
</head>
<body scroll="no"  onmousemove="if(document.activeElement.tagName!='INPUT')return false;" oncontextmenu="if(document.activeElement.tagName!='INPUT')return false;">
<!--#Include File="function.asp"-->
<!--#Include File="id_conn.asp"-->
<%
if(_GET("t") == "r"){
	var $Server_01 = _Str(Request.ServerVariables("HTTP_REFERER"));
	var $Server_02 = _Str(Request.ServerVariables("SERVER_NAME"));
	if($Server_01.substr(7,$Server_02.length) != $Server_02){
		_Msg("请不要从外部提交数据！","location.href='./'");
		_End();
	}
	var $id,$pass,$pass2,$email,$sfz;
	$id    = _reg(_POST("_id"));
	$pass  = _reg(_POST("_pass"));
	$email = _reg(_POST("_email"));
	$name = _reg(_POST("_name"));
	$newpass   = _reg(_POST("_newpass"));
	$newpass2  = _reg(_POST("_newpass2"));
	if((/<|>|=|%|&|'| /ig.test($id)) || (/<|>|=|%|&|'| /ig.test($pass)) || (/<|>|=|%|&|'| /ig.test($email)) || (/<|>|=|%|&|'| /ig.test($name)) || (/<|>|=|%|&|'| /ig.test($newpass)) || (/<|>|=|%|&|'| /ig.test($newpass2))){
		_Msg("您输入了系统禁止的字符（<|>|=|%|&|'| ）！","history.back()");
		_End();
	}
	if(!/^[\w]{3,12}$/g.test($id)){
		_Msg("您输入的游戏帐号不合法！正确的帐号只能由3-12位的英文、数字和下画线组成。","history.back()");
		_End();
	}
	if(!/^.{6,12}$/.test($pass)){
		_Msg("您输入的游戏密码长度不合法，正确的长度应在6-12个字符之间！","history.back()");
		_End();
	}
	if(!/@.+\./.test($email)){
		_Msg("您输入的电子邮箱不合法！","history.back()");
		_End();
	}
	if(/[^\u4E00-\u9FA5]/g.test($name)){
		_Msg("您输入的姓名不合法,请输入正确的姓名！","history.back()");
		_End();
	}
	if(!/^.{6,12}$/.test($newpass)){
		_Msg("您输入的新游戏密码长度不合法，正确的长度应在6-12个字符之间！","history.back()");
		_End();
	}
	if($newpass2 != $newpass){
		_Msg("您两次输入的密码不一致！","history.back()");
		_End();
	}
try{
	var _SQL = "Select account,password,email,username From account1000y Where account = '" + $id + "' And password = '" + $pass + "' And email = '" + $email + "' And username = '" + $name + "'";
	var _RS  = _Conn.Execute(_SQL);
	if(!_RS.Eof){
		_EdSql = "UpDate account1000y Set password = '" + $newpass + "' Where account = '" + $id + "'";
		_Conn.Execute(_EdSql);
		_Msg("恭喜！密码被修改成功！","window.location.href='editpass.asp'");
		_End();
	}
	else{
		_Msg("对不起，您填写的资料与注册时的资料不符！","history.back()");
		_End();
	}
	_RS.Close();
	Conn.Close();
}
catch(e){
	_Msg("发生未知错误！请联系系统管理员。","history.back()");
	_End();
}
}
else{
%>
<script language="javascript" src="key.js"></script>
<form name="reg" method="post" action="?t=r">
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center"><img src="images/User_03.gif" /></td>
		</tr>
		<tr>
			<td>
				<table width="99%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="50%">游戏帐号：<input name="_id" type="text" id="_id" onclick="SoftKeyboard(this)" onfocus="SoftKeyboard(this)" /><img style="corsor:hand" alt="使用软键盘输入" src="images/key.gif" align="absmiddle" onclick="_id.click();" /><td> * 您注册的帐号</td>
					</tr>
					<tr>
						<td>原始密码：<input name="_pass" type="password" /></td><td> * 您当前使用的密码</td>
					</tr>
					<tr>
						<td>电子邮箱：<input name="_email" type="text" id="_email" onclick="SoftKeyboard(this)" onfocus="SoftKeyboard(this)" /><img style="corsor:hand" alt="使用软键盘输入" src="images/key.gif" align="absmiddle" onclick="_email.click();" /><td>* 您注册时使用的电子邮箱</td>
					</tr>
					<tr>
						<td>真实姓名：<input name="_name" type="text" /></td><td> * 您注册时使用的真实姓名</td>
					</tr>
					<tr>
						<td>新的密码：<input name="_newpass" type="password" /></td><td> * 新的密码，可以是6-12位任意字符</td>
					</tr>
					<tr>
						<td>重复密码：<input name="_newpass2" type="password" /></td><td> * 新的密码确认</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center"><button onclick="return checkfr();"><img src="images/reg_submit.gif" /></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.forms[0].reset();"><img src="images/reg_reset.gif" /></button></td>
		</tr>
	</table>
</form>
<%
}
%>
</body>
</html>