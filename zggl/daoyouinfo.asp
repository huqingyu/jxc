<%
dim id
id=request("id")
if id="" then
session("errormsg")=" 您现在的位置:的ID 您现在的位置:找。"
Response.Redirect "error.asp"
end if
%>
<!--#include file="Connection.asp"-->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--导游信息</title>
</HEAD>
<BODY>
    <TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      
        <tr>
          <TD width="35%" height="81" align=left 
                  bgColor=#ffffff class=b><div align="center"><img src="<%=weblogo%>"></div></td>
          <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff class=b><div align="center"><img src="<%=webbanner%>"></div></td>
        </tr>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 class=9>
              
                <tr>
                  <TD align=left vAlign=middle background="images/top_bar.gif" class=b>
                    <div align="center"><FONT color=#ffffff><a href="default.htm"><FONT color=#ffffff>首页</Font></a> | <a href="News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | <a href="userInfo/userInfo.asp"><font color="#FFFFFF">会员中心</font></a> | <a href="Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
                </tr>
              
          </TABLE></td>
        </tr>
      
    </TABLE>
    <TABLE width=770 border=0 align="center" cellPadding=0 cellSpacing=0>
      
        <tr>
          <td>
            <TABLE width="100%" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
              
                <TR bgColor=#ffffff>
                  <TD colSpan=3 height=2></td>
                </tr>
                <tr>
                  <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
                  <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a> &gt;&gt; <a href="guide.asp">导游推荐</a>信息</td>
                  <TD width="11">&nbsp;</td>
                </tr>
              
            </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width=770 border=0>
              
                <tr>
                  <TD width=185 height="562" vAlign=top 
          bgColor=#f6f6f6 style="BORDER-RIGHT: #d8d8d8 1px solid;BORDER-left: #d8d8d8 1px solid"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    
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
                        <TD background=Img/homedhbg.gif><TABLE cellSpacing=0 cellPadding=0 width="183" border=0>
                            
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
                        <TD background=Img/homedhbg.gif>
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
                  <TD vAlign=top align=left style="BORDER-RIGHT: #d8d8d8 1px solid">
                    <table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <td height="195" align="center" valign="top" background="images/daoyou.png">&nbsp;</td>
  </tr>
                    </table><%
set rs=server.createobject("adodb.recordset")
sql="select * from daoyou where id="+ id
rs.Open sql,conn
%>
                    <table width="99%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                      <tr>
                        <td><div align="center">
                          <table width="97%" height="305"  border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="47%"><div align="left"><a href="<%=rs("poho")%>" target=_blank><img src="<%=rs("poho")%>" width="249" height="295" border="0"></a></div></td>
                              <td width="53%">
                                <TABLE width="297" border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                                  
                                    <tr>
                                      <TD height=30 colspan="2" align=middle background="Images/topBar_bg.gif" ><div align="center"> <font color="#ff6600">
                                          <%if rs("vip")="1" then 
      		response.write "普通会员"
      	elseif rs("vip")="2" then
      		response.write "高级会员"
      	elseif rs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                      </font> </div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD height=21 align=middle>编号：</td>
                                      <TD width="218"><div align="left">&nbsp;<%=rs("id")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD height=21 align=middle>姓名：</td>
                                      <td><div align="left">&nbsp;<%=rs("d_name")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD width=73 
height=21 align=middle class=albtd16>性别：</td>
                                      <td><div align="left"> &nbsp;<%if rs("sex")="1" then 
      		response.write "男"
      	elseif rs("sex")="0" then
      		response.write "女"
      	      	end if
      %>
                                      </div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>年龄：</td>
                                      <td><div align="left">&nbsp;<%=rs("nianling")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>民族：</td>
                                      <td><div align="left"> &nbsp;<%if rs("mingzu")="a" then 
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
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>电子邮件：</td>
                                      <td><div align="left">&nbsp;<%=rs("mail")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>联系地址：</td>
                                      <td><div align="left">&nbsp;<%=rs("add")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>联系电话：</td>
                                      <td><div align="left">&nbsp;<%=rs("tel")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>掌握语言：</td>
                                      <td><div align="left">&nbsp;<%=rs("lang")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=53 align=middle class=albtd16>擅长线路：</td>
                                      <td><div align="left">&nbsp;<%=rs("xianlu")%></div></td>
                                    </tr>
                                  
                              </TABLE></td>
                            </tr>
                          </table>
                          <TABLE border=1  width="97%" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                            
                              <tr>
                                <TD height="30" background="Images/topBar_bg.gif" class=albtd10>&nbsp;<img src="Images/ring01.gif" width="9" height="9" align="absmiddle"> 个人介绍</td>
                              </tr>
                              <tr>
                                <TD height="89"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><%=rs("info")%></td>
                                  </tr>
                                </table></td>
                              </tr>
                            
                          </TABLE>
                          <table width="97%"  border="0" cellspacing="0" cellpadding="0" >
                            <tr>
                              <td height="10"></td>
                            </tr>
                          </table>
                          <TABLE border=1  width="97%" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                            
                              <tr>
                                <TD height="30" background="Images/topBar_bg.gif" class=albtd10>&nbsp;<img src="Images/ring01.gif" width="9" height="9" align="absmiddle"> 备注 </td>
                              </tr>
                              <tr>
                                <TD height="89">
                                <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><%=rs("back")%></td>
                                  </tr>
                                </table></td>
                              </tr>
                            
                          </TABLE>
                          <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                            
                              <tr>
                                <TD height=8></td>
                              </tr>
                            
                          </TABLE>
                        </div></td>
                      </tr>
                  </table></td>
                </tr>
              
          </TABLE></td>
        </tr>
      
    </TABLE>
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
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " 您现在的位置:："&FormatNumber((endtime-startime)*1000,3)&" 毫秒"
%>
          </div></td>
        </tr>
      
    </TABLE>
    </div>
<%
rs.Close
conn.Close
%>		
</body>
</html>