function submit_check()
{
	var user=document.getElementById('user');
	var password=document.getElementById('password');

	if (user.value==""){
		alert("管理员名称不能为空！");
		user.focus();
		return false;
	}
	if (password.value==""){
		alert("管理员密码不能为空！");
		password.focus();
		return false;
	}
	return true;
}

(function(){
	var o=document.getElementById('user');
	if(o){
		o.focus();
	}
})();
