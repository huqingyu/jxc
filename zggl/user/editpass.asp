<html>
<head>
<title>ǧ���ʺ�ע��</title>
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
		alert("��������ϵͳ��ֹ���ַ���<|>|=|%|&|'| ����");
		return false;
	}
	if(!/^[\w]{3,12}$/g.test($id)){
		alert("���������Ϸ�ʺŲ��Ϸ�����ȷ���ʺ�ֻ����3-12λ��Ӣ�ġ����ֺ��»�����ɡ�");
		return false;
	}
	if(!/^.{6,12}$/.test($pass)){
		alert("���������Ϸ���볤�Ȳ��Ϸ�����ȷ�ĳ���Ӧ��6-12���ַ�֮�䣡");
		return false;
	}
	if(!/@.+\./.test($email)){
		alert("������ĵ������䲻�Ϸ���");
		return false;
	}
	if(/[^\u4E00-\u9FA5]/g.test($name)){
		alert("��������������Ϸ�,��������ȷ��������");
		return false;
	}
	if(!/^.{6,12}$/.test($newpass)){
		alert("�����������Ϸ���볤�Ȳ��Ϸ�����ȷ�ĳ���Ӧ��6-12���ַ�֮�䣡");
		return false;
	}
	if($newpass2 != $newpass){
		alert("��������������벻һ�£�");
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
		_Msg("�벻Ҫ���ⲿ�ύ���ݣ�","location.href='./'");
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
		_Msg("��������ϵͳ��ֹ���ַ���<|>|=|%|&|'| ����","history.back()");
		_End();
	}
	if(!/^[\w]{3,12}$/g.test($id)){
		_Msg("���������Ϸ�ʺŲ��Ϸ�����ȷ���ʺ�ֻ����3-12λ��Ӣ�ġ����ֺ��»�����ɡ�","history.back()");
		_End();
	}
	if(!/^.{6,12}$/.test($pass)){
		_Msg("���������Ϸ���볤�Ȳ��Ϸ�����ȷ�ĳ���Ӧ��6-12���ַ�֮�䣡","history.back()");
		_End();
	}
	if(!/@.+\./.test($email)){
		_Msg("������ĵ������䲻�Ϸ���","history.back()");
		_End();
	}
	if(/[^\u4E00-\u9FA5]/g.test($name)){
		_Msg("��������������Ϸ�,��������ȷ��������","history.back()");
		_End();
	}
	if(!/^.{6,12}$/.test($newpass)){
		_Msg("�����������Ϸ���볤�Ȳ��Ϸ�����ȷ�ĳ���Ӧ��6-12���ַ�֮�䣡","history.back()");
		_End();
	}
	if($newpass2 != $newpass){
		_Msg("��������������벻һ�£�","history.back()");
		_End();
	}
try{
	var _SQL = "Select account,password,email,username From account1000y Where account = '" + $id + "' And password = '" + $pass + "' And email = '" + $email + "' And username = '" + $name + "'";
	var _RS  = _Conn.Execute(_SQL);
	if(!_RS.Eof){
		_EdSql = "UpDate account1000y Set password = '" + $newpass + "' Where account = '" + $id + "'";
		_Conn.Execute(_EdSql);
		_Msg("��ϲ�����뱻�޸ĳɹ���","window.location.href='editpass.asp'");
		_End();
	}
	else{
		_Msg("�Բ�������д��������ע��ʱ�����ϲ�����","history.back()");
		_End();
	}
	_RS.Close();
	Conn.Close();
}
catch(e){
	_Msg("����δ֪��������ϵϵͳ����Ա��","history.back()");
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
						<td width="50%">��Ϸ�ʺţ�<input name="_id" type="text" id="_id" onclick="SoftKeyboard(this)" onfocus="SoftKeyboard(this)" /><img style="corsor:hand" alt="ʹ�����������" src="images/key.gif" align="absmiddle" onclick="_id.click();" /><td> * ��ע����ʺ�</td>
					</tr>
					<tr>
						<td>ԭʼ���룺<input name="_pass" type="password" /></td><td> * ����ǰʹ�õ�����</td>
					</tr>
					<tr>
						<td>�������䣺<input name="_email" type="text" id="_email" onclick="SoftKeyboard(this)" onfocus="SoftKeyboard(this)" /><img style="corsor:hand" alt="ʹ�����������" src="images/key.gif" align="absmiddle" onclick="_email.click();" /><td>* ��ע��ʱʹ�õĵ�������</td>
					</tr>
					<tr>
						<td>��ʵ������<input name="_name" type="text" /></td><td> * ��ע��ʱʹ�õ���ʵ����</td>
					</tr>
					<tr>
						<td>�µ����룺<input name="_newpass" type="password" /></td><td> * �µ����룬������6-12λ�����ַ�</td>
					</tr>
					<tr>
						<td>�ظ����룺<input name="_newpass2" type="password" /></td><td> * �µ�����ȷ��</td>
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