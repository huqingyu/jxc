<!--#include file="common/conn.asp"--> <!--#include file="admin/system/WebConfig.asp"-->
<% tp=request("tp") %>
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>

</head>
<body>
<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF"><!--#include file="left.asp" -->
		</td>
    <td align="center" valign="top"><TABLE WIDTH=98% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>�����ڵ�λ��:</b><a href="index.asp">��ҳ</a> &gt;&gt; <a href="#">
            <% set rs=conn.execute("select * from nlei where id="&tp)
response.Write(rs("nlei")) %>
          </a><a href="list.asp?tp=<%= mytype %>"></a></td>
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
              <td width="82" style="font-size:14px; font-weight:bold;"><% set rs=conn.execute("select * from nlei where id="&tp)
response.Write(rs("nlei")) %></td>
              <td width="379">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:24px;">
              <tr>
                <td height="840" valign="top" style="border-left:1px solid #EBF6D8; border-right:1px solid #EBF6D8; border-bottom:1px solid #EBF6D8;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <%
 		  set rs=server.createobject("adodb.recordset") 
		  sql="select * from news where mytype="&tp&"  order  by id desc"
		  rs.open sql,conn,1
		  
		  rs.pagesize=50' �����ڵ�λ��:
          pagecount=rs.pagecount '��ҳ��
		  
		     if rs.bof and rs.eof then
              response.write ""
              else
					 
              page=clng(request.querystring("page"))
              if page<1 then page=1
              if page>rs.pagecount then page=rs.pagecount
              rs.absolutepage=page  '��������ҳ
  
              for i=1 to rs.pagesize
          %>
                          <tr>
                            <td width="50%" height="32" align="left" bgcolor="<% If i mod 2=0  Then %>#F5FDEF<% Else %>#ffffff<% End If %>">&nbsp;<font color="#FF6600">��</font>&nbsp;<a href="show.asp?id=<%=rs("id")%>" target="_blank"><span style="font-size:14px;"><%=left(rs("bt"),34)%></span></a></td>
<%
rs.movenext
'i=i+1
if rs.eof then exit for
%>
                            <td width="50%" bgcolor="<% If i mod 2=0  Then %>#F5FDEF<% Else %>#ffffff<% End If %>">&nbsp;<font color="#FF6600">��</font>&nbsp;<a href="show.asp?id=<%=rs("id")%>" target="_blank"><span style="font-size:14px;"><%=left(rs("bt"),34)%></span></a></td>
                          </tr>
                          <% 
         rs.movenext
         if rs.eof then exit for 
         next
         end if 
         %>
                        </table>
                          <table width="95%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td height="22" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
                                						
								<span style="color:#666666">[��<%=rs.pagecount%>ҳ&nbsp;��ǰ��<%=page%>ҳ&nbsp;<%
	if page<=1 then
	   Response.Write("��ҳ&nbsp;&nbsp;")
       Response.Write ("��һҳ")
    else
	  Response.Write("<a href='?tp="&tp&"&Page=1' class='list'>��ҳ</a>&nbsp;&nbsp;")
	  Response.Write("<a href='?tp="&tp&"&Page=" & (Page-1) & "' class='list'>��һҳ</a>")

    end if
	response.write "&nbsp;&nbsp;"
    if page>=Rs.PageCount then
        Response.Write ("��һҳ")
		Response.Write("&nbsp;&nbsp;βҳ")
    else
  		Response.Write("<a href='?tp="&tp&"&Page=" & (Page+1) & "' class='list'>��һҳ</a>")
  		Response.Write("&nbsp;&nbsp;<a href='?tp="&tp&"&Page=" & rs.pagecount & "' class='list'>βҳ</a>")
    end if

%>]</span></td>
                            </tr>
                        </table></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
      </td>
    <td valign="top">
	<!--#include file="right_i.asp" -->
	</td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->

</body>
</html>
