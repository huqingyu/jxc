<%@ Language="JScript" CodePage="936"%>
<%
//����alert����
function _Msg(str1,str2){
	Response.Write ("<script type=\"text/javascript\">\r\n");
	Response.Write ("alert(\"" + str1 + "\");\r\n");
	Response.Write (str2 + ";\n\r");
	Response.Write ("</script>");
}
//�ַ���ת������
function _Str(str){
	return str + "";
}

//���˺���
function _UnHtml(str){
	str = str + "";
	str = str.replace(/</g,"&lt;");
	str = str.replace(/>/g,"&gt;");
	str = str.replace(/'/g,"''");
	str = str.replace(/\r\n/g,"<br />");
	str = str.replace(/%/g,"��");
	str = str.replace(/"/g,"��");
	return str;
}
//��ȡ����
function _POST(str){
	str = Request.Form(str) + "";
	return str;
}
function _GET(str){
	str = Request.QueryString(str) + "";
	return str;
}
//�������
function _Echo(str){
	str = Response.Write(str);
	return str;
}
//��ֹ����
function _End(){
	Response.End();
}
//��ת����
function _Goto(str){
	Response.Redirect(str);
}

//ע��ת������
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