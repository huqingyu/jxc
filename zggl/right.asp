<table width="220" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30" height="30" align="center" bgcolor="#CC0000"><img src="images/title_bat.jpg" width="13" height="7" /></td>
        <td bgcolor="#E40000" class="tit">��̳��¼</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/r_tt.jpg" width="220" height="16" /></td>
        </tr>
      <tr>
        <td height="122" align="center" background="images/r_cc.jpg"><% If session("zymlgname") <> "" Then %>
            <table width="162" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="26" align="right" style=" padding-right:3px;"><font color="#FF6600"><b>�װ���</b></font></td>
                <td height="26" align="left"><iframe src="bbs/l.asp" name="video" width="75" height="20" scrolling="No" frameborder="0" id="video" border="0"></iframe></td>
              </tr>
              <tr>
                <td height="26" colspan="2" align="center"><font color="#FF3300"> �����ڵ�λ��:��ӭ����</font></td>
              </tr>
              <tr>
                <td height="26" align="right"><a href="bbs/usersetup.asp" target="_blank">�������</a></td>
                <td height="26" align="center"><a href="bbs/elselist.asp?action=good" target="_blank">��������</a></td>
              </tr>
              <tr>
                <td height="26" align="right"><a href="bbs/sms.asp?action=write" target="_blank">��������</a></td>
                <td height="26" align="center"><a href="bbs/login.asp?action=exit" target="_blank"><font color="#99CC00">ע����¼</font></a></td>
              </tr>
            </table>
          <% Else %>
            <table bgcolor="#ffffff" align="center" border="0" cellpadding="0" cellspacing="0" style='border:1px solid #;FF9933' width="162" >
              <form method="post" target="_blank" action="bbs/login.asp?action=login">
                <tr>
                  <td width="50" height="26" >�û���:</td>
                  <td height="26" ><input size="9" name="lgname" class='an5' />
                  </td>
                </tr>
                <tr>
                  <td height="26" >��&nbsp; ��:</td>
                  <td height="26" ><input type="password" size="9" name="lgpwd" class='an5' />
                  </td>
                </tr>
                <tr>
                  <td height="26" >��֤��:</td>
                  <td height="26" ><input size="4" name="adminid" maxlength="4" class="an6" />
                    &nbsp;<img src="bbs/code.asp" /></td>
                </tr>
                <tr>
                  <td height="28" colspan="2" align="center" style="padding-top:3px;"><input type="submit" value='�� ¼' name="Submit" class='sub' />
                    &nbsp;
                    <input class="sub" type="reset" name="submit22" value="�� ��" />
                  </td>
                </tr>
              </form>
            </table>
          <% End If %>
        </td>
      </tr>
      <tr>
        <td><img src="images/r_bb.jpg" width="220" height="16" /></td>
        </tr>
    </table></td>
  </tr>
  
  
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30" height="30" align="center" bgcolor="#CC0000"><img src="images/title_bat.jpg" width="13" height="7" /></td>
        <td bgcolor="#E40000" class="tit">���򾭼�</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="169"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 14 * from news where  mytype=17 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="22">&nbsp;��<a href="show.asp?id=<%=rs("id")%>" target="_blank">
                <% If rs("color")<>"" Then %>
                <font color="<%= rs("color") %>"><%=left(rs("bt"),12)%></font>
                <% Else %>
                <%=left(rs("bt"),12)%>
                <% End If %>
              </a></td>
            </tr>
            <% rs.movenext 
wend 
			 %>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30" height="30" align="center" bgcolor="#CC0000"><img src="images/title_bat.jpg" width="13" height="7" /></td>
        <td bgcolor="#E40000" class="tit">���߷���</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="168"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 7 * from news where  mytype=16 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="22">&nbsp;��<a href="show.asp?id=<%=rs("id")%>" target="_blank">
                <% If rs("color")<>"" Then %>
                <font color="<%= rs("color") %>"><%=left(rs("bt"),12)%></font>
                <% Else %>
                <%=left(rs("bt"),12)%>
                <% End If %>
              </a></td>
            </tr>
            <% rs.movenext 
wend 
			 %>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
  
  
</table>
