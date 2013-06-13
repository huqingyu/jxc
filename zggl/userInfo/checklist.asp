<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<!--#include file="md52.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css">
<title><%=webname%>--在线支付</title>
</head>
<body>
<script>

window.moveTo(300, 150);

window.resizeTo(400, 460);

window.onresize=new Function("window.resizeTo(400, 460);")

</script>
<SCRIPT ID=clientEventHandlersVBS LANGUAGE=vbscript>
<!--
Sub button1_onclick
	window.history.back 
End Sub
-->
</SCRIPT>

<%
	dim v_rcvname,v_rcvaddr,v_rcvtel,v_rcvpost,v_ordername,v_orderemail,v_amount
	dim yy,mm,dd,v_ymd,xiaoshi,fenzhong,miao,BillNo,v_mid,key,v_oid,v_moneytype,v_orderstatus,v_url
	'接收来自上页所有订单信息
	v_rcvname = replace(Request.Form("v_rcvname"), "'", "''")
	v_rcvaddr = replace(Request.Form("shouhuorendizhi"), "'", "''")
	v_rcvtel = replace(Request.Form("shouhuorendianhua"), "'", "''")
	v_rcvpost = replace(Request.Form("shouhuorenyoubian"), "'", "''")
	v_ordername = replace(Request.Form("dinghuorenxingming"), "'", "''")
	v_orderemail = replace(Request.Form("v_orderemail"), "'", "''")
	v_amount = replace(Request.Form("v_amount"), "'", "''")
	
	'根据系统时间产生订单，格式：YYYYMMDD HHMMSS
	yy=year(date)
	mm=right("00"&month(date),2)
	dd=right("00"&day(date),2)
	v_ymd=yy&mm&dd

	'生成订单号所有所需元素,格式为：小时，分钟，秒
	xiaoshi=right("00"&hour(time),2)
	fenzhong=right("00"&minute(time),2)
	miao=right("00"&second(time),2)

	'产生6位订单号BillNo
	BillNo=xiaoshi&fenzhong&miao

	'定义相关必要参数，如商户号、私钥、推荐的标准形式订单号、币种、配货状态、返回url地址
	v_mid = ""&B_mid&""
	key = ""&B_key&""
	'以下v_oid为网银推荐标准订单号
	v_oid=v_ymd&"-"&v_mid&"-"&BillNo
	v_moneytype = "0" '0为rmb 1为dollor
	v_orderstatus = "0" '0未配齐 1为配齐
	v_url="http://"&weburl&"/userinfo/receive.asp" '譬如http://www.xxx.com/xxx.asp
	
dim iii,ooo
iii=split(v_amount,".")
if ubound(iii)=0 then
v_amount=cstr(v_amount) & ".00"
else
if len(iii(1))=1 then v_amount=cstr(iii(0)) & "." &cstr(iii(1)) & "0"
if len(iii(1))=2 then v_amount=cstr(v_amount)
if len(iii(1))>2 then v_amount=cstr(iii(0)) & "." & left(iii(1),2)
end if

key_key = v_moneytype&v_ymd&v_amount&v_oid&v_mid&v_url&key
'拼凑串里勿使用中文字符，目前MD5在ASP、asp.net、java等环境下对中文处理有偏差现象
f=Ucase(trim(md5(key_key)))
'md5.asp文件中，LCase是将字符转换为小写; Ucase是将字符转换为大写
'网银支付平台对MD5值只认大写字符串，所以小写的MD5值得转换为大写
%>
<br>
<table border="0" width="85%" align=center>
  <tr>
    <td width="100%" height="44"><div align="center"><img src="images/ad2.gif" width="355" height="60"></div></td>
  </tr>
  <tr>
    <td>请您确认您所要提交的预存款信息:<br>
      <table border="0" width="100%" align="center"
    bgcolor="#f0f0f0">
        <tr>
          <td align="left" width="56%">用户名：（你在本站注册的用户名）</td>
          <td width="44%"><%=v_ordername%> </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><br>
      您此次支付总金额为:<font color=red><%=v_amount%></font> 
      <p>如果以上资料正确，请您前往网银在线支付平台交费。</td>
  </tr>
  <form method="post" action="https://pay.chinaebank.cn/select_bank.jsp" name="E_FORM" target=new><tr>
    <td height="35"><div align="center">

    <input type=submit name=v_action value="网银在线支付平台">
    <input type="hidden" name="v_md5info" value="<%=f%>">
    <input type="hidden" name="v_mid" value="<%=v_mid%>">
    <input type="hidden" name="v_oid" value="<%=v_oid%>">
    <input type="hidden" name="v_rcvname" value="<%=v_rcvname%>">
    <input type="hidden" name="v_rcvaddr" value="<%=v_rcvaddr%>">
    <input type="hidden" name="v_rcvtel" value="<%=v_rcvtel%>">
    <input type="hidden" name="v_ymd" value="<%=v_ymd%>">
    <input type="hidden" name="v_rcvpost" value="<%=v_rcvpost%>">
    <input type="hidden" name="v_amount" value="<%=v_amount%>">
    <input type="hidden" name="v_orderstatus"  value="<%=v_orderstatus%>">
    <input type="hidden" name="v_ordername"  value="<%=v_ordername%>">
    <input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
    <input type="hidden" name="v_url" value="<%=v_url%>">
  </div></td>
  </tr></form>
</table>


</body>
</html>