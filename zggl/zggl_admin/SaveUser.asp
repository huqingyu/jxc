
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
<!--#include file="../userinfo/md5.asp"-->
<%
dim action,id,username
action=trim(request("action"))
userid=trim(request("id"))
username=trim(request("username"))

select case action
case "save"
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from [userb] where id="&userid ,conn,1,3
if trim(request("userpassword"))<>"" then rs("userpassword")=md5(trim(request("userpassword")))
rs("name")=trim(request("name"))
rs("email")=trim(request("email"))
rs("idcard")=trim(request("idcard"))
rs("sex")=trim(request("sex"))
rs("address")=trim(request("address"))
rs("zip")=trim(request("zip"))
rs("telphone")=trim(request("telphone"))
rs("work")=trim(request("work"))
if trim(request("vipdate"))<>"" then
rs("vipdate")=trim(request("vipdate"))
rs("jifen")=trim(request("jifen"))
end if
if trim(request("yucun"))<>"" then
rs("yucun")=trim(request("yucun"))
else
rs("yucun")=0
end if
rs("reglx")=trim(request("reglx"))
if trim(request("reglx"))=3 then
rs("Qy_Name")=trim(request("Qy_Name"))
rs("Qy_Tel")=trim(request("Qy_Tel"))
rs("Qy_Email")=trim(request("Qy_Email"))
end if
rs.Update
rs.Close
set rs=nothing
response.Write "<script>alert('�����ɹ�!');history.go(-1);</script>"

case "del"
conn.execute("Delete * From [userb] Where Username='"&username&"'")
conn.close
set conn=nothing
response.write("<script>alert('��ѡ����û� ["&username&"] �Ѿ�ɾ������ȷ���������룡');window.location='manageuser.asp?action=all';</script>")
end select
%>
