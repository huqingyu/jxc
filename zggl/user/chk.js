function chk()
 {
  form=document.form1;
  if (form.account.value=="")
      {form.account.focus();
	   form.account.style.background="#FFDBCA";
	   return false;}
  if (form.account.value.length<=3)
      {form.account.focus();
	   form.account.style.background="#FFDBCA";
	   return false;} 
  if (form.password.value=="")
      {form.password.focus();
	   form.password.style.background="#FFDBCA";
	   return false;  }
  if (form.password1.value=="")
      {form.password1.focus();
	   form.password1.style.background="#FFDBCA";
	   return false;}
  if (form.password1.value!=form.password.value)
      {form.password1.focus();
	   form.password1.style.background="#FFDBCA";
	   pwderr.innerHTML="<font color=red>�������벻һ��</font>  ";
	   return false;}  
  if (form.username.value=="")
      {form.username.focus();
	   form.username.style.background="#FFDBCA";
	   return false;}   
  if (form.nativenumber.value=="")
      {form.nativenumber.focus();
	   form.nativenumber.style.background="#FFDBCA";
	   return false;} 
  if (form.nativenumber.value.length<=14)
      {form.nativenumber.focus();
	   form.nativenumber.style.background="#FFDBCA";
	   idcard.innerHTML="<font color=red>λ������ȷ</font>  ";
	   return false;} 
  if (form.email.value=="")
      {form.email.focus();
	   form.email.style.background="#FFDBCA";
	   return false;} 
  if (form.telephone.value=="")
      {form.telephone.focus();
	   form.telephone.style.background="#FFDBCA";
	   return false;}  
  if (form.codes.value=="")
      {form.codes.focus();
	   form.codes.style.background="#FFDBCA";
	   return false;}  
  var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  if(!myreg.test(form.email.value))
      {form.email.focus();
	   form.email.style.background="#FFDBCA";
	   yxgs.innerHTML="<font color=red>�����ʽ����</font>  ";
	   return false;}	   
  if (form.agree.checked==false)
      {alert("�������<<��������ͨ��֤�û�����Э��>> ���ܽ�����һ��");
	  return false;}
	regloading.innerHTML='<font color=red>�����ύע����,���Ժ�....</font>'
	Getajax(1,"account="+escape(form.account.value)+"&password="+form.password.value+"&username="+escape(form.username.value)+"&nativenumber="+form.nativenumber.value+"&email="+form.email.value+"&telephone="+form.telephone.value+"&codes="+escape(form.codes.value)+"&ptname="+escape(form.ptname.value))
 }
 
function Getajax(act,url) 
{ //����XMLHttpRequest����
var xmlHttp = false;
try {
 xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
 try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
 } catch (e2) {
    xmlHttp = false;
 }
}
    //�����������������
    xmlHttp.onreadystatechange=function(){
        if (4==xmlHttp.readyState){
            if (200==xmlHttp.status){
                var values=xmlHttp.responseText;
				alert(values);
				regloading.innerHTML=values;
				
				if (act==0)
				  {
					regtitle.innerHTML=values;
				  }
				else if (act==1)
				  {
				    if (values.indexOf("ע��ɹ�")!="-1")
				       {window.location.href="RegSuccess.asp?a="+ form.account.value +"&id="+ form.nativenumber.value+"&E="+ form.email.value;}
					 if (values.indexOf("��֤���������������")!="-1")
				       {get_Code();}
				  } 
			   else if (act==2)
			    {
					if (values.indexOf("��½�ɹ�")!="-1")
				       {window.location.href="UserIndex.asp";}
					else
					   {alert(values);
					    form1.PassWord.value="";
						form1.PassWord.focus();}				 
				}
			   else if (act==3)
			    {
					if (values.indexOf("�ɹ�")!="-1")
				       {lp.innerHTML=values;}			 
				}	
			  else if (act==4)
			    {  if (values.indexOf("����")!="-1")
				    {
					 get_Code();
					}
					else
					{
					lp.innerHTML=values;
					 get_Code();
					 }
				 }	
            }else{
				alert(xmlHttp.status);
			}
        }
    }
    //�����ӣ�true��ʾ�첽�ύ
    xmlHttp.open("post", "SaveReg.asp", true);
    //������Ϊpostʱ��Ҫ��������httpͷ
    xmlHttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    //��������
    xmlHttp.send("act="+act+"&"+url);
} 
function jc(value)
 {
	 if (value.length>3)
	 {document.form1.account.style.background='#FFFFFF';
	  regtitle.innerHTML="<font color='#006600'>���ڼ���Ƿ��ע��</font>  ";
	  Getajax(0,"account="+escape(value));
	  }
  }
  
function get_Code() {
	var Dv_CodeFile = "GetCode.asp";
	if(document.getElementById("imgid"))
		document.getElementById("imgid").innerHTML = '<img src="'+Dv_CodeFile+'?t='+Math.random()+'" alt="���ˢ����֤��" style="cursor:pointer;border:0;vertical-align:middle;" onclick="this.src=\''+Dv_CodeFile+'?t=\'+Math.random()" />';
}

function loginchk()
 {
	  if (form1.UserName.value=="")
	  {alert("����дͨ��֤�˺�");
	   form1.UserName.focus();
	   return false;}
	  if (form1.PassWord.value=="")
	  {alert("����д����");
	   form1.PassWord.focus();
	   return false;}
	  Getajax(2,"UserName="+escape(form1.UserName.value)+"&PassWord="+ form1.PassWord.value);
  }
  
function lostpwd()
 {
	  if (form1.nativenumber.value=="")
	  {alert("����дͨ��֤�˺�");
	   form1.nativenumber.focus();
	   return false;}
	  if (form1.email.value=="")
	  {alert("����д���֤����");
	   form1.email.focus();
	   return false;}
	  if (form1.codes.value=="")
	  {alert("����д��Կ����");
	   form1.codes.focus();
	   return false;}
	  Getajax(3,"account="+escape(form1.account.value)+"&nativenumber="+ form1.nativenumber.value +"&email="+ form1.email.value +"&codes="+escape(form1.codes.value));
  }
  
function lpwd()
{
	if (document.form1.account.value=="")
        {
			alert("����дҪѰ��������ʻ�����");
			document.form1.account.focus();
			return false;
		}
	if (document.form1.codes.value=="")
        {
			alert("����д��֤��");
			document.codes.focus();
			return false;
		}
	Getajax(4,"account="+escape(form1.account.value)+"&codes="+escape(form1.codes.value));
}
