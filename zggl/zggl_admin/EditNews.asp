
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
if request.QueryString("action")="del" then
dim id,FileName
id=trim(Request("selectdel"))
FileName = "../News/News_"&id&".html"
if instr(FileName)>0 then
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.getfile(server.mappath(FileName))
f2.delete
set fso=nothing
set f2=nothing
end if
conn.execute "delete from news where id in ("&request("selectdel")&")"
response.Redirect  "editnews.asp"
end if %>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#FF0000"><b>�����޸�ɾ��</b></font></div>    </td>
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
	rs.open "select id,title,Admin,Time From news order by Time desc",conn,1,1
		  
				if err.number<>0 then
				response.write "���ݿ���������"
				end if
				
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> ����û��������ţ�</p>"
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
            			showpage totalput,MaxPerPage,"editnews.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"editnews.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"editnews.asp"
	      				end if
	   				end if
   				   				end if

   				sub showContent
       			dim i
	   			i=0

			%>
      <table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
        <form name="form1" method="post" action="editnews.asp?action=del">
          <tr bgcolor="#f1f1f1"> 
            <td width="40%" height="22"> 
              <div align="center">��������(�������༭״̬)</div>
            </td>
            <td width="20%" height="22"> 
              <div align="center">������</div>
            </td>
            <td width="21%" height="22"> 
              <div align="center">����ʱ��</div>
            </td>
            <td width="9%" height="22"> 
              <div align="center">ѡ ��</div>
            </td>
            <td width="10%"><div align="center">����html</div></td>
          </tr>
          <%do while not rs.eof%>
          <tr> 
            <td style="PADDING-LEFT: 6px"><a href=newsedit.asp?id=<%=rs("id")%>><%=trim(rs("Title"))%></a></td>
            <td> 
              <div align="center"><%=trim(rs("Admin"))%></div>
            </td>
            <td> 
              <div align="center"><%=rs("Time")%></div>
            </td>
            <td> 
              <div align="center"> 
              <input name="selectdel" type="radio" id="selectdel" value=<%=rs("id")%>>
              </div>
            </td>
            <td><div align="center"><a href=make_newslist.asp?id=<%=rs("id")%>>����</a></div></td>
          </tr>
          <%i=i+1
			if i>=MaxPerPage then Exit Do
			rs.movenext
		  loop
		  rs.close
		  set rs=nothing%>
          <tr> 
            <td height="30" colspan="5"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="ɾ����ѡ����"  class="go-wenbenkuang">
                </div>
            </td>
          </tr>
        </form>
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
					Response.Write "<font class='contents'> ����"&totalnumber&"������ " 
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