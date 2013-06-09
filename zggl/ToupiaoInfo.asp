<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="100%" height=50 align="center" valign="top"> 
            <%
		set rs=conn.execute("SELECT * FROM toupiao where IsChecked=1 ") 
		if rs.eof then
	  %>
            ÔÝÎÞÍ¶Æ± 
            <%else%>
            <table border="0" width="91%" cellspacing="2" cellpadding="2">
              <tr> 
                <td width=100% align="center"><b><br>
                  <%=rs("Title")%> </b><br>
                </td>
              </tr>
              <form action="vote.asp" target="newwindow" method=post name=research>
                <tr> 
                  <td valign=top width="100%"> 
                    <%
for i=1 to 8
	if rs("Select"&i)<>"" then
%>
                    <input style="border: 0" <%if i=1 then%>checked<%end if%> name=Options type=radio value=<%=i%>>
                    <%=i%>.<%=rs("Select"&i)%><br>
                    <%
	end if
next
%>
                  </td>
                </tr>
                <tr> 
                  <td width="100%" height=30 align=center> 
                    <input type="image" border="0" name="submit" src="images/vote1.gif" width="59" height="19" style="cursor:hand">
                    <a href="vote.asp?stype=view" target="_blank"><img src="images/vote.gif" width="59" height="19" border="0"></a> 
                  </td>
                </tr>
              </form>
            </table>
            <%
end if
rs.close
%>
          </td>
        </tr>
      </table>