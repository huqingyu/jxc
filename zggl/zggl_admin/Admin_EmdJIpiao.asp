
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br />
<!--#include file="admin_common/conn.asp" -->
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#FF0000"><b>��Ʊ��Ϣ�޸�ɾ��</b></font></div>    </td>
  </tr>
  <tr> 
    <td height="140" valign="top"><br />
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
		 set rs=server.createobject("adodb.recordset")
	rs.open "select * from dingbiao",conn,1,1
		  
				if err.number<>0 then
				response.write "���ݿ��������ݣ�"
				end if
				
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> ����û����ӵ��Σ�</p>"
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
            			showpage totalput,MaxPerPage,"Admin_EmdJipiao.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"Admin_EmdJipiao.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"Admin_EmdJipiao.asp"
	      				end if
	   				end if
   				   				end if

   				sub showContent
       			dim i
	   			i=0

			%>
      <table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
          <tr bgcolor="#f1f1f1"> 
           <td width="15%" height="25" bgcolor="#f1f1f1"> 
            <div align="center">�����</div>            </td>
            <td width="20%" height="22"> 
              <div align="center">��������</div>
            </td>
            <td width="20%"><div align="center">���չ�˾</div></td>
            <td width="11%" height="22">
              <div align="center">��������</div>
            </td>
            <td width="12%"><div align="center">����/����</div></td>
            <td width="11%"><div align="center">�� ��</div></td>
            <td width="11%"><div align="center">ɾ ��</div></td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
            <td height="20"> 
            <div align="center"><%=trim(rs("hbh"))%></div>            </td>
            <td> 
              <div align="center"><%=rs("chufachenshi")%>��<%=rs("mudichenshi")%></div>
            </td>
            <td><div align="center"><%=rs("hankonggongsi")%></div></td>
            <td> 
              <div align="center">
                <div align="center"><%=rs("hdtype")%></div>
              </div>
            </td>
            <td><div align="center"><%=rs("type")%></div></td>
            <td><div align="center"><a href="admin_jipiaoeditdel.asp?id=<%=rs("id")%>&action=edit" title="�༭�������">�༭</a></div></td>
            <td><div align="center"><a href="admin_jipiaoeditdel.asp?id=<%=rs("id")%>&action=del" title="ɾ���������">ɾ��</a></div></td>
          </tr>
          <%i=i+1
			if i>=MaxPerPage then Exit Do
			rs.movenext
		  loop
		  rs.close
		  set rs=nothing%>
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
				
				Response.Write "<form method=Post action="&filename&">"  
				Response.Write "<p align='center' class='contents'> "  
				If CurrentPage<2 Then  
					Response.Write "<font class='contents'>��ҳ ��һҳ</font> "  
				Else  
					Response.Write "<a href="&filename&"?page=1 class='contents'>��ҳ</a> "  
					Response.Write "<a href="&filename&"?page="&CurrentPage-1&" class='contents'>��һҳ</a> "  
				End If
				
				If n-currentpage<1 Then  
					Response.Write "<font class='contents'>��һҳ βҳ</font>"  
				Else  
					Response.Write "<a href="&filename&"?page="&(CurrentPage+1)&" class='contents'>"  
					Response.Write "��һҳ</a> <a href="&filename&"?page="&n&" class='contents'>βҳ</a>"  
				End If  
					Response.Write "<font class='contents'> ҳ�Σ�</font><font class='contents'>"&CurrentPage&"</font><font class='contents'>/"&n&"ҳ</font> "  
					Response.Write "<font class='contents'> ����"&totalnumber&"����Ʊ��Ϣ " 
					Response.Write "<font class='contents'>ת����</font><input type='text' name='page' size=2 maxlength=10 class=smallInput value="&currentpage&">"  
					Response.Write "&nbsp;<input type='submit'  class='contents' value='GO' name='cndok'></form>"  
				End Function  
			%>
    </td>
  </tr>
</table>
<br />
</body>
</html>