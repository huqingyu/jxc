<!--#include file="conn.asp"-->
<%
Response.ContentType="text/xml; charset=gb2312"
Response.AddHeader "Cache-Control","no-cache,must-revalidate" 

if request("act")="3" then
Set rs= Server.CreateObject("adodb.recordset")
 Rs.open "select * from admin_1000y where username='"&request("username")&"' and password='"&replace(request("password"),"'","")&"'" ,conn,1,1
 if rs.eof then
    response.Write "登陆失败,用户名或者密码错误"
 else
    response.Cookies ("admin_name")=request("username")
	response.Write "登陆成功"
 end if
 rs.close
 set rs=nothing
 response.end 
end if

if request.Cookies("admin_name")<>"" and request("key")>0 then
if request("act")="2" then
conn.execute("delete from account1000y where account='"&request("account")&"'")
end if
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
 sqlstr=""
 if request("key")="1" then
    sqlstr="where account like '%"& request("keyword") &"%'"
 elseif request("key")="2" then
    sqlstr="where char1 like '%"& request("keyword") &"%' or char2 like '%"& request("keyword") &"%' or char3 like '%"& request("keyword") &"%' or char4 like '%"& request("keyword") &"%' or char5 like '%"& request("keyword") &"%'"
 elseif request("key")="3" then
    sqlstr="where email='"& request("keyword") &"'"
 elseif request("key")="4" then
    sqlstr="where nativenumber='"& request("keyword") &"'"
 else
    sqlstr=""
 end if
 Set rs= Server.CreateObject("adodb.recordset")
 Rs.open "select * from account1000y "&sqlstr&" order by makedate desc" ,conn,1,1%>
<table width="690" border="1" cellpadding="0" cellspacing="0" bordercolor="#B2D5F6" style="border-collapse:collapse">
                    <tr bgcolor="#F2F9FF">
                      <td width="94" height="25" align="center"><strong>账号</strong></td>
                      <td width="84" align="center"><strong>密码</strong></td>
                      <td width="91" align="center"><strong>手机</strong></td>
                      <td width="111" align="center"><strong>邮箱</strong></td>
                      <td width="132" align="center"><strong> 身份证</strong></td>
                      <td width="164" align="center"><strong>注册日期</strong></td>
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
                      <td height="22" align="center">&nbsp;<a href="javascript:" onclick="DvWnd.open('<font color=#ffffff>查看/修改 <%=rs("account")%> 的资料</font>','showuser.asp?account=<%=rs("account")%>',500,450,1,{bgc:'black',opa:0.2})"><%=rs("account")%></a></td>
                      <td height="22" align="center">&nbsp;<%=rs("password")%></td>
                      <td align="center"><%=rs("telephone")%></td>
                      <td align="center"><%=rs("email")%></td>
                      <td align="center"><%=rs("nativenumber")%></td>
                      <td align="center"><%=rs("makedate")%></td>
  </tr>
<%
					  i=i+1
	                  If i=mypagesize Then Exit Do
					  rs.movenext
					  loop
					Else%>
						 <tr>
                      <td height="25" colspan="6" align="center"><u>没有会员</u></td>
                      </tr>
				  <%End if%>
</table>
<br /><table width="690" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="222" height="32" align="center">&nbsp;<span id="pagenum" style="display:none"><%=page%></span></td>
    <td width="498"><%if Total>"0" Then%>
<b class="page">总数 <%=Total%></b> <b class="page">页数 <%=MaxPages%></b> 
<%
	response.Write("<a href=""javascript:"" onclick=""PageTurning(1,"&request("key")&","&request("keyword")&")"" class=""page""><font face=webdings>9</font></a> ")
	if MyPage > 1 then
	response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage-1&","&request("key")&","&request("keyword")&")"" class=""page""><font face=webdings>3</font></a> ")
	end if
	if (MyPage >= 5 and MaxPages-MyPage <1) then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage-4&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage-4&"</a> ")
	if (MyPage >= 4 and MaxPages-MyPage <2) then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage-3&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage-3&"</a> ")
	if MyPage >=3 then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage-2&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage-2&"</a> ")
	if MyPage >=2 then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage-1&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage-1&"</a> ")
	Response.Write("<span class=""page""><u><b>"&MyPage&"</b></u></span> ")
	if MaxPages-MyPage >=1 then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+1&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage+1&"</a> ")
	if MaxPages-MyPage >=2 then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+2&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage+2&"</a> ")
	if (MyPage <3 and MaxPages-MyPage >=3) then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+3&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage+3&"</a> ")
	if (MyPage <2 and MaxPages-MyPage >=4) then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+4&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage+4&"</a> ")
	if (MyPage <1 and MaxPages-MyPage >=5) then response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+5&","&request("key")&","&request("keyword")&")"" class=""page"">"&MyPage+5&"</a> ")
	if MyPage < MaxPages then
	Response.Write("<a href=""javascript:"" onclick=""PageTurning("&MyPage+1&","&request("key")&","&request("keyword")&")"" class=""page""><font face=webdings>4</font></a> ")
	end if
	Response.Write("<a href=""javascript:"" onclick=""PageTurning("&MaxPages&","&request("key")&","&request("keyword")&")"" class=""page""><font face=webdings>:</font></a>")
Else
  Response.Write "&nbsp;"		
End if%></td>
  </tr>
</table>
<%elseif request.Cookies("admin_name")<>"" and request("key")<=0 then%><br />
<br />

<font color="#FF0000">请选择查询选项和查询关键字</font>
<%else%>
<table width="690" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="28" height="79">&nbsp;</td>
    <td width="580" align="center" style="font-size:14px;color:#FF6600"><b><br>
    管 理 员 登 陆</b></td>
    <td width="82">&nbsp;</td>
  </tr>
  <tr>
    <td height="120">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
        <td width="41%" height="45" align="right"><strong>用户名：</strong></td>
        <td width="59%" height="45"><input type="text" name="username" id="username" class="input"></td>
      </tr>
      <tr>
        <td height="46" align="right"><strong>密码：</strong></td>
        <td height="46"><input type="password" name="password" id="password"  class="input"></td>
      </tr>
      <tr>
        <td height="44">&nbsp;</td>
        <td height="44"><input type="button" name="button11" id="button11" value=" 登 陆 " onClick="adminlogin()"></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<%end if%>