<%
Pwd = "xxx"
Email = "xxx@qq.com"

Set jmail = Server.CreateObject("JMAIL.Message")    '���������ʼ��Ķ���
jmail.silent = false                          '����������󣬷���FALSE��TRUE��ֵ
jmail.logging = true                          '�����ʼ���־
jmail.Charset = "GBK"                         '�ʼ������ֱ���Ϊ����
jmail.ContentType = "text/html"               '�ʼ��ĸ�ʽΪHTML��ʽ
jmail.AddRecipient Email                      '�ʼ��ռ��˵ĵ�ַ
jmail.From = "xxx@qq.com"                 '�����˵�E-MAIL��ַ
jmail.MailServerUserName = "xxx@qq.com"   '��¼�ʼ�������������û���
jmail.MailServerPassword = Pwd                  '��¼�ʼ����������������
jmail.Subject = "Jmail�ʼ�test"                   '�ʼ��ı��� 
jmail.Body = "Jmail�ʼ�����"                  '�ʼ�������
jmail.Priority = 1                            '�ʼ��Ľ�������1 Ϊ��죬5 Ϊ������ 3 ΪĬ��ֵ
jmail.Send("smtp.qq.com")                  'ִ���ʼ����ͣ�ͨ���ʼ���������ַ�������޸ĳ�����ʼ�������SMTP��ַ
jmail.Close()                                 '�رն���

%>