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
	            pwderr.innerHTML="<font color=red>两次新密码不一致</font>  ";
	            return false;
	  }  
 
 Getajax(6,"password="+form.password.value+"&newpassword="+form.newpassword.value+"&codes="+escape(form.codes.value))
 }
 
function Getajax(act,url) 
{ //创建XMLHttpRequest对象
   var xmlhttp;
   try{xmlhttp=new XMLHttpRequest();}
   catch(e){xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
    //创建请求结果处理程序
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
    //打开连接，true表示异步提交
    xmlhttp.open("post", "member.asp", true);
    //当方法为post时需要如下设置http头
    xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    //发送数据
    xmlhttp.send("act="+act+"&"+url);
} 

function member1(Num)
{
	showvalues.innerHTML="<center>正在加载中,请稍候...</center>";
   	Getajax(Num,"m=1")
}

function PageTurning2(page)
{
	Getajax(3,"page="+ page)	
} 

function get_Code() {
	var Dv_CodeFile = "GetCode.asp";
	if(document.getElementById("imgid"))
		document.getElementById("imgid").innerHTML = '<img src="'+Dv_CodeFile+'?t='+Math.random()+'" alt="点击刷新验证码" style="cursor:pointer;border:0;vertical-align:middle;" onclick="this.src=\''+Dv_CodeFile+'?t=\'+Math.random()" />'
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
alert("复制成功，请粘贴到到其他网站，或用QQ，MSN发送给您的朋友！");}