function editpwd()
 {
  form=document.form1
  if (form.password.value=="")
     {
		 form.password.focus();
	     form.password.style.background="#FFDBCA";
		 return false;
	 }
  if (form.newpassword.value=="")
     {
		 form.newpassword.focus();
	     form.newpassword.style.background="#FFDBCA";
		 return false;
	 }
 
  if (form.newpassword.value!=form.newpassword1.value)
      {
				form.newpassword1.value="";
				form.newpassword1.focus();
	            form.newpassword1.style.background="#FFDBCA";
	            pwderr.innerHTML="<font color=red>���������벻һ��</font>  ";
	            return false;
	  }  
 
 Getajax(6,"password="+form.password.value+"&newpassword="+form.newpassword.value+"&codes="+escape(form.codes.value))
 }
 
function Getajax(act,url) 
{ //����XMLHttpRequest����
   var xmlhttp;
   try{xmlhttp=new XMLHttpRequest();}
   catch(e){xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
    //�����������������
    xmlhttp.onreadystatechange=function(){
        if (4==xmlhttp.readyState){
            if (200==xmlhttp.status){
                var values=xmlhttp.responseText;
				if (act<=5)
				  {showvalues.innerHTML=values;}
				if (act==6)
				  {alert(values);
				   member1(1);}
				if (act==7)
				  {alert(values);
				   member1(1);}
            }
			else
			{alert(xmlhttp.responseText)}
        }
    }
    //�����ӣ�true��ʾ�첽�ύ
    xmlhttp.open("post", "member.asp", true);
    //������Ϊpostʱ��Ҫ��������httpͷ
    xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    //��������
    xmlhttp.send("act="+act+"&"+url);
} 

function member1(Num)
{
	showvalues.innerHTML="<center>���ڼ�����,���Ժ�...</center>";
   	Getajax(Num,"m=1")
}

function PageTurning2(page)
{
	Getajax(3,"page="+ page)	
} 

function get_Code() {
	var Dv_CodeFile = "GetCode.asp";
	if(document.getElementById("imgid"))
		document.getElementById("imgid").innerHTML = '<img src="'+Dv_CodeFile+'?t='+Math.random()+'" alt="���ˢ����֤��" style="cursor:pointer;border:0;vertical-align:middle;" onclick="this.src=\''+Dv_CodeFile+'?t=\'+Math.random()" />'
}

function editzl()
{
  form=document.form1
    if (form.email.value=="")
     {
		 form.email.focus();
	     form.email.style.background="#FFDBCA";
		 return false; }
  if (form.telephone.value=="")
     {
		 form.telephone.focus();
	     form.telephone.style.background="#FFDBCA";
		 return false;
	 } 	 
 	Getajax(7,"email="+form.email.value+"&telephone="+form.telephone.value) 
}

function copyMessage() 
{window.clipboardData.setData('text',document.getElementById("tjurl").value);
alert("���Ƴɹ�����ճ������������վ������QQ��MSN���͸��������ѣ�");}