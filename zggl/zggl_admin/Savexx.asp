
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
dim action,html
html=request("html")
action=request.QueryString("action")
Content=Request.Form("Content")
 aa="http://"&Request.ServerVariables("server_name")&Request.ServerVariables("path_info")
 aa= mid(aa,1,len(aa)-16)
content=replace(content,aa,"")

session("content")=content

set rs=server.CreateObject("adodb.recordset")
select case action
case "huikuanfangshi"
rs.Open "select huikuanfangshi from config",conn,1,3
rs("huikuanfangshi")=content
rs.Update
session("content")=""
response.Write "<script>alert('���ʽ�޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "jiaoyitiaokuan"
rs.Open "select jiaoyitiaokuan from config",conn,1,3
rs("jiaoyitiaokuan")=content
rs.Update
session("content")=""
response.Write "<script>alert('���������޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "yunshushuoming"
rs.Open "select yunshushuoming from config",conn,1,3
rs("yunshushuoming")=content
rs.Update
session("content")=""
response.Write "<script>alert('����˵���޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "gouwuliucheng"
rs.Open "select gouwuliucheng from config",conn,1,3
rs("gouwuliucheng")=content
rs.Update
session("content")=""
response.Write "<script>alert('���������޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "changjianwenti"
rs.Open "select changjianwenti from config",conn,1,3
rs("changjianwenti")=content
rs.Update
session("content")=""
response.Write "<script>alert('���������޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "baomi"
rs.Open "select baomi from config",conn,1,3
rs("baomi")=content
rs.Update
session("content")=""
response.Write "<script>alert('���ܺͰ�ȫ�޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "shouhoufuwu"
rs.Open "select shouhoufuwu from config",conn,1,3
rs("shouhoufuwu")=content
rs.Update
session("content")=""
response.Write "<script>alert('��Ʒ���ۺ��ۺ�����޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "shiyongfalv"
rs.Open "select shiyongfalv from config",conn,1,3
rs("shiyongfalv")=content
rs.Update
session("content")=""
response.Write "<script>alert('���÷��ɺͰ�Ȩ�����޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "regtiaoyue"
rs.Open "select regtiaoyue from config",conn,1,3
rs("regtiaoyue")=content
rs.Update
session("content")=""
response.Write "<script>alert('ע����Լ�޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "songhuofeiyong"
rs.Open "select songhuofeiyong from config",conn,1,3
rs("songhuofeiyong")=content
rs.Update
session("content")=""
response.Write "<script>alert('�ͻ���ʽ�������޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "gongzuoshijian"
rs.Open "select gongzuoshijian from config",conn,1,3
rs("gongzuoshijian")=content
rs.Update
session("content")=""
response.Write "<script>alert('���ǵĹ���ʱ���޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "jifen"
rs.Open "select jifen from config",conn,1,3
rs("jifen")=content
rs.Update
session("content")=""
response.Write "<script>alert('���ֽ����޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "vip"
rs.Open "select vip from config",conn,1,3
rs("vip")=content
rs.Update
session("content")=""
response.Write "<script>alert('VIP�ػ��޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "about"
rs.Open "select about from config",conn,1,3
rs("about")=content
rs.Update
session("content")=""
response.Write "<script>alert('���ڱ�վ�޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "lxwm"
rs.Open "select lxwm from config",conn,1,3
rs("lxwm")=content
rs.Update
session("content")=""
response.Write "<script>alert('��ϵ�����޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
case "jtcg"
rs.Open "select jtcg from config",conn,1,3
rs("jtcg")=content
rs.Update
session("content")=""
response.Write "<script>alert('���Ųɹ��޸ĳɹ�');window.location.href='editxx.asp';</script>"
response.End
end select
%>