
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
dim id,shengid,shiid,shiorder,shiname,shino,i
id=request("id")
if request("action")="update" then
    for i=1 to request.form("shiid").count
	shiid=replace(request.form("shiid")(i),"'","")
	shengid=replace(request.form("shengid")(i),"'","")
	shiorder=replace(request.form("shiorder")(i),"'","")
	shiname=replace(request.form("shiname")(i),"'","")
	shino=replace(request.form("shino")(i),"'","")
	if replace(request.form("shiorder")(i),"'","")="" then
%>
<script>
history.back();
alert("����д�е���ʾ����");
</script>
<%
		Response.End
	end if
	conn.execute("update szshi set shengid="&shengid&",shiorder="&shiorder&",shiname='"&shiname&"',shino='"&shino&"' where id="&shiid)

    next
conn.close
set conn=nothing
response.write "<p align=center><font color=red>�����óɹ�!<br />2���Ӻ󷵻���ҳ!</font>"
if id<>"" then
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp?shengid="&id&""">"
else
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp"">"
end if
end if


if request("action")="add" then
	shengid=request.form("shengid")
	shino=request.form("shino")
	shiname=trim(request("shiname"))
	shiorder=request.form("shiorder")
	If shiname="" Then
		response.write "�����Ʋ���Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
	If shino="" Then
		response.write "�б�����Ʋ���Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
	If shiorder="" Then
		response.write "������Ϊ�գ���<a href=javascript:history.go(-1)>����������д</a>��"
		response.end
	end if
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open "select * from szshi",conn,1,3
rs.addnew
rs("shiname")=shiname
rs("shengid")=shengid
rs("shino")=shino
rs("shiorder")=shiorder
rs.update
rs.close
set rs=nothing

conn.close
set conn=nothing
response.write "<p align=center><font color=red>����ӳɹ�!<br />2���Ӻ󷵻���ҳ!</font>"
if id<>"" then
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp?shengid="&id&""">"
else
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp"">"
end if
end if
%>