<!--#include file = "Include/Startup.asp"-->
<!--#include file = "admin_private.asp"-->
<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft�����ı��༭��
' Email:huqingyu@gmail.com

sPosition = ""

Call Header()
Call Content()
Call Footer()


Sub Content()
%>
	<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="100%">
	<TR><TD ALIGN=right><img border=0 src='admin/logo.gif'></TD></TR>
	<TR><TD ALIGN=center HEIGHT=100><span class=highlight1><b><%=outHTML(Session("xWebEditor_User"))%>����ӭ��ʹ�ñ�ϵͳ</b></span><br><br><br><b><span class=highlight2>Ϊ��֤ϵͳ���ݰ�ȫ��ʹ����������˳���</span></b></TD></TR>
	<TR>
		<TD>
		<TABLE BORDER=0 CELLPADDING=4 CELLSPACING=0>
		<TR>
			<TD><B>����汾��</B></TD><TD>xWebEditor Version <%=Session("xWebEditor_Version")%></TD>
		</TR>
		<TR>
			<TD><B>��Ȩ���У�</B></TD><TD>seirsoft</TD>
		</TR>
		<TR>
			<TD><B>��ҳ��ַ��</B></TD><TD><a href="http://seirsoft.com/" target="_blank">http://seirsoft.com</a></TD>
		</TR>
		<TR>
			<TD><B>��Ʒ���ܣ�</B></TD><TD><a href="http://seirsoft.com/product/xWebEditor" target="_blank">http://seirsoft.com/product/xWebEditor</a></TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	<TR><TD HEIGHT=30></TD></TR>
	</TABLE>
<%
End Sub
%>