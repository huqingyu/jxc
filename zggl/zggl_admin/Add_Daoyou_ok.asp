<!--#include file="admin_common/conn.asp" -->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if

dim d_name1,sex1,nianling1,vip1,tuijian1,mingzu1,tel1,add1,mail1,lianxi1,info1,back1,img1,poho1
d_name1=Request("d_name2")
sex1=request("sex2")
nianling1=request("nianling2")
vip1=request("vip2")
tuijian1=request("tuijian2")
mingzu1=request("mingzu2")
tel1=request("tel2")
add1=request("add2")
mail1=request("mail2")
lianxi1=request("lianxi2")
xianlu1=request("xianlu2")
lang1=request("lang2")
info1=request("info2")
back1=request("back2")
img1=request("img2")
poho1=request("poho2")
if img1="" then
img1="images/nophoto.gif"
end if
if poho1="" then
poho1="images/nophoto.gif"
end if
set rs=server.createobject("adodb.recordset")
sql="select * From daoyou"
rs.open sql,conn,3,3
rs.addnew

rs("d_name")=d_name1
rs("sex")=sex1
rs("nianling")=nianling1
rs("vip")=vip1
rs("tuijian")=tuijian1
rs("mingzu")=mingzu1
rs("tel")=tel1
rs("add")=add1
rs("mail")=mail1
rs("lianxi")=lianxi1
rs("xianlu")=xianlu1
rs("lang")=lang1
rs("info")=info1
rs("back")=back1
rs("img")=img1
rs("poho")=poho1

rs.update
rs.close
conn.close
response.Write "<script language='javascript'>alert('该导游记录添加成功！');window.location.href='Admin_Emddaoyou.asp';</script>"
response.End
%>
