<!--#include file="conn.asp"-->
<%
Response.ContentType="text/xml; charset=gb2312"
Response.AddHeader "Cache-Control","no-cache,must-revalidate" 

if request("act")="0" then
	set rs= Server.CreateObject("adodb.recordset")
	rs.open "select * from account1000y where account='"&request("account")&"'" ,conn,1,1
	if rs.eof then
	 response.Write "<font color='#006600'>���û�����ע��</font>"
	else
	 response.Write "<font color=red>���û�������ע��</font>  "
	end if 
	rs.close
	set rs=nothing
end if
if request("act")="1" then
	If Trim(Request("codes"))<>Session("GetCode") then
	  Response.Write "��֤���������������"
	  Response.end 
	End if
	if request("ptname")<>"" then
		set rs= Server.CreateObject("adodb.recordset")
		rs.open "select * from account1000y where account='"&request("ptname")&"'" ,conn,1,1
		if rs.eof then
		 response.Write "���Ƽ��˲�����"&request("ptname")
		 response.end ()
		 else
		 UID=rs("ID")
		end if 
		rs.close
		set rs=nothing
	end if
	set rs= Server.CreateObject("adodb.recordset")
	rs.open "select * from account1000y where account='"&request("account")&"'" ,conn,1,3
	if rs.eof then
		rs.addnew
		rs("account")=request("account")
		rs("password")=request("password")
		rs("username")=request("username")
		rs("nativenumber")=request("nativenumber")
		rs("email")=request("email")
		rs("telephone")=request("telephone")
		rs("masterkey")=request("masterkey")
		rs("makedate")=date()
		rs("ptname")=request("ptname")
		rs("ipaddr")=request.servervariables("REMOTE_ADDR")
		Response.Write rs("account")
		rs.update
		response.Write "ע��ɹ�"
	else
	   response.Write "�Բ���,����д���û�������ע��"
	end if
	rs.close
	set rs=nothing
	if Request.Cookies("RegIPaddr")="" and request("ptname")<>"" then
		  set rs= Server.CreateObject("adodb.recordset")
		  rs.open "select * from Wealth where UID="&UID&" And wdate='"&date()&"'" ,conn,1,3
		  if rs.eof then
			rs.addnew
			rs("Wealth")=rs("Wealth")+1
			rs("uid")=request("id")
			rs("wdate")=date()
			rs.update
			conn.execute("update account1000y set ptnativenumber=ptnativenumber+5 where account='"&request("ptname")&"'")
		  else
			 if int(rs("Wealth"))+5<=500 then
				rs("Wealth")=rs("wealth")+5
				rs.update
				conn.execute("update account1000y set ptnativenumber=ptnativenumber+5 where account='"&request("ptname")&"'")
			 end if
		  end if 
		  response.Cookies("RegIPaddr")="1"
		  response.Cookies("RegIPaddr").expires=Date+1
		  rs.close
		  set rs=nothing
	end if
end if

if request("act")="2" then
	set rs= Server.CreateObject("adodb.recordset")
	rs.open "select * from account1000y where account='"&request("UserName")&"' and password='"&replace(request("password"),"'","")&"'" ,conn,1,3
	if rs.eof then
	  response.Write "�ʺŻ����������"
	  response.End()
	else
	  rs("lastdate")=date()
	  rs.update
	  Response.Cookies ("membername")=Request("UserName")
	  Response.Write "��½�ɹ�"
	end if
	rs.close
	set rs=nothing
end if

if request("act")="3" then
	If Trim(Request("codes"))<>Session("GetCode") then
	  Response.Write "��֤���������������"
	  Response.end 
	End if
	set rs= Server.CreateObject("adodb.recordset")
	rs.open "select password from account1000y where account='"&replace(request("account"),"'","")&"' and nativenumber="&request("nativenumber")&" and email='"&request("email")&"'" ,conn,1,1
	'rs.open "select password,nativenumber,email from account1000y where account='"&replace(request("account"),"'","")&"'" ,conn,1,1
	if rs.eof then
		response.Write "����������ϲ�ƥ��,������ , ���������������д�����ϣ�����ϵ����Ա���ṩ���֤�����ϡ�"
		' response.write rs("nativenumber") &"--"&rs("email")
		response.End()
	else
	' response.Write "<H2 class='sucText'>"&request("account")&" ��ϲ���ɹ��һ�����</H2>"
	'response.Write "<br><br><p class='sucNotes'><strong>����:</strong>"&rs("password") &"</p>"
%>
  <table width="93%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="88" colspan="2"><H2 class="sucText"><%=request("account")%>����ϲ���ɹ��һ����룡</H2></td>
            </tr>
          <tr>
            <td height="165" colspan="2" valign="top"><p class="sucNotes">���������� <A href="/" target="_blank">��¼</A> ��ʹ�ñ�ϵͳ�ṩ�ĸ������<br>
              ���������һص����룺<br>
              <strong>&nbsp;&nbsp;��½���룺</strong><A href="javascript:;"><%=rs("password")%></a><br></p>
              </td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
<%
	end if
	rs.close
	set rs=nothing
end if

if request("act")="4" then
	If Trim(Request("codes"))<>Session("GetCode") then
	  Response.Write "��֤���������������"
	  Response.end 
	End if
	set rs= Server.CreateObject("adodb.recordset")
	rs.open "select * from account1000y where account='"&request("account")&"'" ,conn,1,3
	if rs.eof then
	  response.Write "û�д��ʻ�,��������д"
	  response.End()
	end if
	rs.close
	set rs=nothing
%>
<table width="661" border="0" cellspacing="0" cellpadding="0">
  <form action="" method="post" name="form1" id="form1">
    <tr>
      <td width="140"  height="40" style="color:#666666;font-size:14px"><strong>�ڶ���</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="40" align="right" style="color:#333333"><strong>ҪѰ��������ʻ���</strong></td>
      <td><input name="account" type="text" class="input" id="account" size="30" readonly="readonly" value="<%=request("account")%>" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="40" align="right" style="color:#333333"><strong>���֤���룺</strong></td>
      <td><input name="nativenumber" type="text" class="input" id="nativenumber" size="30" onblur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="40" align="right" style="color:#333333"><strong>�����ַ��</strong></td>
      <td><input name="email" type="text" class="input" id="email" size="30" onblur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="40" align="right" style="color:#333333"><strong>��֤�룺</strong></td>
      <td width="224"><input name="codes" type="text" class="input" id="codes" size="30" /></td>
      <td width="297"><span id="imgid" style="float:left;margin-top:-5px;height:30px;"></span> �翴�����,��ͼƬ������ˢ����֤��</td>
    </tr>
    <tr>
      <td height="62" align="right" style="color:#333333">&nbsp;</td>
      <td><img src="images/pwdbtn.png" width="155" height="40" onclick="lostpwd()" style="cursor:pointer" /></td>
      <td>&nbsp;</td>
    </tr>
  </form>
</table>

<%
end if

conn.close()
Response.End()

%>