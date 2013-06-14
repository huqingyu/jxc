<%@ Language="JScript" CodePage="936"%>
<%
//调用alert函数
function _Msg(str1,str2){
	Response.Write ("<script type=\"text/javascript\">\r\n");
	Response.Write ("alert(\"" + str1 + "\");\r\n");
	Response.Write (str2 + ";\n\r");
	Response.Write ("</script>");
}
//字符串转换函数
function _Str(str){
	return str + "";
}

//过滤函数
function _UnHtml(str){
	str = str + "";
	str = str.replace(/</g,"&lt;");
	str = str.replace(/>/g,"&gt;");
	str = str.replace(/'/g,"''");
	str = str.replace(/\r\n/g,"<br />");
	str = str.replace(/%/g,"％");
	str = str.replace(/"/g,"”");
	return str;
}
//读取函数
function _POST(str){
	str = Request.Form(str) + "";
	return str;
}
function _GET(str){
	str = Request.QueryString(str) + "";
	return str;
}
//输出函数
function _Echo(str){
	str = Response.Write(str);
	return str;
}
//终止函数
function _End(){
	Response.End();
}
//跳转函数
function _Goto(str){
	Response.Redirect(str);
}

//注册转换函数
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

function _reg(str){
	str = str.trim();
	str = str.replace(/'/ig,"''");
	str = str.toLowerCase();
	return str;
}
%>