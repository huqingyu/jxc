<script src="js/indexdatejs.js"></script>
<script>
function checkform(){
	if(ListItemForSale.shucity.value==''){
		alert(" 您现在的位置:询的城市！");
		ListItemForSale.shucity.focus();
		return false;
	}
	if(ListItemForSale.arrive_date.value=='点击选择日期'){
		alert(" 您现在的位置:！");
		ListItemForSale.arrive_date.focus();
		return false;
	}
	if(ListItemForSale.leave_date.value=='点击选择日期'){
		alert(" 您现在的位置:！");
		ListItemForSale.leave_date.focus();
		return false;
	}
	return true;
}

 function secCard(n)
  {
  if(n==1)
  {
				   secTable.cells[0].className="cardSelected1";
                   secTable.cells[2].className="cardNormal";
  }
  if(n==2)
  {
                   secTable.cells[0].className="cardNormal";
                   secTable.cells[2].className="cardSelected1";
  }
  }
  function secBoard(n)
  {
    for(i=0;i<mainTable.tBodies.length;i++)
      mainTable.tBodies[i].style.display="none";
            mainTable.tBodies[n].style.display="";
  }
</SCRIPT><table width="214" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/right_01.jpg" width="214" height="29" alt="" /></td>
  </tr>
  <tr>
    <td height="151" align="center" background="images/right_03.jpg" style="border-left:1px solid #9EDB5B;border-right:1px solid #9EDB5B">
	<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
            <%if request.Cookies("Gemisum")("username")=""  then%>
            <form name="userlogin" method="post" action="userInfo/User_Checklogin.asp">
              
              <tr>
                <td height="30" align="center">用户名：
                    <input type="text"  name="username" size="14" class='an5'>                </td>
              </tr>
              <tr>
                <td height="30" align="center">密　码：
                    <input type="password"  name="userpassword" size="14" class='an5'>                </td>
              </tr>
              <tr>
                <td height="30" align="center">验证码：
                    <input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6 class="an6">
                    <img src="common/GetCode.asp">&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle"><span style="padding-top:3px;">
                  <input type="image" name="imageField" src="Images/sub.jpg" />&nbsp;&nbsp;<a href="userInfo/User_Reg.asp"><img src="Images/reg.jpg" width="65" height="29" border="0" /></a></span></td>
              </tr>
            </form>
            <%else%>
            <tr>
              <td align="center"><%
set rs=server.createobject("adodb.recordset")
rs.open "select jifen,yucun,reglx,vipdate from [userb] where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
if rs("vipdate")<>"" then 
'看是不是过期VIP
if rs("vipdate")<date and rs("reglx")>2 then
rs("reglx")=1
rs.update
end if
end if
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")
response.Cookies("Gemisum")("reglx")=rs("reglx")
rs.close
set rs=nothing
if request.Cookies("Gemisum")("reglx")=3 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 企业用户您好<br />您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
Else
if request.Cookies("Gemisum")("reglx")=2 then
response.write "<br /><br />"&request.Cookies("Gemisum")("username")&" 贵宾您好<br />您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
else
response.write "<br /><br />"&request.Cookies("Gemisum")("username")&" 您好<br />您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
end if
end if
response.write "<br><a href=userInfo/userinfo.asp target=_blank><font color=red>进入会员中心</font></a>"
response.write "<br><a href=userInfo/logout.asp>注销退出</a>"
end if
%></td>
            </tr>
</table>
	</td>
  </tr>
  <tr>
    <td><img src="images/right_04.jpg" width="214" height="4" alt="" /></td>
  </tr>
</table>

<br />

<table width="214" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/right_06.jpg" width="214" height="31" alt="" /></td>
  </tr>
  <tr>
    <td height="147" align="center" background="images/right_07.jpg">
	<!--start -->
	<%sql="select top 6 id,c_name from Hotelb order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1

if rs.eof then
response.write " 您现在的位置:信息!"
Else
do while not rs.eof%>
                          <table width="195"  border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td height="24" style="border-bottom:1px dotted #D2EAF8;">
							  <font color="#0066CC">·</font> <a href="Hotel/Hotel_<%=rs("id")%>.html">
							  <font color="#0066CC">
                                <%if len(rs("c_name"))>13 then%>
                                <%=left(rs("c_name"),13)%>...
                                <%else%>
                                <%=rs("c_name")%>
                                <%end if%>
                              </font></a></td>
                            </tr>
                          </table>
                          <%
rs.movenext                                                 
loop
end if
rs.close%>
<!--end -->
</td>
  </tr>
  <tr>
    <td><img src="images/right_08.jpg" width="214" height="35" alt="" /></td>
  </tr>
  <tr>
    <td height="413" align="center" style="border-left:2px solid #91CDF1;border-right:2px solid #91CDF1">
<table width="88%" height="210" border="0" cellpadding="0" cellspacing="0">
  <form action="SearchResult.asp" method="post" name="ListItemForSale" target="_blank" id="ListItemForSale" onsubmit="return checkform();">
    <tr>
      <td width="69"><font color="#006699">输入城市：</font></td>
      <td width="116" height="25"><input name="shucity" type="text" id="shucity" style="width:100px;" />
          <font color="#FF0000">*</font></td>
    </tr>
    <tr>
      <td><font color="#006699">价格范围：</font></td>
      <td height="25"><font color="#006699">
        <select name="jiage" id="jiage" style="width:100px">
              <option value="stageprice &gt;= 0 and stageprice &lt;= 250">250以下</option>
              <option value="stageprice &gt;= 250 and stageprice &lt;= 400">250-400</option>
              <option value="stageprice &gt;= 400 and stageprice &lt;= 600">400-600</option>
              <option value="stageprice &gt;= 600 and stageprice &lt;= 800">600-800</option>
              <option value="stageprice &gt;= 1200">1200以上</option>
              <option value="all" selected="selected">不限</option>
            </select>
      </font></td>
    </tr>
    <tr>
      <td><font color="#006699">选择星级：</font></td>
      <td height="25"><font color="#006699">
        <select name="star" style="width:100px">
              <option value="all" selected="selected">不限</option>
              <option value="5">5星级</option>
              <option value="4">4星级</option>
              <option value="3">3星级</option>
              <option value="2">2星级</option>
              <option value="1">1星级</option>
              <option value="0">青年旅馆</option>
              <option value="9">客栈</option>
            </select>
      </font></td>
    </tr>
    <tr>
      <td><font color="#006699">入住日期：</font></td>
      <td height="25"><font color="#006699">
        <input name="arrive_date" type="text" id="arrive_date" size="15" value="点击选择日期" style="width:100px;" onfocus="javascript:setday(this)" />
      </font></td>
    </tr>
    <tr>
      <td><font color="#006699">离店日期：</font></td>
      <td height="25"><font color="#006699">
        <input name="leave_date" type="text" id="leave_date" size="15" value="点击选择日期" style="width:100px;" onfocus="javascript:setday(this)" />
      </font></td>
    </tr>
    <tr>
      <td style="color:#006699;">酒店名称：</td>
      <td height="25" style="color:#006699;"><input name="name" type="text" id="name" size="20" style="width:100px;"/></td>
    </tr>
    <tr>
      <td height="25" colspan="2" align="center"><input name="Button1" type="image" src="Images/2_r4_c3.gif" /></td>
      </tr>
  </form>
</table>
</td>
  </tr>
  <tr>
    <td><img src="images/right_10.jpg" width="214" height="7" alt="" /></td>
  </tr>
</table>
