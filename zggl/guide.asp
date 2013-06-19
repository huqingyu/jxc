<!--#include file="Connection.asp"-->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--导游推荐</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>
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
<TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
  
    <TR bgColor=#ffffff>
      <TD colSpan=3 height=2></td>
    </tr>
    <tr>
      <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
      <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="default.htm">网站的首页</a>推荐</td>
      <TD width="11">&nbsp;</td>
    </tr>
  
</TABLE>
    <TABLE width=770 border=0 align="center" cellPadding=0 cellSpacing=0>
      
        <tr>
          <td>
            <TABLE cellSpacing=0 cellPadding=0 width=770 border=0>
              
                <tr>
                  <TD width=177 height="562" vAlign=top 
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
                  <TD width="593" align=left vAlign=top style="BORDER-RIGHT: #d8d8d8 1px solid">
                    <table width="582"  border="0" align="center" cellpadding="0" cellspacing="0">
  <td width="582" align="center" valign="top"><table width="99%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="195" background="images/daoyou.png">&nbsp;</td>
        </tr>
      </table>
          <table width="99%" border=0 align="center" cellPadding=0 cellSpacing=0>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" height="200" background="images/youxiu.gif"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="4%" height="54">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td width="4%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="102">&nbsp;</td>
                          <td>
                            <%
sqld="select * from daoyou where tuijian=1" 
set dyrs=server.createobject("adodb.recordset")
dyrs.open sqld,conn,1,1
%>
                            <table width="92%" height="130"  border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="110" height="120" rowspan="6"><img src="<%=dyrs("img")%>" width="109" height="125"></td>
                                <td width="42" height="20"><div align="center">姓名:</div></td>
                                <td width="69">
                                  <div align="left"><%=dyrs("d_name")%> </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">性别:</div></td>
                                <td>
                                  <div align="left">
                                    <%if dyrs("sex")="1" then 
      		response.write "男"
      	elseif dyrs("sex")="0" then
      		response.write "女"
      	      	end if
      %>
                                </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">年龄:</div></td>
                                <td>
                                  <div align="left"><%=dyrs("nianling")%> </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">民族:</div></td>
                                <td>
                                  <div align="left">
                                    <%if dyrs("mingzu")="a" then 
      		response.write "汉"
      	elseif dyrs("mingzu")="b" then
      		response.write "回"
      	elseif dyrs("mingzu")="c" then
      		response.write "彝"	
      	elseif dyrs("mingzu")="d" then
      		response.write "维"
      	elseif dyrs("mingzu")="e" then
      		response.write "哈"	
      	elseif dyrs("mingzu")="f" then
      		response.write "蒙"
      	end if
      %>
                                </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center"></div>
                                    <div align="center">级别:</div></td>
                                <td height="20">
                                  <div align="left">
                                    <%if dyrs("vip")="1" then 
      		response.write "普通会员"
      	elseif dyrs("vip")="2" then
      		response.write "高级会员"
      	elseif dyrs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                </div></td>
                              </tr>
                              <tr>
                                <td height="30" colspan="2"><div align="center"><a href="daoyouinfo.asp?id=<%=dyrs("id")%>" target =_blank><img src="images/button1.gif" width="85" height="25" border="0"></a></div></td>
                              </tr>
                            </table>
                            <%
dyrs.Close
%>
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="12">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                    </table></td>
                    <td colspan="2"><table width="89%"  border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><img src="images/select.gif" width="319" height="55"></td>
                        </tr>
                        <tr>
                          <td height="126" valign="top"><table border=1 align="right" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#FFFFFF">
                              <tr>
                                <td width="313"><table width="97%" height="110"  border="0" align="center" cellpadding="0" cellspacing="0">
                                    <form name="form1" method="post" action="Searchdaoyou.asp"><tr>
                                      <td width="21%" height="25"><div align="center">姓名:</div></td>
                                      <td colspan="2">
                                          <input name="name" type="text" id="name" size="15" height="14">
                                          <font color="#FF0000">( 您现在的位置:空)</font>
                                          </td>
                                    </tr>
                                    <tr>
                                      <td height="25"><div align="center">等级:</div></td>
                                      <td width="39%">
                                          <select name="vip" id="vip" height="20">
                                            <option value="1" selected>普通会员</option>
                                            <option value="2">高级会员</option>
                                            <option value="3">铂金会员</option>
                                          </select>
                                      </td>
                                      <td rowspan="3"><input name="imageField" type="image" src="Images/247.jpg" width="89" height="79" border="0"></td>
                                    </tr>
                                    <tr>
                                      <td height="25"><div align="center">性别:</div></td>
                                      <td><select name="sex" id="sex" height="20">
                                            <option value="1" selected>男</option>
                                            <option value="0">女</option>
                                          </select></td></tr><tr><td height="25"><div align="center">民族:</div></td><td>
                                            <select name="mingzu" id="mingzu">
                                            <option value="" selected>不限</option>
                                            <option value="a">汉</option>
                                            <option value="b">回</option>
                                            <option value="c">彝</option>
                                            <option value="d">维</option>
                                            <option value="e">哈</option>
                                            <option value="f">蒙</option>
                                          </select></td></tr>
                                </form></table>
                                  </td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
                  <table width="98%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="60"><div align="right"><img src="images/fencai.gif" width="444" height="53" align="bottom"></div></td>
                    </tr>
                  </table>
                  <table width="100%" height="171"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><table width="100%" height="189" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <%
if request("D_name")="" then
sql="select top 4 * from daoyou order by id DESC"
else
sql="select top 4 * from daoyou order by id DESC"
end if
Set turs=Server.CreateObject("ADODB.RecordSet") 
turs.open sql,conn,1,1
n=0
do while not turs.eof 
%>
                            <td height="189" align="center"><TABLE width=50% border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                                
                                  <TR align=middle>
                                    <TD height=20>
                                      <div align="center">
                                        <%if turs("vip")="1" then 
      		response.write "普通会员"
      	elseif turs("vip")="2" then
      		response.write "高级会员"
      	elseif turs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <TD height=85 align=middle>
                                      <TABLE cellSpacing=0 cellPadding=0 width=77 border=0>
                                        
                                          <tr>
                                            <TD width=77 height="113" bgcolor="#F9F9F9"><a href="daoyouinfo.asp?id=<%=turs("id")%>" target =_blank><img src="<%=turs("img")%>" width="120" height="130" border="0"></A></td>
                                          </tr>
                                        
                                    </TABLE></td>
                                  </tr>
                                
                            </TABLE></td>
                            <%
turs.movenext
if turs.eof or turs.bof then 
exit do
end if
%>
                            <td><TABLE width=50% border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                                
                                  <TR align=middle>
                                    <TD height=20>
                                      <div align="center">
                                        <%if turs("vip")="1" then 
      		response.write "普通会员"
      	elseif turs("vip")="2" then
      		response.write "高级会员"
      	elseif turs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <TD height=85 align=middle>
                                      <TABLE cellSpacing=0 cellPadding=0 width=77 border=0>
                                        
                                          <tr>
                                            <TD width=77 height="113"><a href="daoyouinfo.asp?id=<%=turs("id")%>" target =_blank><img src="<%=turs("img")%>" width="120" height="130" border="0"></a></td>
                                          </tr>
                                        
                                    </TABLE></td>
                                  </tr>
                                
                            </TABLE></td>
                            <%
turs.movenext
if turs.eof or turs.bof then 
exit do
end if
%>
                            <td><TABLE width=50% border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                                
                                  <TR align=middle>
                                    <TD height=20>
                                      <div align="center">
                                        <%if turs("vip")="1" then 
      		response.write "普通会员"
      	elseif turs("vip")="2" then
      		response.write "高级会员"
      	elseif turs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <TD height=85 align=middle>
                                      <TABLE cellSpacing=0 cellPadding=0 width=77 border=0>
                                        
                                          <tr>
                                            <TD width=77 height="113"><a href="daoyouinfo.asp?id=<%=turs("id")%>" target =_blank><img src="<%=turs("img")%>" width="120" height="130" border="0"></a></td>
                                          </tr>
                                        
                                    </TABLE></td>
                                  </tr>
                                
                            </TABLE></td>
                            <%
turs.movenext
if turs.eof or turs.bof then 
exit do
end if
%>
                            <td><TABLE width=50% border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                                
                                  <TR align=middle>
                                    <TD height=20>
                                      <div align="center">
                                        <%if turs("vip")="1" then 
      		response.write "普通会员"
      	elseif turs("vip")="2" then
      		response.write "高级会员"
      	elseif turs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <TD height=85 align=middle>
                                      <TABLE cellSpacing=0 cellPadding=0 width=77 border=0>
                                        
                                          <tr>
                                            <TD width=77 height="113"><a href="daoyouinfo.asp?id=<%=turs("id")%>" target =_blank><img src="<%=turs("img")%>" width="120" height="130" border="0"></a></td>
                                          </tr>
                                        
                                    </TABLE></td>
                                  </tr>
                                
                            </TABLE></td>
                            <%
turs.movenext
if turs.eof or turs.bof then 
exit do
end if
%>
                            <%
turs.movenext                                                  
loop
turs.close
%>
                                  </table></td>
                    </tr>
                  </table>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="50%" height="36"><div align="center"><img src="images/bojing.gif" width="277" height="33"></div></td>
                      <td width="50%"><div align="center"><img src="images/gaoji.gif" width="277" height="33"></div></td>
                    </tr>
                  </table>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="50%" height="188" valign="top"><div align="center">
                          <table  border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                            <tr>
                              <td width="263" height="30"><img src="images/w1.gif" width="263" height="30"></td>
                            </tr>
                            <tr>
                              <td height="140" valign="top">
                                <%
	topb="select top 7 id,d_name,sex,vip from daoyou where tuijian=1"
	set vrs=conn.execute (topb)
	while not vrs.eof
	%>
                                <table width="100%"  border="0" cellpadding="1" cellspacing="0" bordercolor="#000000">
                                  <tr>
                                    <td width="86" height="18" valign="middle" bgcolor="#F0F0F0"><a href="daoyouinfo.asp?id=<%=vrs("id")%>" target =_blank><%=vrs("d_name")%></a></td>
                                    <td width="80" valign="middle"><%if vrs("sex")="1" then 
      		response.write "男"
      	elseif vrs("sex")="0" then
      		response.write "女"
      	      	end if
      %></td>
                                    <td width="83" valign="middle"><%if vrs("vip")="1" then 
      		response.write "普通会员"
      	elseif vrs("vip")="2" then
      		response.write "高级会员"
      	elseif vrs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %></td>
                                  </tr>
                                  <tr bgcolor="#CACACA">
                                    <td height="1" colspan="3" valign="top" bgcolor="#E8E8E8"></td>
                                  </tr>
                                </table>
                                <%
	vrs.movenext
	wend
	%>
                              </td>
                            </tr>
                          </table>
                      </div></td>
                      <td width="50%" valign="top"><div align="center">
                          <table border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                            <tr>
                              <td height="30"><img src="images/w1.gif" width="263" height="30"></td>
                            </tr>
                            <tr>
                              <td height="140" valign="top">
                                <%
	topb="select top 7 id,d_name,sex,vip from daoyou order by id DESC"
	set vrs=conn.execute (topb)
	while not vrs.eof
	%>
                                <table width="100%"  border="0" cellpadding="1" cellspacing="0" bordercolor="#000000">
                                  <tr>
                                    <td width="88" height="18" valign="middle" bgcolor="#F0F0F0"><a href="daoyouinfo.asp?id=<%=vrs("id")%>" target =_blank><%=vrs("d_name")%></a></td>
                                    <td width="78" valign="middle"><%if vrs("sex")="1" then 
      		response.write "男"
      	elseif vrs("sex")="0" then
      		response.write "女"
      	      	end if
      %></td>
                                    <td width="89" valign="middle"><%if vrs("vip")="1" then 
      		response.write "普通会员"
      	elseif vrs("vip")="2" then
      		response.write "高级会员"
      	elseif vrs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %></td>
                                  </tr>
                                  <tr bgcolor="#E8E8E8">
                                    <td height="1" colspan="3" valign="top"></td>
                                  </tr>
                                </table>
                                <%
	vrs.movenext
	wend
	%>
                              </td>
                            </tr>
                          </table>
                      </div></td>
                    </tr>
                </table></td>
            </tr>
          </table></td>
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