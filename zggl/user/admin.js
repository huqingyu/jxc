function PageTurning(page,key,keyword)
{
	Getajax(1,"page="+ page + "&keyword="+ escape(keyword) +"&key="+ key)	
} 

function searchuser()
{
	if (form1.keyword.value=="")
	   {alert("������Ҫ�����Ĺؼ���");
	    form1.keyword.focus();
		return false;}
	Getajax(1,"page=1&keyword="+ escape(form1.keyword.value) +"&key="+ form1.key.value)	
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
				if (act==3)
				   {   if (values.indexOf("�ɹ�")!="-1")
					       {PageTurning(1,'0','0')}
						else
						   {alert(values)}
				   }
				else
				  {userlists.innerHTML=values}
				// userlists.innerHTML=values;
				//alert(values)
            }
			else
			{alert(xmlhttp.responseText)}
        }
    }
    //�����ӣ�true��ʾ�첽�ύ
    xmlhttp.open("post", "userlist.asp", true);
    //������Ϊpostʱ��Ҫ��������httpͷ
    xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    //��������
    xmlhttp.send("act="+act+"&"+url);
} 

function del(id,page,key,keyword)
{
	if(confirm('ȷ��Ҫɾ�����û���,ɾ���󽫲����ٻָ�!'))
	{Getajax(2,"account="+ id +"&page="+ page + "&keyword="+ keyword +"&key="+ key)}
	}
	
function adminlogin()
{
	if (document.getElementById("username").value=="")
	 {alert("����д����Ա�ʺ�");
	  document.getElementById("username").focus();
	  return false;}
   if (document.getElementById("password").value=="")
	 {alert("����д����Ա����");
	  document.getElementById("password").value.focus();
	  return false;}	
	Getajax(3,"username="+ escape(document.getElementById("username").value) +"&password="+ document.getElementById("password").value)  
	  
	}	