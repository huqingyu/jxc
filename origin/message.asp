<!--#include file="common/conn.asp"-->
<!--#include file="common/webconfig.asp"-->

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--�������</title>
</head>
<body>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

function checkfk()
{
   if(checkspace(document.fkinfo.fksubject.value)) {
	document.fkinfo.fksubject.focus();
    alert(" �����ڵ�λ��:��");
	return false;
  }
   if(checkspace(document.fkinfo.fkusername.value)) {
	document.fkinfo.fkusername.focus();
    alert(" �����ڵ�λ��:��");
	return false;
  }
   if(checkspace(document.fkinfo.fklaizi.value)) {
	document.fkinfo.fklaizi.focus();
    alert(" �����ڵ�λ��:�");
	return false;
  }
     if(checkspace(document.fkinfo.fkcontent.value)) {
	document.fkinfo.fkcontent.focus();
    alert(" �����ڵ�λ��:���ݣ�");
	return false;
  }
  
  if(document.fkinfo.fkemail.value.length!=0)
  {
    if (document.fkinfo.fkemail.value.charAt(0)=="." ||        
         document.fkinfo.fkemail.value.charAt(0)=="@"||       
         document.fkinfo.fkemail.value.indexOf('@', 0) == -1 || 
         document.fkinfo.fkemail.value.indexOf('.', 0) == -1 || 
         document.fkinfo.fkemail.value.lastIndexOf("@")==document.fkinfo.fkemail.value.length-1 || 
         document.fkinfo.fkemail.value.lastIndexOf(".")==document.fkinfo.fkemail.value.length-1)
     {
      alert("Email �����ڵ�λ��:��");
      document.fkinfo.fkemail.focus();
      return false;
      }
   }
 else
  {
   alert("Email����Ϊ�գ�");
   document.fkinfo.fkemail.focus();
   return false;
   }

}
//-->
</script> 
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/top.jpg" tppabs="/img/top.jpg" width="980" height="81" border="0" usemap="#Map"></td>
  </tr>
</table>
<table width="980" height="30" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="539">&nbsp;<img src="img/shouye.gif" tppabs="/img/shouye.gif" width="11" height="11"><span class="word1"><A 
            onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('index.htm'/*tpa=/*/);return false;" 
            href="index.htm#" tppabs="/#">��Ϊ��ҳ</A> <img src="img/shoucang.gif" tppabs="/img/shoucang.gif" width="11" height="11"> <A  
            href="javascript:window.external.AddFavorite('index.htm'/*tpa=/*/,%20' �����ڵ�λ��:������')">�����ղ�</A></span></td>
    <td width="401"><span class="tel"><strong>��ѯ���ߣ�0371-6703 7777����ռ�ߣ�</strong></span></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center" ><table width="930"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60" height="36" align="center" background="img/over_sample.gif" tppabs="/img/over_sample.gif" class="menu2"><a href="index.asp" tppabs="/index.asp"><font color="ffffff">�� ҳ</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/about.asp?action=about" tppabs="/inguolv.asp"><font color="#0D7DC8">�߽�����</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=64" tppabs="/news.asp"><font color="#0D7DC8">��������</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/cjy.asp" tppabs="/category.asp?category=1&categoryname=������"><font color="#0D7DC8">������</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/gny.asp" tppabs="/category.asp?category=2&categoryname=������"><font color="#0D7DC8">������</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/sny.asp" tppabs="/category.asp?category=3&categoryname=ʡ����"><font color="0D7DC8">ʡ����</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/" tppabs="/newest.asp"><font color="#0D7DC8">������·</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/glxl.asp" tppabs="/guolv.asp"><font color="#0D7DC8">������·</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/tjxl.asp" tppabs="/special.asp"><font color="#0D7DC8">�ؼ���·</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/djy.asp" tppabs="/category.asp?category=4&categoryname=�ؽ���"><font color="#0D7DC8">�ؽ���</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=67" tppabs="/jingqu.asp"><font color="#0D7DC8">���Ͼ���</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/hotel.asp" tppabs="/hotel.asp"><font color="#0D7DC8">���ϾƵ�</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=70" tppabs="/zhinan.asp"><font color="#0D7DC8">����ָ��</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=76" tppabs="/changshi.asp"><font color="#0D7DC8">���γ�ʶ</font></a></td>
        <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=66" tppabs="/qianzheng.asp"><font color="#0D7DC8">ǩ ֤</font></a></td>
          <td width="58" align="center" background="img/menubg.gif" tppabs="/img/menubg.gif" class="menu1"><a href="/list.asp?tp=75" tppabs="http://m.citshn.com/" target="_blank"><font color="#0D7DC8">���鿼��</font></a></td>
      </tr>
    </table></td>
  </tr>
</table>


<map name="Map" id="Map"><area shape="rect" coords="837,44,909,66" href="javascript:if(confirm('http://www.hnggw.net.cn/  \n\n�ļ���δ�� Teleport Pro ȡ�أ���Ϊ �����ڵ�λ��: �����ڵ�λ��:�õķ�Χ��  \n\n �����ڵ�λ��:������'))window.location='http://www.hnggw.net.cn/'" tppabs="http://www.hnggw.net.cn/" /><area shape="rect" coords="836,16,910,39" href="javascript:if(confirm('http://en.citshn.com/  \n\n�ļ���δ�� Teleport Pro ȡ�أ���Ϊ �����ڵ�λ��: �����ڵ�λ��:�õķ�Χ��  \n\n �����ڵ�λ��:������'))window.location='http://en.citshn.com/'" tppabs="http://en.citshn.com/" />
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
          <td width="9%" align="center" class="menu1">�û�����</td>
          <td width="16%" class="menu1"><input type="text"  name="username" size="14" class='an5'>
          </td>
          <td width="8%" align="center" class="menu1">���룺</td>
          <td width="20%" class="menu1"><input type="password"  name="userpassword" size="14" class='an5'>
                <input name="ComeUrl" type="hidden" id="ComeUrl" value="index.asp" />
          </td>
		  <td width="8%" align="center" class="menu1">���룺</td>
          <td width="18%" class="menu1"><input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6 class="an6"> <img src=GetCode.asp></td>
          <td width="9%"><input name="image" type="image" src="img/login.gif" width="48" height="19" border="0" tppabs="/img/login.gif" /></td>
          <td width="9%" class="menu1"><a href="/User_Reg.asp" tppabs="/User_Reg.asp" target="_blank">���ע��</a></td>
        </tr>
      </form>
    </table></td>
    <td width="350"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8%"><img src="img/news.gif" tppabs="/img/news.gif" width="23" height="18" /></td>
        <td width="19%"><span class="menu1">��վ���棺</span></td>
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
      <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="default.htm">��վ����ҳ</a>����</td>
      <TD width="11">&nbsp;</td>
    </tr>
  
</TABLE>
<table width="980" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
  <tr>
    <td width="185" height="427" valign="top" bordercolor="#FFFFFF" bgcolor="#f6f6f6"  style="BORDER-left: #d8d8d8 1px solid;BORDER-right: #d8d8d8 1px solid"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="BORDER-right: #d8d8d8 1px solid">
<%dim action
action=request.QueryString("action")
select case action
case ""
%>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="480">
      <tr>
        <td height="30" align="center"><font color="#ff0000"> �����ڵ�λ��: �����ڵ�λ��: �����ڵ�λ��: �����ڵ�λ��:ʱ�ظ���лл ��</font>            </td>
      </tr>
      <tr>
        <td align="center" valign="top"><table border="0" cellspacing="2" cellpadding="1" align="center" width="500">
          <form name="fkinfo" method="post" action="gbook.asp?action=save">
            <tr>
              <td width="22%" align="right">�ࡡ�ͣ�</td>
              <td style="padding-left:10px" width="78%"><div align="left">
                <select name="fkleixing" id="select2">
                      <option value="1">�򵥵�����</option>
                      <option value="2">����վ�����</option>
                      <option value="3">�Թ�˾�Ľ���</option>
                      <option value="4">���к�������</option>
                      <option value="5">��ƷͶ��</option>
                      <option value="6">����Ͷ��</option>
                  </select>
              </div></td>
            </tr>
            <tr>
              <td align="right">�����⣺</td>
              <td style="padding-left:10px"><div align="left">
                <input name="fksubject" type="text" id="fksubject">
              </div></td>
            </tr>
            <tr>
              <td align="right">�ա�����</td>
              <td style="padding-left:10px"><div align="left">
                <input name="fkusername" type="text" id="fkusername">
              </div></td>
            </tr>
            <tr>
              <td align="right">e-mail��</td>
              <td style="padding-left:10px"><div align="left">
                <input name="fkemail" type="text" id="fkemail" size="50">
              </div></td>
            </tr>
            <tr>
              <td align="right">�ء�ַ��</td>
              <td style="padding-left:10px"><div align="left">
                <input name="fklaizi" type="text" id="fklaizi" size="50">
              </div></td>
            </tr>
            <tr>
              <td align="right">�硡����</td>
              <td style="padding-left:10px"><div align="left">
                <input name="fktel" type="text" id="fktel">
              </div></td>
            </tr>
            <tr>
              <td align="right">�š�Ϣ��</td>
              <td style="padding-left:10px"><div align="left">
                <textarea name="fkcontent" cols="50" rows="8" id="fkcontent"></textarea>
              </div></td>
            </tr>
            <tr>
              <td></td>
              <td height="30" style="padding-left:10px"><div align="left">
              <input class="go-wenbenkuang" name="submit" value=�ύ��Ϣ type=submit onClick="return checkfk();">
          [ �����ڵ�λ��:<font color="#FF0000">Enter</font>��������] </div></td>
            </tr>
          </form>
        </table></td>
      </tr>
    </table>
<%
case "save"
	  if session("fkfk")=minute(now) then
	  response.write "<script language=javascript>alert(' �����ڵ�λ��: �����ڵ�λ��: �����ڵ�λ��:');history.go(-1);</script>"
	  response.End
	  end if
	  function HTMLEncode2(fString)
	fString = Replace(fString, CHR(13), "")
	fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
	fString = Replace(fString, CHR(10), "<BR>")
	HTMLEncode2 = fString
    end function
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from Gbook",conn,1,3
rs.addnew
rs("fksubject")=trim(request("fksubject"))
rs("fkleixing")=request("fkleixing")
rs("fkcontent")=htmlencode2(trim(request("fkcontent")))
rs("fkusername")=trim(request("fkusername"))
rs("fkemail")=trim(request("fkemail"))
rs("fktel")=trim(request("fktel"))
rs("fklaizi")=trim(request("fklaizi"))
rs("fkdate")=now
rs("fkip")=Request.ServerVariables("remote_addr")
rs.update
rs.close
set rs=nothing
session("fkfk")=minute(now)
response.write "<br><br><center> �����ڵ�λ��: �����ڵ�λ��:���Ĳ��룡<br><br><a href=Default.htm>������ҳ</a></center>"
end select%></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#39AE29">&nbsp;</td>
    <td width="890" height="30" align="center" background="images/endd_02.jpg" bgcolor="#39AE29" style=" color:#FFFFFF;"><a href=Default.htm>��վ��ҳ</a> | <a href=about.asp?action=about >��������</a> | <a href=about.asp?action=lxwm >ҵ����ϵ</a> | <a href=help.asp?action=shiyongfalv >��Ȩ����</a> | <a href=help.asp?action=fukuan >���ʽ</a> | <a href=gbook.asp >����/����/Ͷ��</a></td>
    <td bgcolor="#39AE29">&nbsp;</td>
  </tr>
  <tr>
    <td height="75" colspan="3" align="center" background="images/endd_04.jpg">
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" style="line-height:16px;"> <%dim endtime
endtime=timer()
response.Write "����˾��ַ��"&dizhi&"<br>"
response.Write "���ͷ����䣺<a href=mailto:"&webemail&">"&webemail&"</a>���ͷ��绰��"&dianhua&"<br>��"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
%><br>���棺0371-65852352���ͷ�QQ��<a href="tencent://message/?uin=909888314&Site=���Ϲ���&Menu=yes">909888314</a></td>
        <td><img src="Images/coy.jpg" width="25" height="31" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</Body>
</Html>