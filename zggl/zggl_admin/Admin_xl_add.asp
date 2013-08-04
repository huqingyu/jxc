<!--#include FILE="Upload_inc.asp"-->
<!--#include file="admin_common/conn_origin.asp" -->
<%if session("admin")="" then
	response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
	response.End
else
	if session("flag")=3 then
		response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
		response.End
	end if
end if

dim action
action=trim(request("action"))
select case action
	case "addok"
	addok
	case "editok1"
	editok1
	case else
	response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select

sub addok
	set upload=new upload_5xSoft
	set file=upload.file("ttt")	
	
	dim ta,tb,tc,td,te,tf,tg,tj,tk,x_top
	ta=replace(trim(upload.form("ta")),"'","’")
	tb=replace(trim(upload.form("tb")),"'","’")
	tc=replace(trim(upload.form("tc")),"'","’")
	td=replace(trim(upload.form("td")),"'","’")
	te=replace(trim(upload.form("te")),"'","’")
	tf=replace(trim(upload.form("tf")),"'","’")
	tg=replace(trim(upload.form("tg")),"'","’")
	th=replace(trim(upload.form("th")),"'","’")
	tk=replace(trim(upload.form("tk")),"'","’")
	x_top=trim(upload.form("x_top"))
	IDstring="xl_" & date & time
	IDstring=Replace(IDstring,"-","")
	IDstring=Replace(IDstring,":","")
	pthString="/uimages/"

	if file.filesize>0 then
		if file.filesize>2097152 then
			set file=nothing
			response.write("<script>alert('上传图片的大小不能大于2M，即：2097152字节！');history.back(1);</script>")
		else
			FileTpe=Mid(file.filename,Len(file.filename)-2)
			if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
				response.write("<script>alert('上传图片格式只能为：JPG,BMP,GIF。');history.back(1);</script>")
			else
				file.saveAs Server.mappath(pthString & IDstring & "." & FileTpe)
				filepath=pthString & IDstring & "." & FileTpe
			end if
		end if
	else
		filepath=""
	end if
	set file=nothing

	conn.execute "insert into xianlu (x_name,x_baojia,x_leixun,x_shijian,x_shuoming,x_jingdian,x_anpai,x_zhushi,x_jingdiantupian,x_leiid,x_top) values ('"&ta&"','"&tb&"','"&tc&"','"&te&"','"&th&"','"&tg&"','"&tf&"','"&tk&"','"&filepath&"','"&td&"',"&x_top&")"
	conn.close
	response.write("<script>alert('添加线路成功！');location='admin_addxl.asp?action=edit';</script>")
end sub

sub editok1
	set upload=new upload_5xSoft
	set file=upload.file("ttt")
	
	dim id,ta,tb,tc,td,te,tf,tg,tj,tk,x_top
	id=trim(upload.form("xid"))
	ta=replace(trim(upload.form("ta")),"'","’")
	tb=replace(trim(upload.form("tb")),"'","’")
	tc=replace(trim(upload.form("tc")),"'","’")
	td=replace(trim(upload.form("td")),"'","’")
	te=replace(trim(upload.form("te")),"'","’")
	tf=replace(trim(upload.form("tf")),"'","’")
	tg=replace(trim(upload.form("tg")),"'","’")
	th=replace(trim(upload.form("th")),"'","’")
	tk=replace(trim(upload.form("tk")),"'","’")
	x_top=trim(upload.form("x_top"))
	img=trim(upload.form("rimg"))
	IDstring="xl_" & date & time
	IDstring=Replace(IDstring,"-","")
	IDstring=Replace(IDstring,":","")
	pthString="/uimages/"


	if file.filesize>0 then
		if instr(img,pthstring)=0 then
			response.write ("不是内部图，无须删除！")
		else
			img1=replace(img,"/uimages/","")
			Set fso = CreateObject("Scripting.FileSystemObject")
			Set f2 = fso.getfile(server.mappath("/uimages/"&img1))
			f2.delete
			conn.execute("update xianlu set x_jingdiantupian='' where id="&id)
		end if
		if file.filesize>2097152 then
			set file=nothing
			response.write("<script>alert('上传图片的大小不能大于2M，即：2097152字节！');history.back(1);</script>")
		else
			FileTpe=Mid(file.filename,Len(file.filename)-2)
			if not (ucase(fileTpe)="JPG" or ucase(fileTpe)="BMP" or ucase(fileTpe)="GIF") then
				response.write("<script>alert('上传图片格式只能为：JPG,BMP,GIF。');history.back(1);</script>")
			else
				file.saveAs Server.mappath(pthString & IDstring & "." & FileTpe)
				filepath=pthString & IDstring & "." & FileTpe
				conn.execute("update xianlu set x_jingdiantupian='"&filepath&"' where id="&id)
				set f2=nothing
				set file=nothing
			end if
		end if
	end if
	
	sss="update xianlu set x_name='"&ta&"',x_baojia='"&tb&"',x_leixun='"&tc&"',x_shijian='"&te&"',x_shuoming='"&th&"',x_jingdian='"&tg&"',x_anpai='"&tf&"',x_zhushi='"&tk&"',x_leiid='"&td&"',x_top='"&x_top&"' where id="&id

	'Response.Write(sss)
	conn.execute(sss)
	conn.close
	response.write("<script>alert('此线路编辑修改完成！按确定重新载入！');location='admin_addxl.asp?action=editok&id="&id&"';</script>")
end sub
%>