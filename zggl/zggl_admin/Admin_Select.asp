
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
<script language="javascript">
function opennew(){
window.open ("admin_masterlook.asp?action=listxu","查询","height=400,width=655, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes,resizable=no,location=no, status=no")
}
function check(){
if(form1.text1.value==''){
alert("请填写市的显示排序！");
form1.text1.focus();
return false;
}
}
function checka(){
if(form2.xlid.value==''){
alert("请输入要查询的线路ID！\r\r如果不明白线路ID，请点确定获取！");
opennew();
return false;
}
}
</script>

<div align="center">
<br /><br /><br />  
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
    <tr>
      <td height="22" bgcolor="#f5f5f5">　　[按客户资料查询]</td>
    </tr>
  </table>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <form action="?action=kf" method="post" name="form1" onSubmit="return check();">
      <tr>
        <td height="30" align="center" bgcolor="#f5f5f5">请输入：
          <input name="text1" type="text" id="text1" size="30">
          <input type="submit" name="Submit" value="查 询">
    </td>
      </tr>
      <tr>
        <td height="51"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center">
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_name" checked>
    客户名称</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_address">
    客户地址</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_email">
    电子邮件</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_oicq"> 
              O I C Q</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_age">
    年　　龄</td>
            <td width="20%" height="24"><input type="radio" name="radiobutton" value="m_phone">
    电　　话</td>
          </tr>
          <tr align="center">
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_zhengjian">　            身份证</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_youbian">
    邮　　编</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_renshuo">
    来游人数</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_yudingtime">
              预订时间</td>
            <td width="16%" height="24"><input type="radio" name="radiobutton" value="m_huanchengtime">
              返程时间</td>
            <td width="20%" height="24"><input type="radio" name="radiobutton" value="m_laiyoutime">
              来游时间</td>
          </tr>
        </table></td>
      </tr>
    </form>
  </table>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <tr>
      <td height="22" bgcolor="#f5f5f5">　　[按指定线路查询]</td>
    </tr>
  </table>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <form action="?action=xlselect" method="post" name="form2" onsubmit="return checka();">
      <tr>
        <td height="24" align="center" bgcolor="#f5f5f5" >请输入线路ID号：
        <input name="xlid" type="text" id="xlid" size="15">
        <input type="submit" name="Submit2" value="查 询">　
        <a style="cursor:hand" onClick="opennew();">(点击获得线路ID)</a></td>
      </tr>
    </form>
  </table>
  <%
dim action
action=trim(request("action"))
if action<>"" then
sss
end if
sub sss
dim text1,xlid,tttt
text1=trim(request("text1"))
xlid=trim(request("xlid"))
tttt=request("radiobutton")
select case action
case "kf"
sql="select * from giveme where "&tttt&" like '%"&text1&"%'"
case "xlselect"
sql="select * from giveme where m_id='"&xlid&"'"
end select
set rs=conn.execute(sql)
%>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <tr>
      <td height="22" bgcolor="#f5f5f5">　　[查 询 结 果]</td>
    </tr>
  </table>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <tr align="center" bgcolor="#f5f5f5">
      <td width="321" height="22">线路名称</td>
      <td width="87">客户姓名</td>
      <td width="120">预订时间</td>
      <td width="45">人数</td>
    </tr>
  <%
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFF"">没找到相关记录！</td></tr>")
end if
while not rs.eof
%>
    <tr>
      <td height="22"><a href="../Xl/Xl_<%=rs("m_id")%>.html" target=_blank title="点击查看线路详情"><%=rs("m_xianlu_name")%></a></td>
      <td align="center"><a href="admin_yddel.asp?action=look&id=<%=rs("id")%>" title="点击查看预订详情"><%=rs("m_name")%></a></td>
      <td align="center"><%=rs("m_yudingtime")%></td>
      <td align="center"><%=rs("m_renshuo")%></td>
    </tr>
  <%
rs.movenext
wend
%>
  </table>
  <%
end sub

%>
</div>
