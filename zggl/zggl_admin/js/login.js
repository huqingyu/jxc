function submit_check()
{
	var user=document.getElementById('user');
	var password=document.getElementById('password');

	if (user.value==""){
		alert("����Ա���Ʋ���Ϊ�գ�");
		user.focus();
		return false;
	}
	if (password.value==""){
		alert("����Ա���벻��Ϊ�գ�");
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
