
<%
if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
dim shengid,shengorder,shengname,shengno,i
if request("action")="update" then
    for i=1 to request.form("shengid").count
	shengid=replace(request.form("shengid")(i),"'","")
	shengorder=replace(request.form("shengorder")(i),"'","")
	shengname=replace(request.form("shengname")(i),"'","")
	shengno=replace(request.form("shengno")(i),"'","")
	if replace(request.form("shengorder")(i),"'","")="" then
%>
<script>
history.back();
alert("����дʡ����ʾ����");
</script>
<%
		Response.End
	end if
	conn.execute("update szsheng set shengorder="&shengorder&",shengname='"&shengname&"',shengno='"&shengno&"' where id="&shengid)

    next
conn.close
set conn=nothing
response.write "<p align=center><font color=red>ʡ���óɹ�!<br />2���Ӻ󷵻���ҳ!</font>"
response.write "<meta http-equiv=""refresh"" content=""2;url=shengmanage.asp"">"
end if


if request("action")="add" then
	shengno=request.form("shengno")
	shengname=trim(request("shengname"))
	shengorder=request.form("shengorder")
	If shengname="" Then
		response.write "ʡ���Ʋ���Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
	If shengno="" Then
		response.write "ʡ������Ʋ���Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
	If shengorder="" Then
		response.write "������Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open "select * from szsheng",conn,1,3
rs.addnew
rs("shengname")=shengname
rs("shengno")=shengno
rs("shengorder")=shengorder
rs.update
rs.close
set rs=nothing

conn.close
set conn=nothing
response.write "<p align=center><font color=red>ʡ��ӳɹ�!<br />2���Ӻ󷵻���ҳ!</font>"
response.write "<meta http-equiv=""refresh"" content=""2;url=shengmanage.asp"">"
end if
%>