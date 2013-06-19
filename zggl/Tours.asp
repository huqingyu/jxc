<!--#include file="Connection.asp" -->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="Themes/style/default.css" rel="stylesheet">
<title><%=webname%></title>
<body>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  
    <tr>
      <TD width="35%" height="81" align=left 
                  bgColor=#ffffff ><div align="center"><img src="<%=weblogo%>"></div></td>
      <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff ><div align="center"><img src="<%=webbanner%>"></div></td>
    </tr>
    <TR vAlign=middle bgcolor="#0F77B1">
      <TD height=27 
                colSpan=2 align=left ><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 >
          
            <tr>
              <TD align=left vAlign=middle background="images/top_bar.gif" >
                <div align="center"><FONT color=#ffffff><a href="default.htm"><FONT color=#ffffff>首页</Font></a> | <a href="News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | <a href="userInfo/userInfo.asp"><font color="#FFFFFF">会员中心</font></a> | <a href="Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
            </tr>
          
      </TABLE></td>
    </tr>
  
</TABLE>
<div align="center">
  <TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
    
      <TR bgColor=#ffffff>
        <TD colSpan=3 height=2></td>
      </tr>
      <tr>
        <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
        <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a>线路首页</td>
        <TD width="11">&nbsp;</td>
      </tr>
    
  </TABLE>
  <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="180" valign="top" class="border"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="tdbg_leftall"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="title_left">用户登录</td>
                </tr>
                <tr>
                  <td class="tdbg_left"><table width="100%" border="0" cellspacing="0" cellpadding="2" align="center">
                    <%if request.Cookies("Gemisum")("username")=""  then%>
                    <form name="userlogin" method="post" action="User_Checklogin.asp">
                      <tr>
                        <td align="center">用户名：
                            <input type="text"  name="username" size="11">
                        </td>
                      </tr>
                      <tr>
                        <td align="center">密　码：
                            <input type="password"  name="userpassword" size="11">
                        </td>
                      </tr>
                      <tr>
                        <td align="center">验证码：
                            <input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6>
                            <img src=GetCode.asp> </td>
                      </tr>
                      <tr>
                        <td height="38" align="center" valign="middle">
                          <input  name="imageField" value="登 陆" type=submit onFocus="this.blur()">
&nbsp;<a href=User_Reg.asp target=_blank>注 册</a>&nbsp; <a href=userinfo/getpwd.asp target=_blank>忘 密</a></td>
                      </tr>
                    </form>
                    <%else%>
                    <tr>
                      <td align="center" height="38"><%
set rs=server.createobject("adodb.recordset")
rs.open "select jifen,yucun,reglx,vipdate from [userb] where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
if rs("vipdate")<>"" then 
'看是不是过期VIP
if rs("vipdate")<date and rs("reglx")>2 then
rs("reglx")=1
rs.update
end if
end if
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")
response.Cookies("Gemisum")("reglx")=rs("reglx")
rs.close
set rs=nothing
if request.Cookies("Gemisum")("reglx")=3 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 企业用户您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
Else
if request.Cookies("Gemisum")("reglx")=2 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 贵宾您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
else
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
end if
end if
response.write "<br><a href=userinfo.asp target=_blank><font color=red>进入会员中心</font></a>"
response.write "<br><a href=logout.asp>注销退出</a>"
end if
%></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      <!-- ********左右小分割******** -->
      <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="66%" class="title_main">最新推荐</td>
                  <td width="1%">&nbsp;</td>
                  <td width="33%" class="title_main2">最新热门</td>
                </tr>
                <tr>
                  <td class="tdbg_main">
				  <%
'####################推荐线路####
Sql="Select Top 1 id,x_Jingdiantupian,x_Name,x_Shuoming From Xianlu where x_top=1"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
%>
<table width="369" height="130"  border="0" cellpadding="5" cellspacing="0">
  <tr>
    <td rowspan="2" align="center"><table width="117" height="97"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="<%=rs("x_Jingdiantupian")%>" width="113" height="93"></td>
        </tr>
    </table></td>
    <td width="229" height="28"><strong><a href="Tours/Tour_<%=rs("id")%>.html" class="text4">
      <%if len(rs("x_Name"))>16 then%>
      <%=left(rs("x_Name"),16)%>...
      <%else%>
      <%=rs("x_Name")%>
      <%end if%>
    </a></strong></td>
  </tr>
  <tr>
    <td valign="top"><%if len(rs("x_Shuoming"))>70 then%>
      <%=left(rs("x_Shuoming"),70)%>...
      <%else%>
      <%=rs("x_Shuoming")%>
      <%end if%></td>
  </tr>
</table>
<%
rs.close
%></td>
                  <td>&nbsp;</td>
                  <td class="tdbg_main"><marquee id="scrollarea" direction="up" scrolldelay="200" scrollamount="2" width="100%" height="130" onmouseover="this.stop();" onmouseout="this.start();">
                    <font color=#ff9900>·&nbsp;</font>没有热门文章
                  </marquee></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
            </table>              </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="180" valign="top" class="border"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="tdbg_leftall"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="title_left">最新调查</td>
                </tr>
                <tr>
                  <td class="tdbg_left"><font color='#ff9900'>·&nbsp;</font>没有任何调查</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td class="tdbg_leftall"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="title_left">友情链接</td>
                </tr>
                <tr>
                  <td align="center" class="tdbg_left"><div align="center">
                      <div id=rolllink style=overflow:hidden;height:100;width:130>
                        <div id=rolllink1>                        </div>
                        <div id=rolllink2></div>
                      </div>
                      <script>
var rollspeed=40
rolllink2.innerHTML=rolllink1.innerHTML
function Marquee(){
if(rolllink2.offsetTop-rolllink.scrollTop<=0)
rolllink.scrollTop-=rolllink1.offsetHeight
else{
rolllink.scrollTop++
}
}
var MyMar=setInterval(Marquee,rollspeed)
rolllink.onmouseover=function() {clearInterval(MyMar)}
rolllink.onmouseout=function() {MyMar=setInterval(Marquee,rollspeed)}
  </script>
                      <select name='FriendSite' onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value,'_blank');}">
                        <option value=''> 您现在的位置:点</option>
                      </select>
                      </div></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      <!-- ********左右小分割******** -->
      <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="5">
        <tr>
          <td class="title_main">线路栏目</td>
        </tr>
        <tr>
          <td align="center"><%
set strs=server.createobject("adodb.recordset")
stsql="select * from board order by xid desc"
strs.open stsql, conn,1,1
while not strs.eof
%>
              <table width='100%'  border='0' cellspacing='0' cellpadding='0'>
        <td valign='top' width='49%'><table width='100%'  border='0' cellspacing='0' cellpadding='0'>
              <tr>
                <td class='title_right'><table width='100%'  border='0' cellspacing='0' cellpadding='0'>
                    <tr>
                      <td width='14'><img src='Themes/images/h_cl1.gif' width='14' height='23'></td>
                      <td><a href='Tours_List.asp?ClassID=<%=strs("ID")%>'><strong><%=strs("board")%></strong></a> </td>
                      <td width='60' align='right'><a href='Tours_List.asp?ClassID=<%=strs("ID")%>'>more...</a>&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height='127' valign='top' class='tdbg_right'><%
x_Leiid=strs("id")
set rs=server.createobject("adodb.recordset")
sql="select top 10 id,x_Leiid,x_Name,x_Baojia from xianlu where Audit=True and x_Leiid="&x_Leiid&" order by id desc"
rs.open sql, conn,1,1
if rs.eof then
response.write " 您现在的位置:文章"
Else
do while not rs.eof
%>
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="78%"><font color='#ff9900'>·&nbsp;</font> <a href="Tours/Tour_<%=rs("id")%>.html">
                          <%if len(rs("x_Name"))>13 then%>
                          <%=left(rs("x_Name"),13)%>...
                          <%else%>
                          <%=rs("x_Name")%>
                          <%end if%>
                        </a></td>
                        <td width="22%"><font color='#ff0000'><%=rs("x_Baojia")%></font></td>
                      </tr>
                    </table>
                    <%
rs.movenext      
loop
end if
rs.close
%></td>
              </tr>
          </table></td>
            <td width='1%'></td>
            <% strs.movenext %>
            <td valign='top' width='49%'><%if not strs.eof then %>
                <table width='100%'  border='0' cellspacing='0' cellpadding='0'>
                  <tr>
                    <td class='title_right'><table width='100%'  border='0' cellspacing='0' cellpadding='0'>
                        <tr>
                          <td width='14'><img src='Themes/images/h_cl1.gif' width='14' height='23'></td>
                          <td><a href='Tours_List.asp?ClassID=<%=strs("ID")%>'><strong><%=strs("board")%></strong></a> </td>
                          <td width='60' align='right'><a href='Tours_List.asp?ClassID=<%=strs("ID")%>'>more...</a>&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height='127' valign='top' class='tdbg_right'><%
x_Leiid=strs("id")
set rs=server.createobject("adodb.recordset")
sql="select top 10 id,x_Leiid,x_Name,x_Baojia from xianlu where Audit=True and x_Leiid="&x_Leiid&" order by id desc"
rs.open sql, conn,1,1
if rs.eof then
response.write " 您现在的位置:文章"
Else
do while not rs.eof
%>
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="78%"><font color='#ff9900'>·&nbsp;</font> <a href="Tours/Tour_<%=rs("id")%>.html">
                              <%if len(rs("x_Name"))>13 then%>
                              <%=left(rs("x_Name"),13)%>...
                              <%else%>
                              <%=rs("x_Name")%>
                              <%end if%>
                            </a></td>
                            <td width="22%"><font color='#ff0000'><%=rs("x_Baojia")%></font></td>
                          </tr>
                        </table>
                        <%
rs.movenext      
loop
end if
rs.close
%></td>
                  </tr>
                </table>
                <% end if %></td>
        </tr><tr>
          <td height="5" colspan="3"></td>
        </tr>
              </table>
              <%
strs.movenext      
wend 
strs.close
set strs=nothing
%></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
    
      <tr>
        <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
        <TD 
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>网站首页</a> | <a href=about.asp?action=about >关于我们</a> | <a href=about.asp?action=lxwm >业务联系</a> | <a href=help.asp?action=shiyongfalv >版权声明</a> | <a href=help.asp?action=fukuan >付款方式</a> | <a href=gbook.asp >留言/建议/投诉</a></td>
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
</div>
</body>
</html>

