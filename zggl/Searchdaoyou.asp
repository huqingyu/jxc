<!--#include file="Connection.asp"-->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--导游信息查询</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  
    <tr>
      <TD width="35%" height="81" align=left bgColor=#ffffff><div align="center"><img src="<%=weblogo%>"></div></td>
      <TD width="65%" align=middle vAlign=center bgColor=#ffffff><div align="center"><img src="<%=webbanner%>"></div></td>
    </tr>
    <TR vAlign=middle bgcolor="#0F77B1">
      <TD height=27 colSpan=2 align=left>
<TABLE width="100%" height="100%" border=0 lign=center cellPadding=0 cellSpacing=0>
          
            <tr>
              <TD align=left vAlign=middle background="images/top_bar.gif">
                <div align="center"><FONT color=#ffffff><a href="default.htm"><FONT color=#ffffff>首页</Font></a> | <a href="News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | 会员中心 | <a href="Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
            </tr>
          
      </TABLE></td>
    </tr>
  
</TABLE>
<TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
  
    <TR bgColor=#ffffff>
      <TD colSpan=3 height=2></td>
    </tr>
    <tr>
      <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
      <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a>动态</td>
      <TD width="11">&nbsp;</td>
    </tr>
  
</TABLE>
<table width="770" height="548" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="177" height="461" valign="top" bgcolor="#f6f6f6" style="BORDER-left: #d8d8d8 1px solid"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      
        <tr>
          <TD height="40">
            <TABLE cellSpacing=0 cellPadding=0 width="183" border=0>
              
                <tr>
                  <TD width="183" height=40 background="Images/t-1.gif">&nbsp;</td>
                </tr>
              
          </TABLE></td>
        </tr>
        <tr>
          <TD height=117 valign="top">
            <%sql="select top 8 id,c_name from Hotelb order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1

if rs.eof then
response.write " 您现在的位置:信息!"
Else
do while not rs.eof%>
            <table width="93%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="18"> <font color="#666666"><a href="Hotel/Hotel_<%=rs("id")%>.html">
                  <%if len(rs("c_name"))>13 then%>
                  <%=left(rs("c_name"),13)%>...
                  <%else%>
                  <%=rs("c_name")%>
                  <%end if%>
                </a></font></td>
              </tr>
            </table>
            <%
rs.movenext                                                 
loop
end if
rs.close%></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td><TABLE cellSpacing=0 cellPadding=0 width="183" border=0>
              
                <tr>
                  <TD width="183" height=40 background="Images/t-2.gif">&nbsp;</td>
                </tr>
              
          </TABLE></td>
        </tr>
        <tr>
          <TD height="117" vAlign=top>
            <%sql="select top 8 id,x_name from xianlu order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1

if rs.eof then
response.write " 您现在的位置:信息!"
Else
do while not rs.eof%>
            <table width="93%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="18"> <font color="#666666"><a href="xl/xl_<%=rs("id")%>.html">
                  <%if len(rs("x_name"))>13 then%>
                  <%=left(rs("x_name"),13)%>...
                  <%else%>
                  <%=rs("x_name")%>
                  <%end if%>
                </a> </font></td>
              </tr>
            </table>
            <%
rs.movenext                                                 
loop
end if
rs.close%></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td>
            <TABLE cellSpacing=0 cellPadding=0 width="183" border=0>
              
                <tr>
                  <TD width="183" height=40 background="Images/t-3.gif">&nbsp;</td>
                </tr>
              
          </TABLE></td>
        </tr>
        <tr>
          <TD height="117" vAlign=top><!--#include file="toupiaoinfo.asp" --></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <TD height="7"></td>
        </tr>
      
    </TABLE></td>
    <td width="593" valign="top" style="BORDER-left: #d8d8d8 1px solid;BORDER-right: #d8d8d8 1px solid"><div align="center">
      </div>      
      <br>
      <!--#include file="admin/system/system_code.asp" -->
<table width="572" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#ff0000"><b> 您现在的位置:果</b></font></div></td>
        </tr>
        <tr>
          <td height="442" colspan="2" valign="top">  <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ebebeb">
            <tr>
              <td width="22%"> &nbsp;姓名</td>
              <td width="17%"> &nbsp;性别</td>
              <td width="12%">年龄</td>
              <td width="14%">民族</td>
              <td width="10%">查看</td>
            </tr>
            <tr bgcolor="#CCCCCC">
              <td height="1" colspan="8"></td>
            </tr>
          </table>
<%
dim name1,vip,sex,mingzu
name1=trim(request.form("name"))
vip=trim(request.form("vip"))
sex=trim(request.form("sex"))
mingzu=trim(request.form("mingzu"))
set rs=server.createobject("adodb.recordset")
stsql="select * from daoyou where vip ='"&vip&"' and sex ='"&sex&"' and mingzu like '%"&mingzu&"%' and d_name like '%"&name1&"%'"
rs.open stsql,conn,1,1
if rs.eof then
response.write "<br><center> 您现在的位置:条件的数据！</center>"
response.end
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
 <table width="99%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="22%"><%=rs("d_name")%></td>
                <td width="17%"><%if rs("sex")="1" then 
      		response.write "男"
      	elseif rs("sex")="0" then
      		response.write "女"
      	      	end if
      %></td>
                <td width="12%"><div align="left"><%=rs("nianling")%></div></td>
                <td width="14%"><div align="left">
                  <%if rs("mingzu")="a" then 
      		response.write "汉"
      	elseif rs("mingzu")="b" then
      		response.write "回"
      	elseif rs("mingzu")="c" then
      		response.write "彝"	
      	elseif rs("mingzu")="d" then
      		response.write "维"
      	elseif rs("mingzu")="e" then
      		response.write "哈"	
      	elseif rs("mingzu")="f" then
      		response.write "蒙"
      	end if
      %>
                </div></td>
               <td width="10%"><a href="daoyouinfo.asp?id=<%=rs("id")%>">查看</a></td>
              </tr>
              <tr bgcolor="#CCCCCC">
                <td height="1" colspan="8"></td>
              </tr>
            </table>
          <%
rs.movenext      
if rs.EOF then Exit For      
next      
end if      
rs.close      
set rs=nothing
%></td>
        </tr>
        <tr>
          <td height="30" colspan="2"><div align="center">
              <% call LastNextPage(maxpage,page,result_num) %>
          </div></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  
    <tr>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
      <TD 
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>网站首页</a> | <a href=about.asp?action=about >关于我们</a> | <a href=user.asp?action=pay >在线支付</a> | <a href=about.asp?action=lxwm >业务联系</a> | <a href=help.asp?action=shiyongfalv >版权声明</a> | <a href=help.asp?action=fukuan >付款方式</a> | <a href=gbook.asp >留言/建议/投诉</a></td>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
    </tr>
    <tr>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"　邮政编码："&youbian&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.write trim(rs("gongzuoshijian"))
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " 您现在的位置:："&FormatNumber((endtime-startime)*1000,3)&" 毫秒"
rs.close
set rs=nothing%>
      </div></td>
    </tr>
  
</TABLE>
