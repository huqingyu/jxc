<%
Response.AddHeader "Cache-Control","no-cache,must-revalidate" 

Dim Conn,Plus_Conn,Db,MyDbPath,SiteName,SiteUrl,AdminLoginCode,ConnStr
AdminLoginCode="***" '安全码设置
PATH_INFO=request.servervariables("PATH_INFO")
PATH=split(PATH_INFO,"/")
If Ubound(PATH)=<2 Then
  MyDbPath = "/"
Else
  MyDbPath = "/"&PATH(1)&"/"
End if  
Db = "/***.mdb"
ShowErr="1" '是否开启调试，1为显示错误信息，0为不显示错误信息，建议网站正常运行后，请填0

'可修改设置一：========================定义数据库类别，1为SQL数据库，0为Access数据库=============================
Const IsSqlDataBase = 1
'================================================================================================================
If IsSqlDataBase = 1 Then

	Db="db/ceshi001.mdb"
	'On Error Resume Next
	ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(Db) 


	'必修改设置二：========================SQL数据库设置=============================================================
	'sql数据库连接参数：数据库名(SqlDatabaseName)、用户密码(SqlPassword)、用户名(SqlUsername)、
	'连接名(SqlLocalName)（本地用local，外地用IP）
	Const SqlDatabaseName = "db/ceshi001.mdb"
	Const SqlUsername = "sa"
	Const SqlPassword = "588321com567"
	Const SqlLocalName = "local"
	'ConnStr = "Provider = Sqloledb; User ID = " & SqlUsername & "; Password = " & SqlPassword & "; Initial Catalog = " & SqlDatabaseName & "; Data Source = " & SqlLocalName & ";"
	'================================================================================================================
Else
    ConnStr = "Provider = Microsoft.Jet.OLEDB.4.0;Data Source = " & Server.MapPath(MyDbPath & db)
	SqlNowString = "Now()"
End If

If ShowErr="0" then
' On Error Resume Next
End If

Set Conn = server.createobject("ADODB.Connection")
'Response.Write ConnStr
Conn.open ConnStr
If Err Then
	Err.Clear
	Set Conn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If 

'防SQL注入设置
Url1=Request.QueryString
If instr(Url1,"'")>"0" or instr(Url1,"and")>"0" or instr(Url1,"select")>"0" then
	Response.write "<li>请勿非法操作</li><li>对此操作已进行记录</li>"
	Response.end()
End if


'读取系统设置	
MemberName=Request.Cookies ("membername")

'设置折扣数
Discount="0|1,1000|0.95,2000|0.9,3000|0.88,4000|0.85,5000|0.8,6000"   '用法每个级别用逗号隔开,大于等于这个值|所享受的折扣数

 %>