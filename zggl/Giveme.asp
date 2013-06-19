<%
dim id
id=trim(Request("id"))
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert(' 您现在的位置: 您现在的位置:录');window.location.href='Userinfo/Xl_login.asp?id="&id&"';</script>"
end if
%>
<!--#include file="connection.asp" -->
<!--#include file="common/webconfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--添写预定信息</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>
<script languages="javascript">
function ff(tt){
tt.focus();
}
function showmm(dd){
if(dd.style.display=="none"){
dd.style.display="";
}else{
dd.style.display="none";
}
}
function checkform(){
if(form1.textfield3.value==''){
alert(" 您现在的位置:！");
form1.textfield3.focus();
return false;
}
if(form1.textfield4.value==''){
alert(" 您现在的位置:填写！");
form1.textfield4.focus();
return false;
}
if(form1.textfield9.value==''){
alert(" 您现在的位置:填写！");
form1.textfield9.focus();
return false;
}
if(form1.textfield16.value==''){
alert(" 您现在的位置:填写！");
form1.textfield16.focus();
return false;
}
if(form1.textfield19.value=='点击选择日期'){
alert(" 您现在的位置:填写！");
form1.textfield19.focus();
return false;
}
if(form1.textfield20.value=='点击选择日期'){
alert(" 您现在的位置:填写！");
form1.textfield20.focus();
return false;
}
}
</script>
<br><br><br>
<table border=0 align="center" cellPadding=0 >
<%
if id="" or not IsNumeric(id) then
Response.Redirect "error.asp?errormsg=<li> 您现在的位置:！</li><br><li> 您现在的位置:链接进入！</li>"
end if
set rs=server.createobject("adodb.recordset")
sql="select id,x_name,x_leixun,x_baojia from xianlu where id=" +id
rs.open sql,conn,1,1
if rs.eof or rs.bof then
Response.Redirect "error.asp?errormsg=<li>操作不合法！</li><br><li> 您现在的位置: 您现在的位置:！</li>"
end if
%>
<form name="form1" method="post" action="giveme_ok.asp" onSubmit="return checkform();">
<%
set rst=server.CreateObject("adodb.recordset")
rst.open "select * from [userb] where username='"&request.cookies("Gemisum")("username")&"' ",conn,1,1
%>                
<tr>
                    <td><table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                        <tr>
                          <td height=30 align=center background=images/topbar_bg.gif><strong><font color=#EC5B2B> 您现在的位置: 您现在的位置:：[<%=rs("x_leixun")%>]-<%=rs("x_name")%></font></strong> <input name=x_baojia type=hidden id="x_baojia" value=<%=rs("x_baojia")%> ></td>
                        </tr>
                      </table>
                        <table id=zy width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td width="87" height=30 align=center>姓　　名：</td>
                            <td width="139"  align=left><input name=textfield3 type=text onMouseOver='ff(this);' value="<%=rst("name")%>" size=15>
                                <input type=hidden name=textfield size=10 value=<%=rst("id")%>></td>
                            <td width="121" align=center>所在地址：</td>
                            <td width="216" align=left><input name=textfield4 type=text onMouseOver='ff(this);' value="<%=rst("address")%>" size=30></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>电　　话：</td>
                            <td align=left><input name=textfield9 type=text title=' 您现在的位置:开' onMouseOver='ff(this);' value="<%=rst("telphone")%>" size=15></td>
                            <td align=center>来游人数：</td>
                            <td align=left><input type=text name=textfield16 size=10 onMouseOver='ff(this);' title='只能是数字'>
                                <input type=hidden name=textfield2 value=<%=rs("x_name")%>></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>需要导游：</td>
                            <td align=left><select name=textfield15>
                                <option value=需要 selected>需要</option>
                                <option value=不需要>不需要</option>
                                <option value=随便>随便</option>
                            </select></td>
                            <td align=center>希望拼团：</td>
                            <td align=left><select name=textfield17>
                                <option value=希望 selected>希望</option>
                                <option value=不希望>不希望</option>
                                <option value=无所谓>无所谓</option>
                            </select></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>预订时间：</td>
                            <td align=left><input type=text name=textfield18 size=20 readonly value='<%=now()%>'></td>
                            <td align=center>来游日期：</td>
                            <td align=left><input type=text name=textfield19 size=20 onfocus="javascript:setday(this)" title='格式：xxxx/xx/xx或xxxx-xx-xx或xxxx xx xx' value='点击选择日期'></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>反程日期：</td>
                            <td align=left><input type=text name=textfield20 size=20 onfocus="javascript:setday(this)" title='格式：xxxx/xx/xx或xxxx-xx-xx或xxxx xx xx' value='点击选择日期'></td>
                            <td align=center>补充事项：</td>
                            <td align=left><input name=textfield23 type=text size=30 onMouseOver='ff(this);' title=' 您现在的位置:'></td>
                          </tr>
                        </table>
                        <table border=0 cellpadding=0 cellspacing=0>
                          <tr>
                            <td height=4></td>
                          </tr>
                        </table>
                        <table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td width=567 height=30 align=center background=images/topbar_bg.gif><strong><font color=#EC5B2B> 您现在的位置:, 您现在的位置: 您现在的位置: 您现在的位置:信息。</font></strong></td>
                          </tr>
                        </table>
                        <table id=qt width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9 >
                          <tr>
                            <td height=30 width=78 align=center>OICQ：</td>
                            <td width="94" height=30 align=left><input type=text name=textfield6 size=13 onMouseOver='ff(this);'>
                            </td>
                            <td height=30 width=72 align=center>年　　龄：</td>
                            <td width="115" height=30 align=left><input type=text name=textfield7 size=10 onMouseOver='ff(this);'></td>
                            <td height=30 width=81 align=center>电子邮件：</td>
                            <td width="119" height=30 align=left><input name=textfield5 type=text onMouseOver=ff(this); value="<%=rst("email")%>" size=16></td>
                          </tr>
                          <tr>
                            <td height=30 align=center>主页地址：</td>
                            <td height=30 align=left><input type=text name=textfield8 size=13 onMouseOver=ff(this);></td>
                            <td height=30 align=center>手机号码：</td>
                            <td height=30 align=left><input type=text name=textfield10 size=16 onMouseOver='ff(this);'>
                            </td>
                            <td height=30 align=center>传　　真：</td>
                            <td height=30 align=left><input type=text name=textfield11 size=16 onMouseOver=ff(this);>
                            </td>
                          </tr>
                          <tr>
                            <td height=30 align=center>工作单位：</td>
                            <td height=30 align=left><input type=text name=textfield12 size=13 onMouseOver=ff(this);>
                            </td>
                            <td width=72 height=30 align=center>身份证：</td>
                            <td height=30 align=left><input name=textfield13 type=text onMouseOver='ff(this);' value="<%=rst("idcard")%>" size=16>
                            </td>
                            <td height=30 align=center>邮政编码：</td>
                            <td height=30 align=left><input name=textfield14 type=text onMouseOver=ff(this); value="<%=rst("zip")%>" size=10>
                            </td>
                          </tr>
                          <tr>
                            <td height=80 align=center>您的想法：</td>
                            <td height=80 colspan=5 align=left><textarea name=textfield21 rows=4 cols=50 onMouseOver=ff(this);></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td height=80 align=center>备　　注：</td>
                            <td height=80 colspan=5 align=left><textarea name=textfield22 rows=4 cols=50 onMouseOver=ff(this);></textarea>
                            </td>
                          </tr>
                        </table>
                        <table width=573 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
                          <tr>
                            <td height=35 align=center  background=images/topbar_bg.gif><input type=submit name=Submit value=确定预订>
                                　　　　
                                <input type=reset name=Submit2 value=清除重填></td>
                          </tr>
                      </table></td>
                  </tr>
                <% rst.close %>
 </form>
                <% rs.close %>
</table>