<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="../common/system_code.asp" -->
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#ff0000">查看信息反馈</font></div></td>
  </tr>
  <tr>
    <td height="84" valign="top"> 
      <table width="95%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr> 
          <td> 
            <div align="right">选择查看类型 
              <select name="select" class="wenbenkuang" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" ><base target=Right> 
                <option selected>选择信息类型</option>
                <option value="viewfk.asp?lx=0" >查看所有类型</option>
                <option value="viewfk.asp?lx=1" >简单的留言</option>
                <option value="viewfk.asp?lx=2" >对网站的意见</option>
                <option value="viewfk.asp?lx=3" >对公司的建议</option>
                <option value="viewfk.asp?lx=4" >具有合作意向</option>
                <option value="viewfk.asp?lx=5" >产品投诉</option>
                <option value="viewfk.asp?lx=6" >服务投诉</option>
                <option value="viewfk.asp?lx=7" >加盟信息</option>
              </select>
            </div>
          </td>
        </tr>
      </table>
      <%sub leixing()
select case rs("fkleixing")
case "1"
response.write "简单的留言"
case "2"
response.write "对网站的意见"
case "3"
response.write "对公司的建议"
case "4"
response.write "具有合作意向"
case "5"
response.write "产品投诉"
case "6"
response.write "服务投诉"
end select
end sub
%>
<%'开始分页
dim lx
lx=request.QueryString("lx")
set rs=server.createobject("adodb.recordset")
	  if lx="" or lx=0 then
	  rs.open "select * from Gbook order by fkdate desc",conn,1,1
	  else
	  rs.open "select * from Gbook where fkleixing="&lx&" order by fkdate desc",conn,1,1
	  end if
if not rs.eof then
rs.PageSize =25 '每页记录条数
result_num=rs.RecordCount '记录总数
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
else
result_num=0
maxpage=0
page=0
end if
if not rs.eof then 
for i=1 to rs.PageSize
%>
      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
        <tr bgcolor="#f1f1f1"> 
          <td width="89%" height="25" bgcolor="#f1f1f1" style="padding-left:8px"> 
            <%response.write "发表类型：<font color=red>"
		  call leixing()
		  response.write "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户：<a href=mailto:"&trim(rs("fkemail"))&" title=此用户访问IP地址是："&trim(rs("fkip"))&"><font color=red>"&trim(rs("fkusername"))&"</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所在地："&trim(rs("fklaizi"))&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话："&trim(rs("fktel"))%></td>
          <td width="11%"> 
            <div align="center"><a href="delfk.asp?id=<%=rs("fkid")%>" onClick="return confirm('您确定删除吗？')">删 
              除</a></div>
          </td>
        </tr>
        <tr> 
          <td height="41" colspan="2"> 
            <div align="center"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td> 
                    <div align="center"><b><%=trim(rs("fksubject"))%></b></div>
                  </td>
                </tr>
                <tr> 
                  <td><%=trim(rs("fkcontent"))%><br />
                    <div align=right><%="发表时间："&rs("fkdate")%></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table><br />
<%rs.movenext      
if rs.EOF then Exit For      
next      
end if      
rs.close      
set rs=nothing      
%>
    </td>
  </tr>
  <tr>
    <td height="30"><div align="center">
        <% call LastNextPage(maxpage,page,result_num) %>
    </div></td>
  </tr>
</table>
</body>
</html>
