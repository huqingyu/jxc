<!--#include file="common/conn.asp"-->
<style type=text/css>
body {
	scrollbar-face-color: #71D63D;
	scrollbar-highlight-color: #71D63D;
	scrollbar-shadow-color: #71D63D;
	scrollbar-3dlight-color: #ffffff;
	scrollbar-arrow-color:  #ffffff;
	scrollbar-track-color: #ffffff;
	scrollbar-darkshadow-color: #ffffff;
} 
</style>
<link href="css/xl.css" rel="stylesheet">
<script language=JavaScript>
function KB_keepItInIE(theName,theWantTop,theWantLeft) {
theRealTop=parseInt(document.body.scrollTop)
theTrueTop=theWantTop+theRealTop
document.all[theName].style.top=theTrueTop
theRealLeft=parseInt(document.body.scrollLeft)
theTrueLeft=theWantLeft+theRealLeft
document.all[theName].style.left=theTrueLeft
}
function KB_keepItInNN(theName,theWantX,theWantY) {
theRealLay=document.layers[theName]
theBadX=self.pageYOffset
theBadY=self.pageXOffset
theRealX=theBadX+theWantX
theRealY=theBadY+theWantY
theRealLay.moveTo(theRealY,theRealX)
}
IE4=(document.all)?1:0
NN4=(document.layers)?1:0
if (IE4)
setInterval('KB_keepItInIE("KBStatic",0,0)',1)
if (NN4)
setInterval('KB_keepItInNN("KBStatic",0,0)',1)
</script>  
<div id="KBStatic" style="position:absolute; left:0px; top:0px; width:100%; height:23px; z-index:25">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<%
set rs11=conn.execute("select id,board from board")
while not rs11.eof
%>
<td height=24 bgcolor=#E7F8DE align=center><div id="xll"><a href="xl_list.asp?action=edit&id= <%=rs11("id")%>"><%=(rs11("board"))%></a></div></td>
<%
rs11.movenext
wend
%>
</tr>
</table> 
</div>
<%
rs11.close
%>
<table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
<tr align="center" bgcolor="#f5f5f5">
<td width="321" height="21" bgcolor="#00CC00">&nbsp;</td>
<td width="124" bgcolor="#00CC00">Ô¤¶¨</td>
</tr>
<%
dim id
id=trim(request("id"))
if id="" or not isnumeric(id) then
tt="select top 20 id,x_name,x_leiid,x_top from xianlu order by x_top desc"
else
tt="select id,x_name,x_leiid,x_top from xianlu where x_leiid="&id&" order by x_top desc"
end if
set er=conn.execute(tt)
while not er.eof
%>
<tr bgcolor="#FFFFFF">
<td height="24" bgcolor="#F7FDE8">
<%
if trim(er("x_top"))=1 then
%> 
&nbsp;&nbsp;<img src="images/top.gif">&nbsp;
<%
else
%>
&nbsp;&nbsp;<img src="images/ping.gif">
<%
end if
%>
<a href="Xl/Xl_<%=er("id")%>.html" target="_blank"><%=er("x_name")%></a></td>
<td align="center" bgcolor="#F7FDE8"><a href="order/giveme.asp?id=<%=er("id")%>" title='Ô¤¶¨' target="_blank">Ô¤¶¨</a></td>
</tr>
<%
er.movenext
wend
er.close
%>
</table>