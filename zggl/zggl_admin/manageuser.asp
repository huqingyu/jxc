
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
<%'��ʼ��ҳ
				Const MaxPerPage=20 
   				dim totalPut   
   				dim CurrentPage
   				dim TotalPages
   				dim j
   				dim sql
    				if Not isempty(request("page")) then
      				currentPage=Cint(request("page"))
   				else
      				currentPage=1
   				end if 
				
		  dim namekey,checkbox,action
		  action=request.QueryString("action")
		  checkbox=request("checkbox")
		  namekey=request("namekey")
		  if namekey="" then namekey=request.QueryString("namekey")
		  if checkbox="" then checkbox=request.querystring("checkbox")
		 set rs=server.CreateObject("adodb.recordset")
		 if namekey="" then
		  select case action
		  case "all"
		 	rs.open "select username,id,name,logins,regdate from [userb] ",conn,1,1
		  case "huiyuan"
		 	rs.open "select username,id,name,logins,regdate from [userb] where reglx=1",conn,1,1
		  case "vip"
		 	rs.open "select username,id,name,logins,regdate from [userb] where reglx=2",conn,1,1
		  case "qy"
		 	rs.open "select username,id,name,logins,regdate from [userb] where reglx=3",conn,1,1
		  end select
		  else
		  if checkbox=1 then
		  rs.open "select username,id,name,logins,regdate from [userb] where username like '%"&namekey&"%' ",conn,1,1
		  else
		  rs.open "select username,id,name,logins,regdate from [userb] where username='"&namekey&"' ",conn,1,1
		  end if
		  end if
		  
				if err.number<>0 then
				response.write "���ݿ���������"
				end if
				
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> �Բ���û���ҵ����û���</p>"
   				else
	  				totalPut=rs.recordcount

      				if currentpage<1 then
          				currentpage=1
      				end if

      				if (currentpage-1)*MaxPerPage>totalput then
	   					if (totalPut mod MaxPerPage)=0 then
	     					currentpage= totalPut \ MaxPerPage
	   					else
	      					currentpage= totalPut \ MaxPerPage + 1
	   					end if
      				end if

       				if currentPage=1 then
            			showContent
            			showpage totalput,MaxPerPage,"manageuser.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"manageuser.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"manageuser.asp"
	      				end if
	   				end if
   				   				end if

   				sub showContent
       			dim i
	   			i=0

			%>
<br /><table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" colspan="4" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#ff0000">��վ�û�����</font></div>    </td>
  </tr>
  <tr align="center" bgcolor="f1f1f1"> 
    <td height="22"> <a href="manageuser.asp?action=all">�����û�</a> </td>
    <td height="22"><a href="manageuser.asp?action=huiyuan">��ͨ�û�</a></td>
    <td height="22"> <a href="manageuser.asp?action=vip">VIP�û�</a></td>
	<td height="22"> <a href="manageuser.asp?action=qy">��ҵ�û�</a></td>
  </tr>
  <tr> 
      <td height="237" colspan="4"><br />
        <table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
          <tr bgcolor="#f1f1f1"> 
            <td width="17%" height="25" bgcolor="#f1f1f1"> 
            <div align="center">��Ա����</div>            </td>
            <td width="18%" height="25" bgcolor="#f1f1f1"><div align="center">�û���</div></td>
            <td width="19%" height="22"> 
              <div align="center">��ʵ����</div>
            </td>
            <td width="18%" height="22"> 
              <div align="center">ע��ʱ��</div>
            </td>
            <td width="15%" height="22"> 
              <div align="center">��½����</div>
            </td>
            <td width="13%" height="22"> 
              <div align="center">ѡ ��</div>
            </td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
            <td height="21"> 
            <div align="center"><%=rs("id")%></div></td>
            <td><div align="center"><a href=listuser.asp?id=<%=rs("id")%>><%=trim(rs("username"))%></a></div></td>
            <td> 
              <div align="center"><%=trim(rs("name"))%></div>
            </td>
            <td> 
              <div align="center"><%=rs("regdate")%></div>
            </td>
            <td> 
              <div align="center"><%=rs("logins")%>��</div>
            </td>
            <td><div align="center"> 
				<a href=listuser.asp?id=<%=rs("id")%>>�޸�</a>
                <input type="submit" name="username" value="ɾ��" onclick=" window.location='saveuser.asp?action=del&username=<%=trim(rs("username"))%>'">
              </div>
            </td>
          </tr>
          <%i=i+1
			if i>=MaxPerPage then Exit Do
			rs.movenext
		  loop%>
        </table>
        <br />
      </td>
  </tr>
</table>
<%  
				End Sub   
  
					Function showpage(totalnumber,maxperpage,filename)  
  				Dim n
  				
				If totalnumber Mod maxperpage=0 Then  
					n= totalnumber \ maxperpage  
				Else
					n= totalnumber \ maxperpage+1  
				End If
				
				Response.Write "<form method=Post action="&filename&"?action="&action&"&checkbox="&checkbox&"&namekey="&namekey&">"  
				Response.Write "<p align='center' class='contents'> "  
				If CurrentPage<2 Then  
					Response.Write "<font class='contents'>��ҳ ��һҳ</font> "  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page=1&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>��ҳ</a> "  
					Response.Write "<a href="&filename&"?action="&action&"&page="&CurrentPage-1&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>��һҳ</a> "  
				End If
				
				If n-currentpage<1 Then  
					Response.Write "<font class='contents'>��һҳ βҳ</font>"  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page="&(CurrentPage+1)&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>"  
					Response.Write "��һҳ</a> <a href="&filename&"?action="&action&"&page="&n&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>βҳ</a>"  
				End If  
					Response.Write "<font class='contents'> ҳ�Σ�</font><font class='contents'>"&CurrentPage&"</font><font class='contents'>/"&n&"ҳ</font> "  
					Response.Write "<font class='contents'> ����"&totalnumber&"��ע���û� " 
					Response.Write "<font class='contents'>ת����</font><input type='text' name='page' size=2 maxlength=10 class=smallInput value="&currentpage&">"  
					Response.Write "&nbsp;<input type='submit'  class='contents' value='GO' name='cndok'></form>"  
				End Function  
			%>
<br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"> <font color="#000000">�� �� �� ��</font> </div>    </td>
  </tr>
  <tr> 
    <td height="59"> 
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <form name="form2" method="post" action="manageuser.asp?action=select">
            <td> 
              <div align="center">���û�������: 
                <input name="namekey" type="text" class="wenbenkuang" id="namekey" size="12">
                &nbsp; 
                <input name="checkbox" type="checkbox" id="checkbox" value="1" checked>
                ģ����ѯ 
                <input type="submit" name="Submit2" class="go-wenbenkuang" value="�� ѯ">
              </div>
            </td>
          </form>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br />
</body>
</html>
