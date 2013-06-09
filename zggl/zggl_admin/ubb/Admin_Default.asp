<!--#include file = "Include/Startup.asp"-->
<!--#include file = "admin_private.asp"-->
<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft在线文本编辑器
' Email:huqingyu@gmail.com

sPosition = ""

Call Header()
Call Content()
Call Footer()


Sub Content()
%>
	<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="100%">
	<TR><TD ALIGN=right><img border=0 src='admin/logo.gif'></TD></TR>
	<TR><TD ALIGN=center HEIGHT=100><span class=highlight1><b><%=outHTML(Session("xWebEditor_User"))%>：欢迎您使用本系统</b></span><br><br><br><b><span class=highlight2>为保证系统数据安全，使用完后请点击退出！</span></b></TD></TR>
	<TR>
		<TD>
		<TABLE BORDER=0 CELLPADDING=4 CELLSPACING=0>
		<TR>
			<TD><B>软件版本：</B></TD><TD>xWebEditor Version <%=Session("xWebEditor_Version")%></TD>
		</TR>
		<TR>
			<TD><B>版权所有：</B></TD><TD>seirsoft</TD>
		</TR>
		<TR>
			<TD><B>主页地址：</B></TD><TD><a href="http://seirsoft.com/" target="_blank">http://seirsoft.com</a></TD>
		</TR>
		<TR>
			<TD><B>产品介绍：</B></TD><TD><a href="http://seirsoft.com/product/xWebEditor" target="_blank">http://seirsoft.com/product/xWebEditor</a></TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	<TR><TD HEIGHT=30></TD></TR>
	</TABLE>
<%
End Sub
%>