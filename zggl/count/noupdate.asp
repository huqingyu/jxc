
<%
Application.Lock
SQLcmd = "select * from sum"
set rs=conn.Execute(SQLcmd)
sum=rs("sum")
Application.UnLock 
x = CStr(sum)  
For i = 1 To Len(x)              
   gif = gif & "<img src='count/gif/"& Mid(x, i, 1) & ".gif' border=0>"
Next
gif_sum = gif
%>