<!--#include file="../common/conn.asp"-->

<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where id="&session("hotelid")&"" 
rs.open sqltext,conn,1,1
set rsroom=server.createobject("adodb.recordset")
sqltext="select * from roomb where id="&session("roomid")&"" 
rsroom.open sqltext,conn,1,1
uid=request.Cookies("Gemisum")("username")
set rsuser=server.createobject("adodb.recordset")
sqltext="select * from userb where username='"&uid&"'" 
rsuser.open sqltext,conn,1,1
%>
<html>
<head>
<title>����Ԥ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css">
</head>
<script language="JavaScript" src="../admin/system/indexdatejs.js"></script>
	<script language="javascript">
	<!--//
	function checksignup() {

if(formSignUp.starttime.value=='���ѡ������'){
alert("��ѡ����ס���ڣ�");
formSignUp.starttime.focus();
return false;
}
if(formSignUp.deptime.value=='���ѡ������'){
alert("��ѡ���˷����ڣ�");
formSignUp.deptime.focus();
return false;
}

		if ( document.formSignUp.personcount.value == '' ) {
			window.alert('��������ס����!!');
			document.formSignUp.personcount.focus();
		}
		else if ( document.formSignUp.contactname.value == '' ) {
			window.alert('��������ϵ������!!');
			document.formSignUp.contactname.focus();
			
		}
		else if ( document.formSignUp.Phone.value == '' ) {
			window.alert('��������ϵ�绰!!');
			document.formSignUp.Phone.focus();
		}
		else if ( document.formSignUp.email.value == '' ) {
			window.alert('����������ʼ���ַ!!');
			document.formSignUp.email.focus();
		}
		else {
			if (document.formSignUp.signup_private.checked == true) 
				document.formSignUp.signup_private.value = "F"
			else
				document.formSignUp.signup_private.value = "T"
			return true;
			}
		return false;
	}

	//-->
	</script>
<body>
<FORM ACTION="OrderSave.asp" METHOD="POST" NAME="formSignUp" onSubmit='return checkform();'>
  <div align="center">
            <br>
            <br>
            <table id=zy width=621 border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#ffffff bgcolor=#F9F9F9>
              <TBODY>
        
              <tr>
                <TD height=30 colspan="2" background="../Images/topBar_bg.gif">
                <p align="left">Ԥ������</TD>
              </tr>
              <tr>
                <TD width=148 height=25 align="right" bgColor=#ebebeb>
                �������ƣ�</TD>
                <TD width=419 height=25><%=rs("c_name")%>
                <input type=hidden name=hotelid value=<%=rs("id")%>>
                <input type=hidden name=hotelname value=<%=rs("c_name")%>>
                ��</TD>            
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ��ס���ڣ�</TD>
                <TD height=25 ><input type=text name=starttime size=20 onfocus="javascript:setday(this)" title="��ʽ��xxxx/xx/xx��xxxx-xx-xx��xxxx xx xx" value="���ѡ������"></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">������ڣ�</TD>
                <TD height=25><input name=deptime type=text id="deptime" title="��ʽ��xxxx/xx/xx��xxxx-xx-xx��xxxx xx xx" onfocus="javascript:setday(this)" value="���ѡ������" size=20></TD>                     
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ���㷽ʽ��</TD>
                <TD height=25><%=rsroom("paytype")%>
                <input type=hidden name=paytype value=<%=rsroom("paytype")%>>
                ��</TD>            
              </tr>
              <tr>
                <TD height=30 colspan="2" background="../Images/topBar_bg.gif">
                <p align="left">����ѡ��</TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">���ͣ�</TD>
                <TD height=25><%=rsroom("type")%>
                <input type=hidden name=roomid value=<%=rsroom("id")%>>
                <input type=hidden name=roomtype value=<%=rsroom("type")%>>
                ��</TD>                    
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                Ԥ��������</TD>
                <TD height=25>
                <select maxLength="2" name="Roomcount" >
					<option value=1 selected>1&nbsp;<option value=2>2&nbsp;<option value=3>3&nbsp;<option value=4>4&nbsp;<option value=5>5&nbsp;<option value=6>6&nbsp;<option value=7>7&nbsp;<option value=8>8&nbsp;
				  </select> ��</TD>                    
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ǰ̨�ָ��ۣ�</TD>
                <TD height=25>
                RMB&nbsp;<%=rsroom("stageprice")%> /��
                <input name=stageprice type=hidden id="stageprice" value=<%=rsroom("stageprice")%>></TD>    
                <input type=hidden name=price value=<%=rsroom("stageprice")%>>  
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">��ͣ�</TD>
                <TD height=25><%=rsroom("breakfast")%>
                ��</TD>    
              </tr>
              <tr>
                <TD height=30 colspan="2" background="../Images/topBar_bg.gif">
                <p align="left">Ԥ������</TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">��ס������</TD>
                <TD height=25>
                <input type="text" name="personcount" size="5" value="1"> ��</TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">��ס����ݣ�</TD>
                <TD class=main2 height=25>
                <select name="ClientComeFrom">
			
						<option value="�ڱ�(�ִ�½���֤"  selected >�ڱ�(�ִ�½���֤)</option>
				
						<option value="�۰�̨(�ֻ���֤\̨��֤��)" >�۰�̨(�ֻ���֤\̨��֤��)</option>
				
						<option value="�Ȱ�(���й�����)" >�Ȱ�(���й�����)</option>
				
						<option value="���й�����֤�����" >���й�����֤�����</option>
				
						<option value="���ձ����յ����" >���ձ����յ����</option>
				
						<option value="�ַ��ձ�������յ����" >�ַ��ձ�������յ����</option>
				
			</select></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">��ס�Ǽ��ˣ�</TD>
                <TD height=25>
                <input name="clientname1" maxlength="20" align="left" size="8" value=<%=rsuser("name")%>>
			<input name="clientname2" maxlength="20" align="left" size="8" value="">
			<input name="clientname3" maxlength="20" align="left" size="8" value="">
			<input name="clientname4" maxlength="20" align="left" size="8" value="">
             <br>
			<input name="clientname5" maxlength="20" align="left" size="8" value="">
			<input name="clientname6" maxlength="20" align="left" size="8" value="">
			<input name="clientname7" maxlength="20" align="left" size="8" value="">
			<input name="clientname8" maxlength="20" align="left" size="8" value=""></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ����Ŀ�ĵط�ʽ��</TD>
                <TD height=25>
                <input name="ArrivalWay" value="" maxlength="30" size=20>
		<font color="#ff0000">����д�����ĺ����(�𳵳���)���磺 MU501����ȣ�</font></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
               ���絽��ʱ��:</TD>
                <TD height=25>
	<select name="EarlyArrivalTime">
	<option value="10:00" selected >10:00</option>
		<option value="10:30" >10:30</option><option value="11:00" >11:00</option>
		<option value="11:30" >11:30</option><option value="12:00" >12:00</option>
		<option value="12:30" >12:30</option><option value="13:00" >13:00</option>
		<option value="13:30" >13:30</option><option value="14:00">14:00</option>
		<option value="14:30" >14:30</option><option value="15:00" >15:00</option>
		<option value="15:30" >15:30</option><option value="16:00" >16:00</option>
		<option value="16:30" >16:30</option><option value="17:00" >17:00</option>
		<option value="17:30" >17:30</option><option value="18:00" >18:00</option>
		<option value="18:30" >18:30</option><option value="19:00" >19:00</option>
		<option value="19:30" >19:30</option><option value="20:00" >20:00</option>
		<option value="20:30" >20:30</option><option value="21:00" >21:00</option>
		<option value="21:30" >21:30</option><option value="22:00" >22:00</option>
		
	</select>
	<font color="#ff0000">����ʽHH:MM,��17:30��</font></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ������ʱ��:</TD>
                <TD height=25>
	<select name="arrivalTime" >
	<option value="10:00" >10:00</option>
		<option value="10:30" >10:30</option><option value="11:00" >11:00</option>
		<option value="11:30" >11:30</option><option value="12:00" >12:00</option>
		<option value="12:30" >12:30</option><option value="13:00" >13:00</option>
		<option value="13:30" >13:30</option><option value="14:00" >14:00</option>
		<option value="14:30" >14:30</option><option value="15:00" >15:00</option>
		<option value="15:30" >15:30</option><option value="16:00" >16:00</option>
		<option value="16:30" >16:30</option><option value="17:00" >17:00</option>
		<option value="17:30" >17:30</option><option value="18:00" selected >18:00</option>
		<option value="18:30" >18:30</option><option value="19:00" >19:00</option>
		<option value="19:30" >19:30</option><option value="20:00" >20:00</option>
		<option value="20:30" >20:30</option><option value="21:00" >21:00</option>
		<option value="21:30" >21:30</option><option value="22:00" >22:00</option>
		
	</select>
	<font color="#ff0000">����ʽHH:MM,��17:30��</font></TD>
              </tr>
              <tr>
                <TD height=30 colspan="2" background="../Images/topBar_bg.gif">
                <p align="left">��ϵ��Ϣ</TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ��ϵ��:</TD>
                <TD height=25>
                <input maxlength="20" size=12 name="contactname" value=<%=rsuser("name")%>></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                �ֻ���绰:</TD>
                <TD height=25>
                <input name="Phone" maxlength="30" size=25 value=<%=rsuser("telphone")%>></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ����:</TD>
                <TD height=25>
                <input name="fax" maxlength="30" size=25  value=""></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                �����ʼ�:</TD>
                <TD height=25>
                <input name="email" maxlength="40" size=25 value=<%=rsuser("email")%>></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">
                ȷ�Ϸ�ʽ:</TD>
                <TD height=25>
                <select name="ConfirmType" style="width:95; height:95">
							<option value="����ȷ��" selected >����ȷ��</option>
							<option value="�绰ȷ��" >�绰ȷ��</option>
							<option value="Emailȷ��" >Emailȷ��</option>
							<option value="Faxȷ��" >Faxȷ��</option>
							<option value="�ֻ�����Ϣȷ��" >�ֻ�����Ϣȷ��</option>
				  </select></TD>
              </tr>
              <tr>
                <TD bgColor=#ebebeb height=25 align="right">����˵����</TD>
                <TD height=25>
                <textarea rows="4" name="info" cols="44"></textarea></TD>
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
 <INPUT TYPE=submit VALUE=" ȷ��Ԥ�� " CLASS="medium" ONCLICK="javascript:return checksignup()" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT TYPE=RESET VALUE="�� ��" CLASS="medium" NAME="signup_reset">    
                </TD></TR></TBODY></TABLE>
    </div>
      <p align="center">��
</form>

</body>
</html>