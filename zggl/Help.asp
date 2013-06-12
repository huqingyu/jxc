<!--#include file="Connection.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--在线帮助</title>
</head>
<%
dim action
action=request.QueryString("action")
if InStr(action,"'")>0 then
response.write"<script>alert(""非法访问!"");location.href=""Default.htm"";</script>"
response.end
end if
%>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/top.jpg" tppabs="/img/top.jpg" width="980" height="81" border="0" usemap="#Map"></td>
  </tr>
</table>
<table width="980" height="30" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="539">&nbsp;<img src="img/shouye.gif" tppabs="/img/shouye.gif" width="11" height="11"><span class="word1"><A 
            onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('index.htm'/*tpa=/*/);return false;" 
            href="index.htm#" tppabs="/#">设为首页</A> <img src="img/shoucang.gif" tppabs="/img/shoucang.gif" width="11" height="11"> <A  
            href="javascript:window.external.AddFavorite('index.htm'/*tpa=/*/,%20' 您现在的位置:旅行社')">加入收藏</A></span></td>
    <td width="401"><span class="tel"><strong>咨询热线：0371-6703 7777（不占线）</strong></span></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center" ><table width="930"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60" height="36" align="center" background="img/over_sample.gif" tppabs="/img/over_sample.gif" class="menu2"><a href="index.asp" tppabs="/index.asp"><font color="ffffff">首 页</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/about.asp?action=about" tppabs="/inguolv.asp"><font color="#0D7DC8">走进国旅</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=64" tppabs="/news.asp"><font color="#0D7DC8">新闻中心</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/cjy.asp" tppabs="/category.asp?category=1&categoryname=出境游"><font color="#0D7DC8">出境游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/gny.asp" tppabs="/category.asp?category=2&categoryname=国内游"><font color="#0D7DC8">国内游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/sny.asp" tppabs="/category.asp?category=3&categoryname=省内游"><font color="0D7DC8">省内游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/" tppabs="/newest.asp"><font color="#0D7DC8">最新线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/glxl.asp" tppabs="/guolv.asp"><font color="#0D7DC8">国旅线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/tjxl.asp" tppabs="/special.asp"><font color="#0D7DC8">特价线路</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/djy.asp" tppabs="/category.asp?category=4&categoryname=地接游"><font color="#0D7DC8">地接游</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=67" tppabs="/jingqu.asp"><font color="#0D7DC8">河南景区</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/hotel.asp" tppabs="/hotel.asp"><font color="#0D7DC8">河南酒店</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=70" tppabs="/zhinan.asp"><font color="#0D7DC8">旅游指南</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=76" tppabs="/changshi.asp"><font color="#0D7DC8">旅游常识</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=66" tppabs="/qianzheng.asp"><font color="#0D7DC8">签 证</font></a></td>
          <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=75" tppabs="http://m.citshn.com/" target="_blank"><font color="#0D7DC8">会议考察</font></a></td>
      </tr>
    </table></td>
  </tr>
</table>


<map name="Map" id="Map"><area shape="rect" coords="837,44,909,66" href="javascript:if(confirm('http://www.hnggw.net.cn/  \n\n文件并未依 Teleport Pro 取回，因为 您现在的位置: 您现在的位置:置的范围。  \n\n 您现在的位置:打开它吗？'))window.location='http://www.hnggw.net.cn/'" tppabs="http://www.hnggw.net.cn/" /><area shape="rect" coords="836,16,910,39" href="javascript:if(confirm('http://en.citshn.com/  \n\n文件并未依 Teleport Pro 取回，因为 您现在的位置: 您现在的位置:置的范围。  \n\n 您现在的位置:打开它吗？'))window.location='http://en.citshn.com/'" tppabs="http://en.citshn.com/" />
</map>




<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" bgcolor="0D7DC8">&nbsp;</td>
  </tr>
  <tr>
    <td height="15" colspan="3" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td width="78" align="center" bgcolor="#015AB6"><img src="img/1.jpg" tppabs="/img/1.jpg" width="51" height="193"></td>
    <td width="786" align="center" bgcolor="#015AB6"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="780" height="226">
      <param name="movie" value="img/flash.swf" tppabs="/img/flash.swf">
      <param name="quality" value="high">
      <embed src="img/flash.swf" tppabs="/img/flash.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="780" height="226"></embed>
    </object></td>
    <td width="78" align="center" bgcolor="#015AB6"><img src="img/2.jpg" tppabs="/img/2.jpg" width="50" height="188"></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="618"><table width="621" border="0" align="left" cellpadding="0" cellspacing="0">
      <form action="/User_ChkLogin.asp" method="post" name="Login" id="Login" onsubmit="return CheckForm();">
        <tr>
          <td width="3%"><img src="img/member.gif" tppabs="/img/member.gif" width="12" height="20" /></td>
          <td width="9%" align="center" class="menu1">用户名：</td>
          <td width="16%" class="menu1"><input type="text"  name="username" size="14" class='an5'>
          </td>
          <td width="8%" align="center" class="menu1">密码：</td>
          <td width="20%" class="menu1"><input type="password"  name="userpassword" size="14" class='an5'>
                <input name="ComeUrl" type="hidden" id="ComeUrl" value="index.asp" />
          </td>
		  <td width="8%" align="center" class="menu1">密码：</td>
          <td width="18%" class="menu1"><input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6 class="an6"> <img src=GetCode.asp></td>
          <td width="9%"><input name="image" type="image" src="img/login.gif" width="48" height="19" border="0" tppabs="/img/login.gif" /></td>
          <td width="9%" class="menu1"><a href="/User_Reg.asp" tppabs="/User_Reg.asp" target="_blank">免费注册</a></td>
        </tr>
      </form>
    </table></td>
    <td width="350"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8%"><img src="img/news.gif" tppabs="/img/news.gif" width="23" height="18" /></td>
        <td width="19%"><span class="menu1">本站公告：</span></td>
        <td width="73%"><marquee direction= "left" scrollamount="2" scrolldelay="5" class="word1"  onmouseover="this.stop()" onmouseout="this.start()">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=63 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="25"><a href="show.asp?id=<%=rs("id")%>" target="_blank"> <%=left(rs("bt"),14)%> </a></td>
            </tr>
            <% rs.movenext 
wend 
			 %>
          </table>
        </marquee></td>
      </tr>
    </table></td>
  </tr>
</table>
<TABLE width="980" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
  
    <TR bgColor=#ffffff>
      <TD colSpan=3 height=2></td>
    </tr>
    <tr>
      <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
      <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a>帮助</td>
      <TD width="11">&nbsp;</td>
    </tr>
  
</TABLE>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" class="table-zuoyou">
  <tr>
    <td width="213" valign="top" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="BORDER-left: #d8d8d8 1px solid;BORDER-right: #d8d8d8 1px solid"><table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
        <table width="94%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
          <tr>
            <td height="31" background="Images/topBar_bg.gif">&nbsp;帮助主题</td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href="help.asp?action=gouwuliucheng">消费流程</a> </td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href="help.asp?action=fukuan">付款方式</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=tiaokuan>交易条款</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=jifen>积分奖励</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=vip>VIP特惠</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=gongzuoshijian> 您现在的位置:</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=shiyongfalv> 您现在的位置:声明</a></td>
                </tr>
                <tr>
                  <td height="24" background="images/bg_guide02.gif">　 <a href=help.asp?action=changjianwenti>常见问题</a></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    <td valign="top" class="table-zuo" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td rowspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td  style="BORDER-RIGHT: #d8d8d8 1px solid" ><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="165" valign="top" bgcolor="#FFFFFF"><table width="10" height="7" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td></td>
                                </tr>
                              </table>
                                <%select case action
		  case "fukuan"
		  %>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 付款方式 </td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select huikuanfangshi from config",conn,1,1
				response.write trim(rs("huikuanfangshi"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case "jifen"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 积分奖励</td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select jifen from config",conn,1,1
				response.write trim(rs("jifen"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case "vip"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> VIP特惠</td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select vip from config",conn,1,1
				response.write trim(rs("vip"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case "tiaokuan"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 交易条款</td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table3">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select jiaoyitiaokuan from config",conn,1,1
				response.write trim(rs("jiaoyitiaokuan"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                
                                <%case "gongzuoshijian"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 您现在的位置: </td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table5">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select gongzuoshijian from config",conn,1,1
				response.write trim(rs("gongzuoshijian"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case "changjianwenti"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 常见问题</td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table8">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select changjianwenti from config",conn,1,1
				response.write trim(rs("changjianwenti"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case "shiyongfalv"%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> 您现在的位置:声明 </td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table9">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select shiyongfalv from config",conn,1,1
				response.write trim(rs("shiyongfalv"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%case else%>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="30"><img src="images/ring01.gif"> <a href="help.asp?action=gouwuliucheng">消费流程</a></td>
                                  </tr>
                                </table>
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table9">
                                  <tr>
                                    <td><%set rs=server.CreateObject("adodb.recordset")
				rs.open "select gouwuliucheng from config",conn,1,1
				response.write trim(rs("gouwuliucheng"))
				rs.close
				set rs=nothing%>
                                    </td>
                                  </tr>
                                </table>
                                <%end select%>
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table><table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#39AE29">&nbsp;</td>
    <td width="890" height="30" align="center" background="images/endd_02.jpg" bgcolor="#39AE29" style=" color:#FFFFFF;"><a href=Default.htm>网站首页</a> | <a href=about.asp?action=about >关于我们</a> | <a href=about.asp?action=lxwm >业务联系</a> | <a href=help.asp?action=shiyongfalv >版权声明</a> | <a href=help.asp?action=fukuan >付款方式</a> | <a href=gbook.asp >留言/建议/投诉</a></td>
    <td bgcolor="#39AE29">&nbsp;</td>
  </tr>
  <tr>
    <td height="75" colspan="3" align="center" background="images/endd_04.jpg">
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" style="line-height:16px;"> <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
%><br>传真：0371-65852352　客服QQ：<a href="tencent://message/?uin=909888314&Site=河南国旅&Menu=yes">909888314</a></td>
        <td><img src="Images/coy.jpg" width="25" height="31" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>