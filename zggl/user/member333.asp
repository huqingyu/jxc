<!--#include file="conn.asp"-->
<!--#include file="Discount.asp"-->
<%
'on error resume next
Response.ContentType="text/xml; charset=gb2312"
Response.AddHeader "Cache-Control","no-cache,must-revalidate"
if membername="" then
  response.Write "��½��ʱ����û�е�½,<a href='../'>��������½</a>"
  response.End()
end if
function fitx(v,s)
if s="mail" then
   if instr(v,"@")>0 then
      a=split(v,"@")
	  if len(a(0))>3 then
	    b=replace(a(0),right(a(0),3),"***") &"@"&a(1)
	  else
	    b=replace(a(0),right(a(0),1),"*") &"@"&a(1)
	  end if
	  response.Write b
   else
   response.Write v
   end if 
 end if  
 if s="idcard" then
   if len(v)>15 then
      a=mid(v,7,8)
	  response.Write replace(v,a,"********")
   else
      response.Write v
   end if
 end if
 if s="tel" then
   if len(v)>10 then
     a=mid(v,4,4)
	 response.Write replace(v,a,"****")
   else
   response.Write v
   end if
end if

end function
if request("act")="6" then
If Trim(Request("codes"))<>Session("GetCode") then
  Response.Write "��֤���������������"
  Response.end 
End if
  set rs= Server.CreateObject("adodb.recordset")
  rs.open "select * from account1000y where account='"& membername &"' and password='"&request("password")&"'" ,conn,1,3
   if rs.eof then
      response.Write "ԭ������������,������"
      response.end 
   else
      rs("password")=request("newpassword")
      rs.update
      response.Write "�������޸ĳɹ�,���μ�����������,�´���ʹ���������½."
   end if
rs.close
set rs=nothing
response.End()
end if

if request("act")="7" then
  set rs= Server.CreateObject("adodb.recordset")
  rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,3
   if instr(request("email"),"*")=0 then
      rs("email")=request("email")
   end if 
   if instr(request("telephone"),"*")=0 then
      rs("telephone")=request("telephone")
   end if   
      rs.update
      response.Write "���ϲ������,���μ�����д������."
rs.close
set rs=nothing
response.End()
end if


if request("act")="1" then
set rs= Server.CreateObject("adodb.recordset")
rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,1
if rs.eof then
response.Write "��������,�����µ�½"
response.end 
else
set rs1= Server.CreateObject("adodb.recordset")
rs1.open "select count(paymoney) as payzs,count(discount) as dzzs from paylist where account='"& membername &"' and payresult='��'" ,conn,1,1
if rs1("payzs")="" and rs1("dzzs")="" then
zfzs=0
else
zfzs=rs1("payzs")+rs1("dzzs")
end if
rs1.close
set rs1=nothing
set rs2= Server.CreateObject("adodb.recordset")
rs2.open "select count(id) as tjzs from account1000y where ptname='"& membername &"'" ,conn,1,1
tjzs=rs2("tjzs")
rs2.close
set rs2=nothing
if tjzs="" then
tjzs="0"
end if%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>�ʺ���Ϣ</b ></td>
    <td width="551">��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�� �� ����</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>ע��ʱ��</strong>��</td>
    <td>&nbsp;<%=rs("makedate")%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�ϴε�¼��</strong></td>
    <td>&nbsp;<%=rs("lastdate")%>&nbsp;&nbsp;&nbsp;û���ڴ�ʱ���¼��<a href="javascript:" onClick="member1(5)">�����޸�����</a></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�����ʼ���</strong></td>
    <td>&nbsp;<%=fitx(rs("email"),"mail")%><%if instr(rs("email"),"@")=0 then%><font color="#FF0000">��û����д�����ַ</font>,<A href="javascript:" onClick="member1(2)">�����ﲹ��</a><%end if%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�绰���룺</strong></td>
    <td>&nbsp;<%=fitx(rs("telephone"),"tel")%><%if instr(rs("telephone"),"1")=0 then%><font color="#FF0000">��û����д�ֻ�����</font>,<A href="javascript:" onClick="member1(2)">�����ﲹ��</a><%end if%></td>
  </tr>
  <tr>
    <td height="22" align="right">������ǰ����Ϊ:</td>
    <td>&nbsp;<%=rs("ptnativenumber")%>��&nbsp;&nbsp;�����Ը����������ӻ�û��� (�㵱ǰ�Ѿ��Ƽ�<%=tjzs%>���˳ɹ�ע�ᣡ)</td>
  </tr>
  <tr>
    <td height="50" align="right">&nbsp;</td>
    <td>&nbsp;
      <textarea name="tjurl" id="tjurl" cols="50" rows="2" class="teinput">ǧ�� ���������� ע���ʺ� http://passport.zxxr.com/register.asp?ID=<%=rs("ID")%></textarea>
    <input type="button" name="button" id="button" value="���Ƶ�ַ" onclick="copyMessage();"/></td>
  </tr>
  <tr>
    <td height="30" style="font-size:14px;color:#FF6600"><b>��ɫ��Ϣ</b></td>
    <td>��</td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>��ɫһ��</strong></td>
    <td height="27">&nbsp;<%=rs("char1")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>��ɫ����</strong></td>
    <td height="27">&nbsp;<%=rs("char2")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>��ɫ����</strong></td>
    <td height="27">&nbsp;<%=rs("char3")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>��ɫ�ģ�</strong></td>
    <td height="27">&nbsp;<%=rs("char4")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>��ɫ�壺</strong></td>
    <td height="27">&nbsp;<%=rs("char5")%></td>
  </tr>
  <tr>
    <td height="13" align="right">��</td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" align="left" style="font-size:14px;color:#FF6600"><b>����״��</b></td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�����ܶ</strong></td>
    <td>&nbsp;<b><%=rs("paycount")%></b> Ԫ,&nbsp;����ȡ<%=rs("point")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;��Ŀǰ��ֵ�ɴ��ۿ�����<b><FONT color="#FF0000">
	<%
	zje=rs("paycount")
	if instr(Discount,",")>0 then
   a=split(Discount,",")
   for i=0 to ubound(a)-1
      b=split(a(i),"|")
	  if int(zje)>=int(b(0)) then
	    zks=b(1)
	  end if
   next
else
  zks=1   
end if
response.Write zks *10
	%>
    </FONT></b> �ۣ�<A href="javascript:" onClick="member1(4)">���ϳ�ֵ</A></td>
  </tr>
</table>
<%end if
rs.close
set rs=nothing
response.End()
end if

if request("act")="2" then
set rs= Server.CreateObject("adodb.recordset")
rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,1
if rs.eof then
response.Write "��������,�����µ�½"
response.end 
else%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <form name="form1" method="post" action=""><tr>
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>�ʺ���Ϣ</b ></td>
    <td width="194">��</td>
    <td width="357">��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�� �� ����</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>��ʵ����</strong>��</td>
    <td>&nbsp;<%=rs("username")%></td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>���֤�ţ�</strong></td>
    <td>&nbsp;<%=fitx(rs("nativenumber"),"idcard")%>&nbsp;&nbsp;&nbsp;</td>
    <td><FONT color="#333333">����Ŀ�����޸ģ��������ϵ����Ա��</FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>�����ʼ���</strong></td>
    <td>&nbsp;<input type="text" name="email" id="email" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" <%if rs("email")<>"" then%>value="<%=fitx(rs("email"),"mail")%>" readonly<%end if%>></td>
    <td><span id="yxgs"></span><FONT color="#333333"><%if rs("email")="" then%>����ϸ��д,��д�󽫲��ܱ����<%else%>����д��,�����޸�,���Ҫ�޸��������Ա��ϵ<%end if%></FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>�绰���룺</strong></td>
    <td>&nbsp;<input type="text" name="telephone" id="telephone" class="input" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" <%if rs("telephone")<>"" then%>value="<%=fitx(rs("telephone"),"tel")%>" readonly<%end if%>></td>
    <td><FONT color="#333333"><%if rs("telephone")="" then%>����ϸ��д,��д�󽫲��ܱ����<%else%>����д��,�����޸�,���Ҫ�޸��������Ա��ϵ<%end if%></FONT></td>
  </tr>
  <tr>
    <td height="58" align="right" style="color:#333333">��</td>
    <td><img src="images/editzl.png" width="155" height="40" onClick="editzl()" style="cursor:pointer"></td>
    <td>��</td>
  </tr></form>
</table>
<%end if
rs.close
set rs=nothing
response.End()
end if

if request("act")="3" then
 '��ҳ
 Page=Request("Page") 
 If Page="" Then
    Page="1"
 End if	
 MyPageSize   = 20
 If Not IsNumeric(Page) Or IsEmpty(Page) Or Page <=0 Then
	MyPage=1
 Else
	MyPage=Abs(Page)
 End if
 Total="0"
 Set rs= Server.CreateObject("adodb.recordset")
 Rs.open "select * from paylist where account='"& membername &"' order by id desc" ,conn,1,1%>
<table width="690" border="1" cellpadding="0" cellspacing="0" bordercolor="#B2D5F6" style="border-collapse:collapse">
                    <tr bgcolor="#F2F9FF">
                      <td width="159" height="25" align="center"><strong>����</strong></td>
                      <td width="158" align="center"><strong>������</strong></td>
                      <td width="88" align="center"><strong>֧�����</strong></td>
                      <td width="75" align="center"><strong>�ۿ�</strong></td>
                      <td width="127" align="center"><strong>�� ��</strong></td>
                      <td width="69" align="center"><strong>֧���ɹ�?</strong></td>
  </tr>
                    <%If Not Rs.Eof Then
					  	Rs.PageSize = MyPageSize
	                    MaxPages    = Rs.PageCount
	                    Total       = Rs.RecordCount
	                    Rs.absolutepage = MyPage
                       Dim i
                        Counter=0
                        i=0
					  Do While Not Rs.Eof%>
                    <tr>
                      <td height="22">&nbsp;<%=rs("paytitle")%></td>
                      <td height="22">&nbsp;&nbsp;<%=rs("payNumber")%></td>
                      <td>&nbsp;��<b><%=rs("paymoney")%></b></td>
                      <td>&nbsp;��<b><%if rs("Discount")<1 and rs("Discount")>0 then response.Write "0"&rs("Discount"):else response.Write rs("Discount"):end if %></b></td>
                      <td align="center"><%=rs("paydate")%></td>
                      <td align="center"><%=rs("payresult")%></td>
  </tr>
<%
					  i=i+1
	                  If i=mypagesize Then Exit Do
					  rs.movenext
					  loop
					Else%>
						 <tr>
                      <td height="25" colspan="6" align="center"><u>����δ�г�ֵ��¼</u></td>
                      </tr>
				  <%End if%>
</table>
<br /><table width="690" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="222" height="32" align="center">&nbsp;<span id="pagenum" style="display:none"><%=page%></span></td>
    <td width="498"><%if Total>"0" Then%>
<b class="page">���� <%=Total%></b> <b class="page">ҳ�� <%=MaxPages%></b> 
<%
	response.Write("<a href=""javascript:"" onclick=""PageTurning2(1)"" class=""page""><font face=webdings>9</font></a> ")
	if MyPage > 1 then
	response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage-1&")"" class=""page""><font face=webdings>3</font></a> ")
	end if
	if (MyPage >= 5 and MaxPages-MyPage <1) then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage-4&")"" class=""page"">"&MyPage-4&"</a> ")
	if (MyPage >= 4 and MaxPages-MyPage <2) then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage-3&")"" class=""page"">"&MyPage-3&"</a> ")
	if MyPage >=3 then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage-2&")"" class=""page"">"&MyPage-2&"</a> ")
	if MyPage >=2 then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage-1&")"" class=""page"">"&MyPage-1&"</a> ")
	Response.Write("<span class=""page""><u><b>"&MyPage&"</b></u></span> ")
	if MaxPages-MyPage >=1 then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+1&")"" class=""page"">"&MyPage+1&"</a> ")
	if MaxPages-MyPage >=2 then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+2&")"" class=""page"">"&MyPage+2&"</a> ")
	if (MyPage <3 and MaxPages-MyPage >=3) then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+3&")"" class=""page"">"&MyPage+3&"</a> ")
	if (MyPage <2 and MaxPages-MyPage >=4) then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+4&")"" class=""page"">"&MyPage+4&"</a> ")
	if (MyPage <1 and MaxPages-MyPage >=5) then response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+5&")"" class=""page"">"&MyPage+5&"</a> ")
	if MyPage < MaxPages then
	Response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MyPage+1&")"" class=""page""><font face=webdings>4</font></a> ")
	end if
	Response.Write("<a href=""javascript:"" onclick=""PageTurning2("&MaxPages&")"" class=""page""><font face=webdings>:</font></a>")
Else
  Response.Write "&nbsp;"		
End if%></td>
  </tr>
</table>
<%
response.End()
end if

if request("act")="4" then%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
 <form name="form2" method="post" action="alipay/alipayto.asp" target="_blank"> <tr>
    <td width="139" height="64"  style="font-size:14px;color:#FF6600"><b>�ʻ���ֵ</b></td>
    <td width="548">��</td>
  </tr>
  <tr>
    <td height="54" align="right"><strong>��ֵ��</strong></td>
    <td><label>
      <input name="paymoney" type="text" class="input" id="paymoney" onKeyUp="this.value=this.value.replace(/\D/g,'')" value="100" onafterpaste="this.value=this.value.replace(/\D/g,'')">
      Ԫ
    </label></td>
  </tr>
  <tr>
    <td height="67">��</td>
    <td><input type="image" name="imageField" id="imageField" src="images/pay.png"><p>
	<b><font size="4" color="#FF0000">
	����ֵϵͳ��֧������Ϊ��Ϸ�˺ţ��ڴ���Ϸ�˺����������������ﶼ����ȡ��ֵ����Ʒ�����������ȡʱע��ʹ��������ȡ����Ϸ����ID�Ƿ�Ϊ������Ҫ��ֵ����Ϸ����ID.(����������δ��ͨ��ֵ��������ȡ����ע�������������Ƿ�ͨ��ֵ����)��<br>
	<br>
	Ϊ֧����ȫ���ǣ�����֧��������Ҫ��ȡ��ֵ����Ϸ�����������Ϻ���ȡ����ȡ�������ID����ϵͳ������������ȡ���ٴ��������߽����������ɳ�ֵ�� 
	������ֵ����Ϊ��Ϸ�ң���Ԫ������ֵ100=50��Ԫ</font></b>��<br>
��</td>
  </tr>
  <tr>
    <td>��</td>
    <td>��</td>
  </tr></form>
</table>

<%response.End()
end if

if request("act")="5" then
set rs= Server.CreateObject("adodb.recordset")
rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,1
if rs.eof then
response.Write "��������,�����µ�½"
response.end 
else%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <form name="form1" method="post" action=""><tr>
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>�ʺ���Ϣ</b ></td>
    <td width="194">��</td>
    <td width="357">��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>�û�����</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>ԭ���룺</strong></td>
    <td>&nbsp;<input type="password" name="password" id="password" class="input"  onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
    <td><FONT color="#333333">����дԭ�������롣</FONT></td>
  </tr>
  <tr>
    <td height="30">��</td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr>
    <td height="30" style="font-size:14px;color:#FF6600"><b>����������</b></td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>�� �� �룺</strong></td>
    <td>&nbsp;<input type="password" name="newpassword" id="newpassword" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" onfocus="get_Code();"></td>
    <td><FONT color="#333333">�粻��Ҫ�޸����룬�뱣�ָ������ա�</FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>����ȷ�ϣ�</strong></td>
    <td>&nbsp;<input type="password" name="newpassword1" id="newpassword1" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
    <td>&nbsp;<span id="pwderr"></span></td>
  </tr>
  <tr>
    <td height="30" align="right"><strong>��֤�룺</strong></td>
    <td>&nbsp;<input name="codes" type="text" class="input" id="codes" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"/></td>
    <td><span id="imgid" style="float:left;margin-top:-5px;height:30px;"></span>�������,�ɵ��ͼƬˢ��</td>
  </tr>
  <tr>
    <td height="82" align="right" style="color:#333333">��</td>
    <td><img src="images/editpwd.png" width="155" height="40" onClick="editpwd()" style="cursor:pointer"></td>
    <td>��</td>
  </tr></form>
</table>
<%end if
rs.close
set rs=nothing
response.End()
end if
%>