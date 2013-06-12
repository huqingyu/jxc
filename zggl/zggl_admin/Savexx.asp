
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
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
response.Write "<script>alert('付款方式修改成功');window.location.href='editxx.asp';</script>"
response.End
case "jiaoyitiaokuan"
rs.Open "select jiaoyitiaokuan from config",conn,1,3
rs("jiaoyitiaokuan")=content
rs.Update
session("content")=""
response.Write "<script>alert('交易条款修改成功');window.location.href='editxx.asp';</script>"
response.End
case "yunshushuoming"
rs.Open "select yunshushuoming from config",conn,1,3
rs("yunshushuoming")=content
rs.Update
session("content")=""
response.Write "<script>alert('运输说明修改成功');window.location.href='editxx.asp';</script>"
response.End
case "gouwuliucheng"
rs.Open "select gouwuliucheng from config",conn,1,3
rs("gouwuliucheng")=content
rs.Update
session("content")=""
response.Write "<script>alert('购物流程修改成功');window.location.href='editxx.asp';</script>"
response.End
case "changjianwenti"
rs.Open "select changjianwenti from config",conn,1,3
rs("changjianwenti")=content
rs.Update
session("content")=""
response.Write "<script>alert('常见问题修改成功');window.location.href='editxx.asp';</script>"
response.End
case "baomi"
rs.Open "select baomi from config",conn,1,3
rs("baomi")=content
rs.Update
session("content")=""
response.Write "<script>alert('保密和安全修改成功');window.location.href='editxx.asp';</script>"
response.End
case "shouhoufuwu"
rs.Open "select shouhoufuwu from config",conn,1,3
rs("shouhoufuwu")=content
rs.Update
session("content")=""
response.Write "<script>alert('商品销售和售后服务修改成功');window.location.href='editxx.asp';</script>"
response.End
case "shiyongfalv"
rs.Open "select shiyongfalv from config",conn,1,3
rs("shiyongfalv")=content
rs.Update
session("content")=""
response.Write "<script>alert('适用法律和版权声明修改成功');window.location.href='editxx.asp';</script>"
response.End
case "regtiaoyue"
rs.Open "select regtiaoyue from config",conn,1,3
rs("regtiaoyue")=content
rs.Update
session("content")=""
response.Write "<script>alert('注册条约修改成功');window.location.href='editxx.asp';</script>"
response.End
case "songhuofeiyong"
rs.Open "select songhuofeiyong from config",conn,1,3
rs("songhuofeiyong")=content
rs.Update
session("content")=""
response.Write "<script>alert('送货方式及费率修改成功');window.location.href='editxx.asp';</script>"
response.End
case "gongzuoshijian"
rs.Open "select gongzuoshijian from config",conn,1,3
rs("gongzuoshijian")=content
rs.Update
session("content")=""
response.Write "<script>alert('我们的工作时间修改成功');window.location.href='editxx.asp';</script>"
response.End
case "jifen"
rs.Open "select jifen from config",conn,1,3
rs("jifen")=content
rs.Update
session("content")=""
response.Write "<script>alert('积分奖励修改成功');window.location.href='editxx.asp';</script>"
response.End
case "vip"
rs.Open "select vip from config",conn,1,3
rs("vip")=content
rs.Update
session("content")=""
response.Write "<script>alert('VIP特惠修改成功');window.location.href='editxx.asp';</script>"
response.End
case "about"
rs.Open "select about from config",conn,1,3
rs("about")=content
rs.Update
session("content")=""
response.Write "<script>alert('关于本站修改成功');window.location.href='editxx.asp';</script>"
response.End
case "lxwm"
rs.Open "select lxwm from config",conn,1,3
rs("lxwm")=content
rs.Update
session("content")=""
response.Write "<script>alert('联系我们修改成功');window.location.href='editxx.asp';</script>"
response.End
case "jtcg"
rs.Open "select jtcg from config",conn,1,3
rs("jtcg")=content
rs.Update
session("content")=""
response.Write "<script>alert('集团采购修改成功');window.location.href='editxx.asp';</script>"
response.End
end select
%>