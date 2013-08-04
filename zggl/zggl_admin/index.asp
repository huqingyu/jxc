<!DOCTYPE html>
<html>
<head>
<title>后台管理 - by seirsoft.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="css/login.css" rel="stylesheet" />
</head>
<body>
<form name="form1" method="post" action="loginchk.asp" onSubmit="return submit_check();">

<div class="J_login_table center">
	<div class="J_header"><b>管理员登录</b></div>
	<div class="J_header2"></div>
	<div class="J_body">
		<div>
			<span class="J_left">帐号:</span>
			<span>
				<input name="user" type="text" class="input2" id="user" maxlength="20">
			</span>
		</div>
		<div>
			<span class="J_left">密码:</span>
			<span>
				<input name="password" type="password" class="input2" id="password" maxlength="20">
			</span>
		</div>
		<div>
			<span class="J_left">验证码:</span>
			<span>
				<input name="VCodes" type="text" class="inputVCodes" id="VCodes" maxlength="20">
              <b><%=s%></b></span><img src="../common/GetCode.asp" align="absmiddle" />
			</span>
		</div>
		<div>
			<span class="J_left"></span>
			<span style="margin:0 0 0 5px;">
			<input name="submit" type="submit" class="button2" value="登 录">
           </span>
		    <span style="margin:0 0 0 15px;">
			<input name="button" type="button" class="button2" onClick="Javascript:window.close();" value="取 消">
			</span>
		</div>  		
	</div>
</div>
</form>  
<script src="js/login.js"></script>
</body>
</html>