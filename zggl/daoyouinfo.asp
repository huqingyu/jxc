<%
dim id
id=request("id")
if id="" then
session("errormsg")=" �����ڵ�λ��:��ID �����ڵ�λ��:�ҡ�"
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
<title><%=webname%>--������Ϣ</title>
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
                    <div align="center"><FONT color=#ffffff><a href="default.htm"><FONT color=#ffffff>��ҳ</Font></a> | <a href="News.asp"><FONT color=#ffffff>���Ŷ�̬</Font></a> | <a href="xl.html"><FONT color=#ffffff>�ȼٲ�Ʒ</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>�Ƶ�Ԥ��</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> ��ƱԤ��</font></a> | <a href="guide.asp"><font color="#FFFFFF">�����Ƽ�</font></a> | <a href="pic.asp"><font color="#FFFFFF">��ͼ����</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">�������</font></a> | <a href="userInfo/userInfo.asp"><font color="#FFFFFF">��Ա����</font></a> | <a href="Help.asp"><font color="#FFFFFF">���߰���</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
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
                  <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="default.htm">��վ����ҳ</a> &gt;&gt; <a href="guide.asp">�����Ƽ�</a>��Ϣ</td>
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
      		response.write "��ͨ��Ա"
      	elseif rs("vip")="2" then
      		response.write "�߼���Ա"
      	elseif rs("vip")="3" then
      		response.write "�����Ա"
      	      	end if
      %>
                                      </font> </div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD height=21 align=middle>��ţ�</td>
                                      <TD width="218"><div align="left">&nbsp;<%=rs("id")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD height=21 align=middle>������</td>
                                      <td><div align="left">&nbsp;<%=rs("d_name")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD width=73 
height=21 align=middle class=albtd16>�Ա�</td>
                                      <td><div align="left"> &nbsp;<%if rs("sex")="1" then 
      		response.write "��"
      	elseif rs("sex")="0" then
      		response.write "Ů"
      	      	end if
      %>
                                      </div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>���䣺</td>
                                      <td><div align="left">&nbsp;<%=rs("nianling")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>���壺</td>
                                      <td><div align="left"> &nbsp;<%if rs("mingzu")="a" then 
      		response.write "��"
      	elseif rs("mingzu")="b" then
      		response.write "��"
      	elseif rs("mingzu")="c" then
      		response.write "��"	
      	elseif rs("mingzu")="d" then
      		response.write "ά"
      	elseif rs("mingzu")="e" then
      		response.write "��"	
      	elseif rs("mingzu")="f" then
      		response.write "��"
      	end if
      %>
                                      </div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>�����ʼ���</td>
                                      <td><div align="left">&nbsp;<%=rs("mail")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>��ϵ��ַ��</td>
                                      <td><div align="left">&nbsp;<%=rs("add")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>��ϵ�绰��</td>
                                      <td><div align="left">&nbsp;<%=rs("tel")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=21 align=middle class=albtd16>�������ԣ�</td>
                                      <td><div align="left">&nbsp;<%=rs("lang")%></div></td>
                                    </tr>
                                    <TR bgColor=#F5F5F5>
                                      <TD 
height=53 align=middle class=albtd16>�ó���·��</td>
                                      <td><div align="left">&nbsp;<%=rs("xianlu")%></div></td>
                                    </tr>
                                  
                              </TABLE></td>
                            </tr>
                          </table>
                          <TABLE border=1  width="97%" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
                            
                              <tr>
                                <TD height="30" background="Images/topBar_bg.gif" class=albtd10>&nbsp;<img src="Images/ring01.gif" width="9" height="9" align="absmiddle"> ���˽���</td>
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
                                <TD height="30" background="Images/topBar_bg.gif" class=albtd10>&nbsp;<img src="Images/ring01.gif" width="9" height="9" align="absmiddle"> ��ע </td>
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
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>��վ��ҳ</a> | <a href=about.asp?action=about >��������</a> | <a href=about.asp?action=lxwm >ҵ����ϵ</a> | <a href=help.asp?action=shiyongfalv >��Ȩ����</a> | <a href=help.asp?action=fukuan >���ʽ</a> | <a href=gbook.asp >����/����/Ͷ��</a></td>
          <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
        </tr>
        <tr>
          <TD height=60><div align="center">
              <%dim endtime
endtime=timer()
response.Write "����˾��ַ��"&dizhi&"���������룺"&youbian&"<br>"
response.Write "���ͷ����䣺<a href=mailto:"&webemail&">"&webemail&"</a>���ͷ��绰��"&dianhua&"<br>��"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " �����ڵ�λ��:��"&FormatNumber((endtime-startime)*1000,3)&" ����"
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