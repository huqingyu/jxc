
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>=2 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
dim shiid,id
shiid=request("shiid")
id=request("id")
	conn.execute("delete from szshi where id=" &shiid)
	conn.close
	set conn=nothing
	response.write "<p align=center><font color=red>��ϲ��!��ѡ������Ѿ���ɾ��!<br />2���Ӻ󷵻���ҳ!</font>"
if id<>"" then
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp?shengid="&id&""">"
else
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp"">"
end if
	response.end
%>