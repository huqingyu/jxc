<!--#include file="conn.asp"-->
<%
IP=request.servervariables("REMOTE_ADDR")
if request("ID")<>"" then
  set rs1=Server.CreateObject("adodb.recordset")
  rs1.open "select account,ptnativenumber from account1000y where ID="&request("ID") ,conn,1,3
  if not rs1.eof then
    tjaccount=replace(rs1("account")," ","")
      if Request.Cookies("IPaddr")="" then
		  set rs= Server.CreateObject("adodb.recordset")
		  rs.open "select * from Wealth where UID="&Request("ID")&" And wdate="&date() ,conn,1,3
		  if rs.eof then
			rs.addnew
			rs("Wealth")=rs("Wealth")+1
			rs("uid")=request("id")
			rs("wdate")=date()
			rs.update
			rs1("ptnativenumber")=rs1("ptnativenumber")+1
			rs1.update
		  else
			 if int(rs("Wealth"))+1<=500 then
				rs("Wealth")=rs("wealth")+1
				rs.update
				rs1("ptnativenumber")=rs1("ptnativenumber")+1
				rs1.update
			 end if
		  end if 
		  response.Cookies("IPaddr")="1"
		  response.Cookies("IPaddr").expires=Date+1
		  rs.close
		  set rs=nothing
	   end if
   else
     tjaccount=""
   end if
   rs1.close
   set rs1=nothing
end if
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chk.js"></script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	left:427px;
	top:82px;
	width:427px;
	height:162px;
	z-index:1;
	background-color: #CCCCCC;
}
-->
</style>
</head>

<body onLoad="get_Code();">

<table width="55%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/reg1.png" width="801" height="81" /></td>
  </tr>
  <tr>
    <td height="554" valign="top" background="images/reg2.png"><table width="100%" border="0" cellspacing="0" cellpadding="0">
     <form action="" method="post" enctype="multipart/form-data" name="form1"> 
       <tr>
        <td width="24%" height="40" align="right" style="color:#666666;font-size:14px">ͨ��֤�ʺţ�<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td width="28%"><label>
          <input name="account" type="text" class="input" id="account" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';jc(this.value);}else{this.style.background='#FFDBCA';}">
        </label></td>
        <td width="48%" style="color:#666666"><span id="regtitle"></span>����ĸ(a_z)������(0_9)���»���(_)���,����<font color="#FF0000">4</font>λ</td>
       </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">�������룺<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="password" type="password" class="input" id="password" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="password"></span>�������ַ����</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">ȷ�����룺<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="password1" type="password" class="input" id="password1" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';pwderr.innerHTML='';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="pwderr"></span>�ظ�����</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">��    ����<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="username" type="text" class="input" id="username" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="username"></span>��������ʵ�����������һ��������Ҫƾ֤</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">���֤���룺<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="nativenumber" type="text" class="input" id="nativenumber" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="idcard"></span>�������׼�����֤�ţ������һ�����</td>
      </tr>
      <tr>
        <td height="48" colspan="3" valign="bottom" style="font-size:14px;color:#0066CC">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/lock.png" width="13" height="14" hspace="4" align="absmiddle">�������뱣������<IMG src="images/down.png" name="hideIcon" hspace="4" align="absmiddle" class="iconArrow iconArrowDown" id="hideIcon"></SPAN></H2>          </td>
        </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">���䣺<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="email" type="text" class="input" id="email" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td style="color:#666666"><span id="yxgs"></span>�����������ַ�������޸�������һ�����</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">�ֻ���<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="telephone" type="text" class="input" id="telephone" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
        <td style="color:#666666"><span id="telephone"></span>�����޸�������һ�����</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">��֤ͼƬ�� </td>
        <td><span id="imgid" style="float:left;margin-top:-5px;height:30px;"></span></td>
        <td style="color:#666666">����������,����ͼƬˢ����֤��</td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">��֤�룺<img src="images/x.png" width="9" height="9" hspace="6" align="absmiddle"></td>
        <td><input name="codes" type="text" class="input" id="codes" size="30" onBlur="if (this.value!=''){this.style.background='#FFFFFF';}else{this.style.background='#FFDBCA';}"></td>
        <td>&nbsp;<span id="codes"></span></td>
      </tr>
      <tr>
        <td height="40" align="right" style="color:#666666;font-size:14px">�Ƽ��ˣ�</td>
        <td><input name="ptname" type="text" class="input" id="ptname" value="" <%if request("id")<>"" then%>readonly<%end if%>></td>
        <td><a href="javascript:" onClick="document.form1.ptname.value=''">����Ƽ���</a></td>
      </tr>
      <tr>
        <td height="40" align="right">&nbsp;</td>
        <td><label>
          <input name="agree" type="checkbox" id="agree" value="1">
          �ҽ���ǧ��ͨ��֤�û�����Э��</label></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="66" align="right">&nbsp;</td>
        <td><img src="images/regbtn.png" width="155" height="40" onClick="chk()" style="cursor:pointer"></td>
        <td>&nbsp;<span id="regloading"></span></td>
      </tr></form>
    </table></td>
  </tr>
</table>
<%if tjaccount<>"" then%>
<script>
if(confirm('�����ڵ���Ϸ�ʺ�ע���Ƽ���Ϊ <%=tjaccount%> ���Ƿ�ȷ�����Ƽ��� <%=tjaccount%> �Ƽ�ע���ʺ�!'))
	{document.form1.ptname.value='<%=tjaccount%>';}
</script>
<%end if%>

<table width="56%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="70" align="right" valign="top"><img src="images/reg3.png" height="70"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/l.png" height="1"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
