
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="fun.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>����Ԥ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<FORM ACTION="OrderInfoUpdate.asp" METHOD="POST" NAME="formSignUp">
<input type=hidden name=id value=<%=rs("id")%>>
<input type=hidden name=userid value=<%=rs("userid")%>>
      <div align="center">
        <table width="60%"  border=1 cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
          <TBODY>
            <tr>
              <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                <p align="left">&nbsp;Ԥ������</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>�µ�ʱ��<span lang="en-us">�� </span></span></TD>
              <TD width=426 height=25><%=rs("regtime")%></TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>����״̬��</span></TD>
              <TD width=426 height=25><%if rs("flag")=1 then%>
                  <font color="#008000">�������</font>
                  <%else%>
                  <font color="#FF0000">δ���κδ���</font>
                  <%end if%></TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>�������ƣ�</span></TD>
              <TD width=426 height=25><%=GetHotelName(rs("c_id"))%> (NO: <%=rs("c_id")%>) ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>��ס���ڣ�</span></TD>
              <TD  width=426 height=25 ><%=rs("jointime")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"><SPAN >������ڣ�</SPAN></TD>
              <TD width=426 height=25><%=rs("leavetime")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>���㷽ʽ��</span></TD>
              <TD width=426 height=25><%=rs("paytype")%> ��</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                <p align="left">&nbsp;����ѡ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"><SPAN >���ͣ�</SPAN></TD>
              <TD width=426 height=25><%=GetRoomName(rs("roomtype"))%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>Ԥ��������</span></TD>
              <TD width=426 height=25><%=rs("roomnum")%> &nbsp;��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>�ܽ�</span></TD>
              <TD width=426 height=25> RMB&nbsp;<%=rs("totalnum")%></TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                <p align="left">&nbsp;Ԥ������</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס������</SPAN></TD>
              <TD width=426 height=25> &nbsp;<%=rs("number")%>��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס����ݣ�</SPAN></TD>
              <TD width=426 height=25><%=rs("degree")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס�Ǽ��ˣ�</SPAN></TD>
              <TD width=426 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> </TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>����Ŀ�ĵط�ʽ��</span></TD>
              <TD width=426 height=25><%=rs("cometype")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>���絽��ʱ�䣺</span></TD>
              <TD width=426 height=25><%=rs("earlytime")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>������ʱ�䣺</span></TD>
              <TD width=426 height=25><%=rs("latetime")%> ��</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                <p align="left">&nbsp;��ϵ��Ϣ</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>��Ա�ʺţ�</span></TD>
              <TD width=426 height=25><%=rs("userid")%></TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>��ϵ�ˣ�</span></TD>
              <TD width=426 height=25><%=rs("username")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>�ֻ���绰��</span></TD>
              <TD width=426 height=25><%=rs("mobiletel")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>���棺</span></TD>
              <TD width=426 height=25><%=rs("fax")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>�����ʼ���</span></TD>
              <TD width=426 height=25><%=rs("email")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB > <span>ȷ�Ϸ�ʽ��</span></TD>
              <TD width=426 height=25><%=rs("affirmtype")%> ��</TD>
            </tr>
            <tr>
              <TD width=152 height=25 align="right" bgColor=#EBEBEB ><SPAN >����˵����</SPAN></TD>
              <TD width=426 height=25><%=rs("explain")%> ��</TD>
            </tr>
            <TR background="images/admin_bg_1.gif">
              <TD height="35" colSpan=2>
                <p align="center">
                  <INPUT TYPE=submit VALUE=" ������ " CLASS="medium" ONCLICK="javascript:return checksignup()" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT class=main type=button size=3 value=���� name=Submit2 onclick="javascript:window.history.go(-1)">                       </TD>
            </TR>
          </TBODY>
        </TABLE>
      </div>
      <p align="center">��
</form>
</body>
</html>