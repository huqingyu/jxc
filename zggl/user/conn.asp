<%
Response.AddHeader "Cache-Control","no-cache,must-revalidate" 

Dim Conn,Plus_Conn,Db,MyDbPath,SiteName,SiteUrl,AdminLoginCode,ConnStr
AdminLoginCode="***" '��ȫ������
PATH_INFO=request.servervariables("PATH_INFO")
PATH=split(PATH_INFO,"/")
If Ubound(PATH)=<2 Then
  MyDbPath = "/"
Else
  MyDbPath = "/"&PATH(1)&"/"
End if  
Db = "/***.mdb"
ShowErr="1" '�Ƿ������ԣ�1Ϊ��ʾ������Ϣ��0Ϊ����ʾ������Ϣ��������վ�������к�����0

'���޸�����һ��========================�������ݿ����1ΪSQL���ݿ⣬0ΪAccess���ݿ�=============================
Const IsSqlDataBase = 1
'================================================================================================================
If IsSqlDataBase = 1 Then

	Db="db/ceshi001.mdb"
	'On Error Resume Next
	ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(Db) 


	'���޸����ö���========================SQL���ݿ�����=============================================================
	'sql���ݿ����Ӳ��������ݿ���(SqlDatabaseName)���û�����(SqlPassword)���û���(SqlUsername)��
	'������(SqlLocalName)��������local�������IP��
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
	Response.Write "���ݿ����ӳ������������ִ���"
	Response.End
End If 

'��SQLע������
Url1=Request.QueryString
If instr(Url1,"'")>"0" or instr(Url1,"and")>"0" or instr(Url1,"select")>"0" then
	Response.write "<li>����Ƿ�����</li><li>�Դ˲����ѽ��м�¼</li>"
	Response.end()
End if


'��ȡϵͳ����	
MemberName=Request.Cookies ("membername")

'�����ۿ���
Discount="0|1,1000|0.95,2000|0.9,3000|0.88,4000|0.85,5000|0.8,6000"   '�÷�ÿ�������ö��Ÿ���,���ڵ������ֵ|�����ܵ��ۿ���

 %>