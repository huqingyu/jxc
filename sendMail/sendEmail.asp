<% 
ToEmail = "51968867@qq.com"
MyEmail = "xxx@qq.com"
MyPwd = "xxx"

title = Trim(Request.Form("txtTitle"))
mail_body = Trim(Request.Form("txtBody"))

Const cdoSendUsingMethod="http://schemas.microsoft.com/cdo/configuration/sendusing" 
Const cdoSendUsingPort=2 
Const cdoSMTPServer="http://schemas.microsoft.com/cdo/configuration/smtpserver" 
Const cdoSMTPServerPort="http://schemas.microsoft.com/cdo/configuration/smtpserverport" 
Const cdoSMTPConnectionTimeout="http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout" 
Const cdoSMTPAuthenticate="http://schemas.microsoft.com/cdo/configuration/smtpauthenticate" 
Const cdoBasic=1 
Const cdoSendUserName="http://schemas.microsoft.com/cdo/configuration/sendusername" 
Const cdoSendPassword="http://schemas.microsoft.com/cdo/configuration/sendpassword" 

Dim objConfig ' As CDO.Configuration 
Dim objMessage ' As CDO.Message 
Dim Fields ' As ADODB.Fields 

Set objConfig = Server.CreateObject("CDO.Configuration") 
Set Fields = objConfig.Fields 

With Fields 
.Item(cdoSendUsingMethod) = cdoSendUsingPort 
.Item(cdoSMTPServer) = "smtp.qq.com"
.Item(cdoSMTPServerPort) = 25 
.Item(cdoSMTPConnectionTimeout) = 10 
.Item(cdoSMTPAuthenticate) = cdoBasic 
.Item(cdoSendUserName) = MyEmail
.Item(cdoSendPassword) = MyPwd
.Update 
End With 

Set objMessage = Server.CreateObject("CDO.Message") 
Set objMessage.Configuration = objConfig 

With objMessage 
.To = ToEmail
.From = MyEmail
.Subject = title
.TextBody = mail_body
.Send 
End With 

Set Fields = Nothing 
Set objMessage = Nothing 
Set objConfig = Nothing 
%> 
