<%
'=============================================
'名称:LastNextPage
'作用:分页的调用
'=============================================
Sub LastNextPage(pagecount,page,resultcount)
Dim query, a, x, temp
action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
query = Split(Request.ServerVariables("QUERY_STRING"), "&")
For Each x In query
     a = Split(x, "=")
     If StrComp(a(0), "page", vbTextCompare) <> 0 Then
         temp = temp & a(0) & "=" & a(1) & "&"
     End If
Next

Response.Write("<table cellspacing=0 cellpadding=0 border=0>" & vbCrLf )  
Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;""><TR>" & vbCrLf )
Response.Write("<TD align=right>" & vbCrLf )
' Response.Write(font_style & vbCrLf ) 
  
if page<=1 then
  Response.Write ("首页 " & vbCrLf)  
  Response.Write ("上一页 " & vbCrLf)
else  
  Response.Write("<A HREF=" & action & "?" & temp & "Page=1>首页</A> " & vbCrLf)
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">上一页</A> " & vbCrLf)
end if

if page>=pagecount then
  Response.Write ("下一页 " & vbCrLf)
  Response.Write ("尾页" & vbCrLf)   
else
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">下一页</A> " & vbCrLf)
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">尾页</A>" & vbCrLf)   
end if
  
Response.Write(" 第" & "&nbsp;<INPUT TYEP=TEXT NAME=page SIZE=2 Maxlength=4 VALUE=" & page & ">&nbsp;" & "页"  & vbCrLf & "<INPUT type=submit value=GO>")
Response.Write(" 共 " & pageCount & " 页" &  vbCrLf)   
Response.Write(" " & resultcount & " 条信息" &  vbCrLf)   
Response.Write("</TD>" & vbCrLf )    
Response.Write("</TR></form>" & vbCrLf )  
Response.Write("</table>" & vbCrLf )  
End Sub
%>