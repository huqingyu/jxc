function PageTurning(page,key,keyword)
{
	Getajax(1,"page="+ page + "&keyword="+ escape(keyword) +"&key="+ key)	
} 

function searchuser()
{
	if (form1.keyword.value=="")
	   {alert("请输入要搜索的关键字");
	    form1.keyword.focus();
		return false;}
	Getajax(1,"page=1&keyword="+ escape(form1.keyword.value) +"&key="+ form1.key.value)	
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
				if (act==3)
				   {   if (values.indexOf("成功")!="-1")
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
    //打开连接，true表示异步提交
    xmlhttp.open("post", "userlist.asp", true);
    //当方法为post时需要如下设置http头
    xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    //发送数据
    xmlhttp.send("act="+act+"&"+url);
} 

function del(id,page,key,keyword)
{
	if(confirm('确定要删除该用户吗,删除后将不可再恢复!'))
	{Getajax(2,"account="+ id +"&page="+ page + "&keyword="+ keyword +"&key="+ key)}
	}
	
function adminlogin()
{
	if (document.getElementById("username").value=="")
	 {alert("请填写管理员帐号");
	  document.getElementById("username").focus();
	  return false;}
   if (document.getElementById("password").value=="")
	 {alert("请填写管理员密码");
	  document.getElementById("password").value.focus();
	  return false;}	
	Getajax(3,"username="+ escape(document.getElementById("username").value) +"&password="+ document.getElementById("password").value)  
	  
	}	