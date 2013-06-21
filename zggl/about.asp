<!--#include file="common/conn.asp"-->
<!--#include file="common/webconfig.asp"-->
<%
Dim pagename
	if lcase(request("action"))="about" then 
	pagename = "走进国旅"
	elseif lcase(request("action"))="lxwm" then 
	pagename = "联系我们"
	elseif lcase(request("action"))="jtcg" then 
	pagename = "集团采购"
	else
	pagename = "集团采购"
	end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname%>--<%=pagename%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body> 
<!--#include file="top.asp" --><div id="J_page" class="w980 center">

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF">
		<!--#include file="left.asp" -->
	</td>
    <td align="center" valign="top">
		<TABLE WIDTH=98% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>您现在的位置:</b><a href="default.htm">首页</a> &gt;&gt; <%=pagename%></td>
        </tr>
      </TABLE>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="565" align="center" valign="top"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="6"></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" background="Images/pic16.gif" style="border:1px solid #CCCCCC;">
            <tr>
              <td width="45" height="28" align="center" style="font-size:14px; color:#CC6600; font-weight:bold;">&nbsp;</td>
              <td width="82" style="font-size:14px; font-weight:bold;"><span class="STYLE7"><%=pagename%></span></td>
              <td width="379">&nbsp;</td>
            </tr>
          </table>
</td>
        </tr>
      </table><table width="98%" height="429" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><br>
                    <%
if InStr(request("action"),"'")>0 then
response.write"<script>alert(""非法访问!"");location.href=""../index.asp"";</script>"
response.end
end if
							set rs=server.createobject("adodb.recordset")
							dim strField
							
							if lcase(request("action"))="about" then 
								strField = "about"
							elseif lcase(request("action"))="lxwm" then 
								strField = "lxwm"
							elseif lcase(request("action"))="jtcg" then 
								strField = "jtcq"
							else
								strField = "about"
							end if
							
							rs.open "select about,lxwm,jtcg from config ",conn,1,1
							response.write rs(strField)
							
							rs.close
							set rs=nothing
						%>
                    <br>
                </td>
              </tr>
			</table>
      </td>
    <td valign="top">
	<!--#include file="right_i.asp" -->
	</td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->
<script language=JavaScript src="js/js.js"></script>
</div>
</body>
</html>
