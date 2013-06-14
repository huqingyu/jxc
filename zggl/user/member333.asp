<!--#include file="conn.asp"-->
<!--#include file="Discount.asp"-->
<%
'on error resume next
Response.ContentType="text/xml; charset=gb2312"
Response.AddHeader "Cache-Control","no-cache,must-revalidate"
if membername="" then
  response.Write "登陆超时或者没有登陆,<a href='../'>点击这里登陆</a>"
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
  Response.Write "验证码出错，请重新输入"
  Response.end 
End if
  set rs= Server.CreateObject("adodb.recordset")
  rs.open "select * from account1000y where account='"& membername &"' and password='"&request("password")&"'" ,conn,1,3
   if rs.eof then
      response.Write "原密码输入有误,请重试"
      response.end 
   else
      rs("password")=request("newpassword")
      rs.update
      response.Write "新密码修改成功,请牢记您的新密码,下次请使用新密码登陆."
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
      response.Write "资料补充完成,请牢记您填写的资料."
rs.close
set rs=nothing
response.End()
end if


if request("act")="1" then
set rs= Server.CreateObject("adodb.recordset")
rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,1
if rs.eof then
response.Write "参数错误,请重新登陆"
response.end 
else
set rs1= Server.CreateObject("adodb.recordset")
rs1.open "select count(paymoney) as payzs,count(discount) as dzzs from paylist where account='"& membername &"' and payresult='是'" ,conn,1,1
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
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>帐号信息</b ></td>
    <td width="551">　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>用 户 名：</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>注册时间</strong>：</td>
    <td>&nbsp;<%=rs("makedate")%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>上次登录：</strong></td>
    <td>&nbsp;<%=rs("lastdate")%>&nbsp;&nbsp;&nbsp;没有在此时间登录？<a href="javascript:" onClick="member1(5)">立即修改密码</a></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>电子邮件：</strong></td>
    <td>&nbsp;<%=fitx(rs("email"),"mail")%><%if instr(rs("email"),"@")=0 then%><font color="#FF0000">您没有填写邮箱地址</font>,<A href="javascript:" onClick="member1(2)">点这里补填</a><%end if%></td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>电话号码：</strong></td>
    <td>&nbsp;<%=fitx(rs("telephone"),"tel")%><%if instr(rs("telephone"),"1")=0 then%><font color="#FF0000">您没有填写手机号码</font>,<A href="javascript:" onClick="member1(2)">点这里补填</a><%end if%></td>
  </tr>
  <tr>
    <td height="22" align="right">　您当前积分为:</td>
    <td>&nbsp;<%=rs("ptnativenumber")%>分&nbsp;&nbsp;您可以复制下面链接获得积分 (你当前已经推荐<%=tjzs%>个人成功注册！)</td>
  </tr>
  <tr>
    <td height="50" align="right">&nbsp;</td>
    <td>&nbsp;
      <textarea name="tjurl" id="tjurl" cols="50" rows="2" class="teinput">千年 即将开放了 注册帐号 http://passport.zxxr.com/register.asp?ID=<%=rs("ID")%></textarea>
    <input type="button" name="button" id="button" value="复制地址" onclick="copyMessage();"/></td>
  </tr>
  <tr>
    <td height="30" style="font-size:14px;color:#FF6600"><b>角色信息</b></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>角色一：</strong></td>
    <td height="27">&nbsp;<%=rs("char1")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>角色二：</strong></td>
    <td height="27">&nbsp;<%=rs("char2")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>角色三：</strong></td>
    <td height="27">&nbsp;<%=rs("char3")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>角色四：</strong></td>
    <td height="27">&nbsp;<%=rs("char4")%></td>
  </tr>
  <tr>
    <td height="27" align="right" style="color:#333333"><strong>角色五：</strong></td>
    <td height="27">&nbsp;<%=rs("char5")%></td>
  </tr>
  <tr>
    <td height="13" align="right">　</td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" align="left" style="font-size:14px;color:#FF6600"><b>消费状况</b></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>消费总额：</strong></td>
    <td>&nbsp;<b><%=rs("paycount")%></b> 元,&nbsp;可领取<%=rs("point")%>元&nbsp;&nbsp;&nbsp;&nbsp;你目前充值可打折扣数：<b><FONT color="#FF0000">
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
    </FONT></b> 折，<A href="javascript:" onClick="member1(4)">马上充值</A></td>
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
response.Write "参数错误,请重新登陆"
response.end 
else%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <form name="form1" method="post" action=""><tr>
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>帐号信息</b ></td>
    <td width="194">　</td>
    <td width="357">　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>用 户 名：</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>真实姓名</strong>：</td>
    <td>&nbsp;<%=rs("username")%></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>身份证号：</strong></td>
    <td>&nbsp;<%=fitx(rs("nativenumber"),"idcard")%>&nbsp;&nbsp;&nbsp;</td>
    <td><FONT color="#333333">此项目不能修改，变更请联系管理员。</FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>电子邮件：</strong></td>
    <td>&nbsp;<input type="text" name="email" id="email" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" <%if rs("email")<>"" then%>value="<%=fitx(rs("email"),"mail")%>" readonly<%end if%>></td>
    <td><span id="yxgs"></span><FONT color="#333333"><%if rs("email")="" then%>请仔细填写,填写后将不能变更。<%else%>已填写过,不能修改,如果要修改请与管理员联系<%end if%></FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>电话号码：</strong></td>
    <td>&nbsp;<input type="text" name="telephone" id="telephone" class="input" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" <%if rs("telephone")<>"" then%>value="<%=fitx(rs("telephone"),"tel")%>" readonly<%end if%>></td>
    <td><FONT color="#333333"><%if rs("telephone")="" then%>请仔细填写,填写后将不能变更。<%else%>已填写过,不能修改,如果要修改请与管理员联系<%end if%></FONT></td>
  </tr>
  <tr>
    <td height="58" align="right" style="color:#333333">　</td>
    <td><img src="images/editzl.png" width="155" height="40" onClick="editzl()" style="cursor:pointer"></td>
    <td>　</td>
  </tr></form>
</table>
<%end if
rs.close
set rs=nothing
response.End()
end if

if request("act")="3" then
 '分页
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
                      <td width="159" height="25" align="center"><strong>名称</strong></td>
                      <td width="158" align="center"><strong>订单号</strong></td>
                      <td width="88" align="center"><strong>支付金额</strong></td>
                      <td width="75" align="center"><strong>折扣</strong></td>
                      <td width="127" align="center"><strong>日 期</strong></td>
                      <td width="69" align="center"><strong>支付成功?</strong></td>
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
                      <td>&nbsp;￥<b><%=rs("paymoney")%></b></td>
                      <td>&nbsp;￥<b><%if rs("Discount")<1 and rs("Discount")>0 then response.Write "0"&rs("Discount"):else response.Write rs("Discount"):end if %></b></td>
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
                      <td height="25" colspan="6" align="center"><u>您还未有充值记录</u></td>
                      </tr>
				  <%End if%>
</table>
<br /><table width="690" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="222" height="32" align="center">&nbsp;<span id="pagenum" style="display:none"><%=page%></span></td>
    <td width="498"><%if Total>"0" Then%>
<b class="page">总数 <%=Total%></b> <b class="page">页数 <%=MaxPages%></b> 
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
    <td width="139" height="64"  style="font-size:14px;color:#FF6600"><b>帐户充值</b></td>
    <td width="548">　</td>
  </tr>
  <tr>
    <td height="54" align="right"><strong>充值金额：</strong></td>
    <td><label>
      <input name="paymoney" type="text" class="input" id="paymoney" onKeyUp="this.value=this.value.replace(/\D/g,'')" value="100" onafterpaste="this.value=this.value.replace(/\D/g,'')">
      元
    </label></td>
  </tr>
  <tr>
    <td height="67">　</td>
    <td><input type="image" name="imageField" id="imageField" src="images/pay.png"><p>
	<b><font size="4" color="#FF0000">
	本充值系统的支付对象为游戏账号，在此游戏账号上所有区服的人物都可领取充值的物品，请玩家在领取时注意使用您所领取的游戏人物ID是否为您所需要充值的游戏人物ID.(如所在区服未开通充值将不能领取，请注意您所在区服是否开通充值服务)。<br>
	<br>
	为支付安全考虑，请在支付后将您将要领取充值的游戏人物下线再上后领取，领取后此人物ID将被系统锁定，请在领取后再次下线上线解除锁定以完成充值。 
	本服充值内容为游戏币（金元）。充值100=50金元</font></b>。<br>
　</td>
  </tr>
  <tr>
    <td>　</td>
    <td>　</td>
  </tr></form>
</table>

<%response.End()
end if

if request("act")="5" then
set rs= Server.CreateObject("adodb.recordset")
rs.open "select * from account1000y where account='"& membername &"'" ,conn,1,1
if rs.eof then
response.Write "参数错误,请重新登陆"
response.end 
else%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <form name="form1" method="post" action=""><tr>
    <td width="139" height="25" style="font-size:14px;color:#FF6600"><b>帐号信息</b ></td>
    <td width="194">　</td>
    <td width="357">　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>用户名：</strong></td>
    <td>&nbsp;<%=rs("account")%></td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" align="right" style="color:#333333"><strong>原密码：</strong></td>
    <td>&nbsp;<input type="password" name="password" id="password" class="input"  onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
    <td><FONT color="#333333">请填写原来的密码。</FONT></td>
  </tr>
  <tr>
    <td height="30">　</td>
    <td>　</td>
    <td>　</td>
  </tr>
  <tr>
    <td height="30" style="font-size:14px;color:#FF6600"><b>新密码设置</b></td>
    <td>　</td>
    <td>　</td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>新 密 码：</strong></td>
    <td>&nbsp;<input type="password" name="newpassword" id="newpassword" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" onfocus="get_Code();"></td>
    <td><FONT color="#333333">如不需要修改密码，请保持各项留空。</FONT></td>
  </tr>
  <tr>
    <td height="35" align="right" style="color:#333333"><strong>密码确认：</strong></td>
    <td>&nbsp;<input type="password" name="newpassword1" id="newpassword1" class="input" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
    <td>&nbsp;<span id="pwderr"></span></td>
  </tr>
  <tr>
    <td height="30" align="right"><strong>验证码：</strong></td>
    <td>&nbsp;<input name="codes" type="text" class="input" id="codes" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"/></td>
    <td><span id="imgid" style="float:left;margin-top:-5px;height:30px;"></span>看不清楚,可点击图片刷新</td>
  </tr>
  <tr>
    <td height="82" align="right" style="color:#333333">　</td>
    <td><img src="images/editpwd.png" width="155" height="40" onClick="editpwd()" style="cursor:pointer"></td>
    <td>　</td>
  </tr></form>
</table>
<%end if
rs.close
set rs=nothing
response.End()
end if
%>