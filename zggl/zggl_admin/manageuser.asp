
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
<%'开始分页
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
				response.write "数据库中无数据"
				end if
				
  				if rs.eof And rs.bof then
       				Response.Write "<p align='center' class='contents'> 对不起，没有找到此用户！</p>"
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
    <div align="center"><font color="#ff0000">网站用户管理</font></div>    </td>
  </tr>
  <tr align="center" bgcolor="f1f1f1"> 
    <td height="22"> <a href="manageuser.asp?action=all">所有用户</a> </td>
    <td height="22"><a href="manageuser.asp?action=huiyuan">普通用户</a></td>
    <td height="22"> <a href="manageuser.asp?action=vip">VIP用户</a></td>
	<td height="22"> <a href="manageuser.asp?action=qy">企业用户</a></td>
  </tr>
  <tr> 
      <td height="237" colspan="4"><br />
        <table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
          <tr bgcolor="#f1f1f1"> 
            <td width="17%" height="25" bgcolor="#f1f1f1"> 
            <div align="center">会员号码</div>            </td>
            <td width="18%" height="25" bgcolor="#f1f1f1"><div align="center">用户名</div></td>
            <td width="19%" height="22"> 
              <div align="center">真实姓名</div>
            </td>
            <td width="18%" height="22"> 
              <div align="center">注册时间</div>
            </td>
            <td width="15%" height="22"> 
              <div align="center">登陆次数</div>
            </td>
            <td width="13%" height="22"> 
              <div align="center">选 择</div>
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
              <div align="center"><%=rs("logins")%>次</div>
            </td>
            <td><div align="center"> 
                <input type="submit" name="username" value="删除" onclick=" window.location='saveuser.asp?action=del&username=<%=trim(rs("username"))%>'">
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
					Response.Write "<font class='contents'>首页 上一页</font> "  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page=1&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>首页</a> "  
					Response.Write "<a href="&filename&"?action="&action&"&page="&CurrentPage-1&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>上一页</a> "  
				End If
				
				If n-currentpage<1 Then  
					Response.Write "<font class='contents'>下一页 尾页</font>"  
				Else  
					Response.Write "<a href="&filename&"?action="&action&"&page="&(CurrentPage+1)&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>"  
					Response.Write "下一页</a> <a href="&filename&"?action="&action&"&page="&n&"&checkbox="&checkbox&"&namekey="&namekey&" class='contents'>尾页</a>"  
				End If  
					Response.Write "<font class='contents'> 页次：</font><font class='contents'>"&CurrentPage&"</font><font class='contents'>/"&n&"页</font> "  
					Response.Write "<font class='contents'> 共有"&totalnumber&"名注册用户 " 
					Response.Write "<font class='contents'>转到：</font><input type='text' name='page' size=2 maxlength=10 class=smallInput value="&currentpage&">"  
					Response.Write "&nbsp;<input type='submit'  class='contents' value='GO' name='cndok'></form>"  
				End Function  
			%>
<br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"> <font color="#000000">搜 索 用 户</font> </div>    </td>
  </tr>
  <tr> 
    <td height="59"> 
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <form name="form2" method="post" action="manageuser.asp?action=select">
            <td> 
              <div align="center">按用户名查找: 
                <input name="namekey" type="text" class="wenbenkuang" id="namekey" size="12">
                &nbsp; 
                <input name="checkbox" type="checkbox" id="checkbox" value="1" checked>
                模糊查询 
                <input type="submit" name="Submit2" class="go-wenbenkuang" value="查 询">
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
