<!--#include file = "Include/Startup.asp"-->
<!--#include file = "../../common/md5.asp"-->
<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft在线文本编辑器
' Email:huqingyu@gmail.com

Dim sAction, sErrMsg
Dim s_Usr, s_Pwd
sAction = UCase(Trim(Request("action")))
sErrMsg = ""

Select Case sAction
Case "LOGIN"
	s_Usr = Trim(Request("usr"))
	s_Pwd = Trim(Request("pwd"))
	If s_Usr <> "" And s_Pwd <> "" Then
		sSql = "select * from xwebeditor_system"
		oRs.Open sSql, oConn, 0, 1
		If Not oRs.Eof Then
			If oRs("sys_username") = md5(s_Usr) And oRs("sys_userpass") = md5(s_Pwd) Then
				' 登录成功
				Session("xWebEditor_User") = s_Usr
				Session("xWebEditor_Version") = oRs("sys_version")
				Response.Redirect "admin_default.asp"
				Response.End
			End If
		End If
		oRs.Close
	End If
	sErrMsg = "提示：用户名或密码错误！"
Case "OUT"
	Session("xWebEditor_User") = ""
End Select


%>
<HTML>
<HEAD>
<TITLE>xWebEditor - 后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf8">
<SCRIPT language=JavaScript>
function checklogin() {
	if (document.myform.usr.value=="") {
		alert("请输入用户名!");
		myform.usr.focus();
		return false;
	}
	if (document.myform.pwd.value=="") {
		alert("请输入密码!");
		myform.pwd.focus();
		return false;
	}
	return true;
}
</SCRIPT>
<style>
.font {	FONT-SIZE: 9pt; LINE-HEIGHT: 180%; TEXT-DECORATION: none}
.textinput {BORDER-RIGHT: #ffc38c 1px solid; BORDER-TOP: #ffc38c 1px solid; FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: #ffc38c 1px solid; BORDER-BOTTOM: #ffc38c 1px solid; FONT-FAMILY: arial}
body,td,input {font-size:9pt}
</style>

</HEAD>
<BODY leftMargin=0 topMargin=0>

<TABLE height=396 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle height=70>&nbsp; </TD></TR>
  <TR>
    <TD vAlign=top align=middle height=163>
      <TABLE cellSpacing=0 cellPadding=0 width=630 border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=left width=289 height=184 align=center></TD>
          <TD vAlign=bottom align=middle width=341 background=admin/login_c5.gif height=198>管 理 员 登 录<BR><font color=#0000ff><%=sErrMsg%></font><BR>
            <TABLE cellSpacing=0 cellPadding=0 width=227 border=0>
              <FORM name=myform onsubmit="return checklogin()" action="?action=login" method=post>
              <TBODY>
              <TR vAlign=center>
                <TD class=font align=right width=58 height=32><FONT color=#ff0000>用户名：</FONT></TD>
                <TD width=169><INPUT class=textinput name=usr size=20> </TD>
			  </TR>
              <TR vAlign=center>
                <TD class=font align=right width=58><FONT color=#ff0000>密　码：</FONT></TD>
                <TD width=169><INPUT class=textinput type=password name=pwd size=20> </TD></TR>
              <TR vAlign=center align=middle>
                <TD colSpan=2 height=46><INPUT type=image height=18 width=35 src="admin/login.gif" border=0 name=imageField></TD>
			  </TR>
			  </FORM>
			  </TBODY>
			</TABLE>
	      </TD>
		</TR>
        <TR>
          <TD vAlign=bottom align=right width=289 height=76></TD>
          <TD vAlign=top align=left width=341 height=76></TD>
		</TR>
		</TBODY>
	  </TABLE>
	</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>
</HTML>
