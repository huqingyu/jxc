<!--#include file="Connection.asp"-->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--�����Ƽ�</title>
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
                <div align="center"><FONT color=#ffffff><a href="default.htm"><FONT color=#ffffff>��ҳ</Font></a> | <a href="News.asp"><FONT color=#ffffff>���Ŷ�̬</Font></a> | <a href="xl.html"><FONT color=#ffffff>�ȼٲ�Ʒ</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>�Ƶ�Ԥ��</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> ��ƱԤ��</font></a> | <a href="guide.asp"><font color="#FFFFFF">�����Ƽ�</font></a> | <a href="pic.asp"><font color="#FFFFFF">��ͼ����</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">�������</font></a> | <a href="userInfo/userInfo.asp"><font color="#FFFFFF">��Ա����</font></a> | <a href="Help.asp"><font color="#FFFFFF">���߰���</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
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
      <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="default.htm">��վ����ҳ</a>�Ƽ�</td>
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
response.write " �����ڵ�λ��:��Ϣ!"
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
response.write " �����ڵ�λ��:��Ϣ!"
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
                                <td width="42" height="20"><div align="center">����:</div></td>
                                <td width="69">
                                  <div align="left"><%=dyrs("d_name")%> </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">�Ա�:</div></td>
                                <td>
                                  <div align="left">
                                    <%if dyrs("sex")="1" then 
      		response.write "��"
      	elseif dyrs("sex")="0" then
      		response.write "Ů"
      	      	end if
      %>
                                </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">����:</div></td>
                                <td>
                                  <div align="left"><%=dyrs("nianling")%> </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center">����:</div></td>
                                <td>
                                  <div align="left">
                                    <%if dyrs("mingzu")="a" then 
      		response.write "��"
      	elseif dyrs("mingzu")="b" then
      		response.write "��"
      	elseif dyrs("mingzu")="c" then
      		response.write "��"	
      	elseif dyrs("mingzu")="d" then
      		response.write "ά"
      	elseif dyrs("mingzu")="e" then
      		response.write "��"	
      	elseif dyrs("mingzu")="f" then
      		response.write "��"
      	end if
      %>
                                </div></td>
                              </tr>
                              <tr>
                                <td height="20"><div align="center"></div>
                                    <div align="center">����:</div></td>
                                <td height="20">
                                  <div align="left">
                                    <%if dyrs("vip")="1" then 
      		response.write "��ͨ��Ա"
      	elseif dyrs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif dyrs("vip")="3" then
      		response.write "�����Ա"
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
                                      <td width="21%" height="25"><div align="center">����:</div></td>
                                      <td colspan="2">
                                          <input name="name" type="text" id="name" size="15" height="14">
                                          <font color="#FF0000">( �����ڵ�λ��:��)</font>
                                          </td>
                                    </tr>
                                    <tr>
                                      <td height="25"><div align="center">�ȼ�:</div></td>
                                      <td width="39%">
                                          <select name="vip" id="vip" height="20">
                                            <option value="1" selected>��ͨ��Ա</option>
                                            <option value="2">�߼���Ա</option>
                                            <option value="3">�����Ա</option>
                                          </select>
                                      </td>
                                      <td rowspan="3"><input name="imageField" type="image" src="Images/247.jpg" width="89" height="79" border="0"></td>
                                    </tr>
                                    <tr>
                                      <td height="25"><div align="center">�Ա�:</div></td>
                                      <td><select name="sex" id="sex" height="20">
                                            <option value="1" selected>��</option>
                                            <option value="0">Ů</option>
                                          </select></td></tr><tr><td height="25"><div align="center">����:</div></td><td>
                                            <select name="mingzu" id="mingzu">
                                            <option value="" selected>����</option>
                                            <option value="a">��</option>
                                            <option value="b">��</option>
                                            <option value="c">��</option>
                                            <option value="d">ά</option>
                                            <option value="e">��</option>
                                            <option value="f">��</option>
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
      		response.write "��ͨ��Ա"
      	elseif turs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif turs("vip")="3" then
      		response.write "�����Ա"
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
      		response.write "��ͨ��Ա"
      	elseif turs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif turs("vip")="3" then
      		response.write "�����Ա"
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
      		response.write "��ͨ��Ա"
      	elseif turs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif turs("vip")="3" then
      		response.write "�����Ա"
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
      		response.write "��ͨ��Ա"
      	elseif turs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif turs("vip")="3" then
      		response.write "�����Ա"
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
      		response.write "��"
      	elseif vrs("sex")="0" then
      		response.write "Ů"
      	      	end if
      %></td>
                                    <td width="83" valign="middle"><%if vrs("vip")="1" then 
      		response.write "��ͨ��Ա"
      	elseif vrs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif vrs("vip")="3" then
      		response.write "�����Ա"
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
      		response.write "��"
      	elseif vrs("sex")="0" then
      		response.write "Ů"
      	      	end if
      %></td>
                                    <td width="89" valign="middle"><%if vrs("vip")="1" then 
      		response.write "��ͨ��Ա"
      	elseif vrs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif vrs("vip")="3" then
      		response.write "�����Ա"
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
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>��վ��ҳ</a> | <a href=about.asp?action=about >��������</a> | <a href=about.asp?action=lxwm >ҵ����ϵ</a> | <a href=help.asp?action=shiyongfalv >��Ȩ����</a> | <a href=help.asp?action=fukuan >���ʽ</a> | <a href=gbook.asp >����/����/Ͷ��</a></td>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
    </tr>
    <tr>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "����˾��ַ��"&dizhi&"���������룺"&youbian&"<br>"
response.Write "���ͷ����䣺<a href=mailto:"&webemail&">"&webemail&"</a>���ͷ��绰��"&dianhua&"<br>��"
response.write trim(rs("gongzuoshijian"))
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " �����ڵ�λ��:��"&FormatNumber((endtime-startime)*1000,3)&" ����"
rs.close
set rs=nothing%>
      </div></td>
    </tr>
  
</TABLE>
    </div>
</body>
</html>